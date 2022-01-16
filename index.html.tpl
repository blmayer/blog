<!DOCTYPE html>
<html lang="en">
{{static/head.html}}

<body>
    <h1>blmayer's blog page</h1>
    <h2>Posts</h2>
    {{!tree -H '' -P '*.tpl' | tail -n +31 | head -n -16 | sed 's/.tpl//g'}}
</body>

</html>
