<!DOCTYPE html>
<html lang="en">
{{head.html}}

<body>
    <header>
        <h1>blmayer's blog page</h1>
        <a href="https://raw.githubusercontent.com/blmayer/blog/main/index.html.tpl">View Sauce</a>
    </header>
    <main>
        <h2>Posts</h2>
        {{!tree -H 'posts' -P '*.tpl' -r posts | tail -n +31 | head -n -16 | sed 's/.tpl//g'}}
    </main>
</body>

</html>
