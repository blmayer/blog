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
</body>

</html>
