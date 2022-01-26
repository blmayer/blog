<!DOCTYPE html>
<html lang="en">
{{head.html}}

<body>
    <header>
        <h1>blmayer's blog page</h1>
        <a class="button" href="https://raw.githubusercontent.com/blmayer/blog/main/index.html.tpl">View Sauce</a>
    </header>
    <p>a developer walks into a bar...</p>
    <article>
        <b>posts:</b>
        <ul>
            {{!for p in $(ls -r posts/*.html*); do p=${p/.tpl/} && echo '<li><a href="'"$p"'">'"$(basename $p)</a></li><br>";done}}
        </ul>
        <p>
            This work © 2022 by Brian Mayer is licensed under
            <a href="https://creativecommons.org/licenses/by/4.0/">CC BY 4.0</a>.
        </p>
    </article>
    <div style="display: grid;grid-gap: 30px 20px;grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));">
    <section>
    <a class="button" href="/feed.xml">RSS</a>
    <a class="button" href="https://blmayer.dev/whoami.html">About the author</a>
    <article>
        <b>what is this?</b>
	<p>
	    this is a small space on the internet, like a bar, where i'd
	    like to share some thoughts in a casual way. you'll find here
	    topics like programming, linux, mathematics and some random
	    stuff.
	</p>
    </article>
    </section>
    <section>
    <article>
	<b>links</b>
        <ul>
	    <li><a href="https://blmayer.dev">my portfolio</a></li><br>
	    <li><a href="https://somafm.com">soma fm</a>, a radio i like</li><br>
	    <li><a href="https://tilde.town/users.html">webring</a></li><br>
	    <li><a href="https://gossipsweb.net">handmade websites</a>, another</li><br>
        </ul>
    </article>
    </section>
    </div>
</body>

</html>
