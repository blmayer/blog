<!DOCTYPE html>
<html lang="en">
{{head.html}}

<body>
    <h1>blmayer's blog page</h1>
    <main>
        <h2>Posts</h2>
        {{!tree -H 'posts' -P '*.tpl' -r posts | tail -n +31 | head -n -16 | sed 's/.tpl//g'}}
    </main>
</body>

</html>