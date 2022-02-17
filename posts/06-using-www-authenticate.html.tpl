<!DOCTYPE html>
<html lang="pt">
<head>
    <title>using www-authenticate for user authentication</title>
	<meta name="revised" content="2022-02-17">
	<meta name="description" content="This article explains how to use the www-authenticate header to handle user authentication without any client side code.">
	<style>
		{{posts.css}}
	</style>
</head>

<body>
    <a class="button" href="/">Go Back</a>
	<h2>user authentication without cookies or javascript</h2>
	<p>
		user authentication is a complicated subject, and we can make
		things even harder if we don't want to use cookies or javascript.
		authentication is a necessity for almost all web services we see,
		and there are many tools and protocols to aid developers on the
		subject. using the www-authenticate header i was able to handle
		user sessions without any code on the client side, just some tweaks
		on my backend. the documentation for the standard is available in [1].
	</p>
	<p>
		the http www-authenticate header is a powerfull tool and part of the
		basic http authentication standard, but i only became aware of it
		recently, in this post i'll tell how i used it to handle user sessions
		on my project <a href="https://tasker.blmayer.dev">tasker</a>.
	</p>
	<p>
		before we start, let me give a quick overview of the solution.
	</p>
	<h3>pros</h3>
	<ul>
		<li>no cookies</li>
		<li>no javascript needed</li>
		<li>simple to implement</li>
		<li>has many security options to choose</li>
	</ul>
	<h3>cons</h3>
	<ul>
		<li>some mobile browsers have issues</li>
		<li>browser interface is simple and not customizable</li>
		<li>it is somewhat limited</li>
	</ul>
	
	<h3>implementation</h3>
	<p>
		basically all we have to do is add the http header:
		<kbd>WWW-Authenticate</kbd> on a response with status 401.
		this will make browsers to show a dialog for the user to
		prompt for the credentials. doing this the browser will
		automaticaly send the <kbd>Authorization: ...</kbd> header
		on requests.
	</p>
	<p>
		this can be done when the user visits a login page or tries
		to access private content. in my case i added it to a login
		page. the code goes like this:
	</p>
	<pre>
func login(w http.ResponseWriter, r *http.Request) {
	user, pass, ok := r.BasicAuth()
	if !ok {
		// the user is not logged in (didn't send credentials)
		w.Header().Set("WWW-Authenticate", "Basic")
		w.WriteHeader(http.StatusUnauthorized)
		return
	}

	// check credentials
	...

	// if ok redirect the user to its content
	http.Redirect(w, r, "/user.html", http.StatusFound)
}</pre>
	<p>
		i am using the Basic authorization scheme, but many others
		are supported, e.g. digest using MD5, SHA256 and so on, the
		RFC 7616 [2] has all info needed.
	</p>

	<h3>logging in</h3>
	<p>
		the way i designed the login flux is the following:
	</p>
	<ol>
		<li>user requests the <em>/login</em> page without authorization header</li>
		<li>
			the server responds with <kbd>401</kbd> and includes the
			<kbd>WWW-Authenticate</kbd> header
		</li>
		<li>
			the user fills username and password and request the same path but
			now the browser includes the authorization header
		</li>
		<li>
			the server checks the credentials and if OK sends a redirect status,
			e.g. <kbd>301</kbd>, with the location of the new page. if not OK
			the server an error page, so the user can retry after a refresh
		</li>
	</ol>
	<p>
		when browsers receive this header in the response they open a
		dialog for the user, some aspects can be set, for example, if
		<em>realm</em> is set on the header it will be displayed for the
		user, but be carefull, this option serves a purpose, check [1] for
		more info. The dialog looks like this on chromium: 
	</p>
	<center>
		<img src="chromium-dialog.png" alt="Chromium login dialog">
	</center>
	<p>
		cliking sign in makes the browser to repeat the request but with the
		<kbd>Authorization: ...</kbd> header on, as i set it to <kbd>Basic</kbd>
		scheme the browser will send the credentials base64 encoded.
	</p>
	<p>
		the nice thing about this is that the browser will keep sending the
		credentials to subsequent requests of the same domain until it receives
		a <kbd>401</kbd> status as response.
	</p>

	<h3>server code for logged in users</h3>
	<p>
		now the users can log in, every time a private page is requested we
		must check the credentials, in this project i used the <kbd>Basic</kbd>
		scheme so i check it using go's propper http functions:
	</p>
	<pre>
user, pass, ok := r.BasicAuth()
if !ok {
	w.Header().Set("WWW-Authenticate", "Basic")
	w.WriteHeader(http.StatusUnauthorized)
	// send an error page
	return
}

// check user and pass
...

// serve your content
</pre>
	<p>
		this way if a request comes unauthenticated for some reason the server
		will ask again for credentials. another option here would be to
		redirect the user to the login page.
	</p>
	
	<h3>logging out</h3>
	<p>
		logging out is done by simply returning a <kbd>401</kbd> without
		www-authenticate header:
	</p>
	<pre>
func logout(w http.ResponseWriter, r *http.Request) {
	w.WriteHeader(http.StatusUnauthorized)
	// serve a logout html page
	...
}</pre>

	<h3>final remarks</h3>
	<p>
		this is the method i'm using right now and i find it pretty good: it
		uses only standard features that are there for years, nothing new;
		there is no client side javascript or cookies, which makes it 
		easy to maintain and satisfy even the most demanding users.
	</p>
	<footer>
		<hr>
		<p><b>References:</b></p>
		<ol>
			<li>
				<a href="https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/WWW-Authenticate">
					MDN docs</a>
			</li>
			<li>
				<a href="https://datatracker.ietf.org/doc/html/rfc7616">
					RFC 7616
				</a>
			</li>
		</ol>
	</footer>
</body>
</html>
