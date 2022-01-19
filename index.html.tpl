<!DOCTYPE html>
<html lang="en">
{{head.html}}

<body>
    <header>
        <h1>blmayer's blog page</h1>
        <a href="https://raw.githubusercontent.com/blmayer/blog/main/index.html.tpl">View Sauce</a>
    </header>
    <center>
        <pre>
|"""""""i"""""""""""""i"""""""""""""i"""""""""""""i"""""""""""""i"""""""|
|""3D"""""X"""""3D"""""X"""""3D"""""X"""""3D"""""X"""""3D"""""X"""""3D""|
|["""""""""]X["""""""""]X["""""""""]X["""""""""]X["""""""""]X["""""""""]|
|"XXX""SIG"""XXX""SIG"""XXX""SIG"""XXX""SIG"""XXX""SIG"""XXX""SIG"""XXX"|
|""""XXX"""""""XXX"""""""XXX"""""""XXX"""""""XXX"""""""XXX"""""""XXX""""|
|X["LS"]XXX["LS"]XXX["LS"]XXX["LS"]XXX["LS"]XXX["LS"]XXX["LS"]XXX["LS"]X|
|"XXXXX"""XXXXX"""XXXXX"""XXXXX"""XXXXX"""XXXXX"""XXXXX"""XXXXX"""XXXXX"|
|XXX""XXXXX""XXXXX""XXXXX""XXXXX""XXXXX""XXXXX""XXXXX""XXXXX""XXXXX""XXX|
    </pre>
    </center>
    <main>
        <h2>Posts</h2>
        {{!tree -H 'posts' -P '*.tpl' -r posts | tail -n +31 | head -n -16 | sed 's/.tpl//g'}}
    </main>
</body>

</html>