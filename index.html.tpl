<!DOCTYPE html>
<html lang="en">
{{head.html}}

<body>
    <h1>blmayer's blog page</h1>
    <h2>Posts</h2>
    {{!tree -H 'posts' -P '*.tpl' posts | tail -n +31 | head -n -16 | sed 's/.tpl//g'}}
</body>

</html>
