<!DOCTYPE html>
<html lang="en">
{{head.html}}

<body>
    <header>
        <h1>blmayer's blog page</h1>
        <a class="button" href="https://raw.githubusercontent.com/blmayer/blog/main/index.html.tpl">View Sauce</a>
    </header>
    <main>
        posts
	<br>
        {{!tree -H 'posts' -P '*.tpl' -r posts | tail -n +32 | head -n -16 | sed 's/.tpl//g'}}
    </main>
    <br>
    <a class="button" href="/feed.xml">RSS</a>
    <a class="button" href="https://blmayer.dev/whoami.html">About the author</a>
    <footer>
    <p>
	This work © 2022 by Brian Mayer is licensed under <a href="https://creativecommons.org/licenses/by/4.0/">CC BY 4.0</a>.
    </p>
    </footer>
</body>

</html>
