<!DOCTYPE html>
<html lang="en">
{{head.html}}

<body>
    <header>
        <h1>blmayer's blog page</h1>
        <a href="https://raw.githubusercontent.com/blmayer/blog/main/index.html.tpl">View Sauce</a>
    </header>
    <!--
    <center>
        <pre>|"""""""i"""""""""""""i"""""""""""""i"""""""""""""i"""""""""""""i"""""""|
|""3D"""""X"""""3D"""""X"""""3D"""""X"""""3D"""""X"""""3D"""""X"""""3D""|
|["""""""""]X["""""""""]X["""""""""]X["""""""""]X["""""""""]X["""""""""]|
|"XXX""SIG"""XXX""SIG"""XXX""SIG"""XXX""SIG"""XXX""SIG"""XXX""SIG"""XXX"|
|""""XXX"""""""XXX"""""""XXX"""""""XXX"""""""XXX"""""""XXX"""""""XXX""""|
|X["LS"]XXX["LS"]XXX["LS"]XXX["LS"]XXX["LS"]XXX["LS"]XXX["LS"]XXX["LS"]X|
|"XXXXX"""XXXXX"""XXXXX"""XXXXX"""XXXXX"""XXXXX"""XXXXX"""XXXXX"""XXXXX"|
|XXX""XXXXX""XXXXX""XXXXX""XXXXX""XXXXX""XXXXX""XXXXX""XXXXX""XXXXX""XXX|</pre>
    </center>
    <svg style="/*! color: white; */width: 100%;font-family: mono;" viewBox="0 0 740 140">
  <text y="15" style="/*! color: white; */fill: white;" x="0">|"""""""i"""""""""""""i"""""""""""""i"""""""""""""i"""""""""""""i"""""""|
   <tspan x="0" dy="1.0em">|""3D"""""X"""""3D"""""X"""""3D"""""X"""""3D"""""X"""""3D"""""X"""""3D""|</tspan>
 <tspan x="0" style="/*! fill: white; */" dy="1em">|["""""""""]X["""""""""]X["""""""""]X["""""""""]X["""""""""]X["""""""""]|</tspan>
  
   <tspan x="0" dy="1em">|"XXX""SIG"""XXX""SIG"""XXX""SIG"""XXX""SIG"""XXX""SIG"""XXX""SIG"""XXX"|</tspan>
  
   <tspan x="0" dy="1em">|""""XXX"""""""XXX"""""""XXX"""""""XXX"""""""XXX"""""""XXX"""""""XXX""""|</tspan>
  
   <tspan x="0" dy="1em">|X["LS"]XXX["LS"]XXX["LS"]XXX["LS"]XXX["LS"]XXX["LS"]XXX["LS"]XXX["LS"]X|</tspan>
  
   <tspan x="0" dy="1em">|"XXXXX"""XXXXX"""XXXXX"""XXXXX"""XXXXX"""XXXXX"""XXXXX"""XXXXX"""XXXXX"|</tspan>

<tspan x="0" dy="1em">|XXX""XXXXX""XXXXX""XXXXX""XXXXX""XXXXX""XXXXX""XXXXX""XXXXX""XXXXX""XXX|</tspan>
</text>
</svg>
-->
    <main>
        <h2>Posts</h2>
        {{!tree -H 'posts' -P '*.tpl' -r posts | tail -n +31 | head -n -16 | sed 's/.tpl//g'}}
    </main>
</body>

</html>
