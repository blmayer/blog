<!DOCTYPE html>
<html lang="en">

<head>
    {{head.html}}
    <style>
        {{index.css}}
    </style>
</head>

<body>
    <header>
        <h1>the sauce code blog</h1>
        <a class="button" href="https://github.com/blmayer/blog">View Sauce</a>
    </header>
    <p><em>a developer walks into a bar...</em></p>
    <main>
        <b>posts</b>
        <p>
        {{!for p in $(ls -r posts/*.html*); do l=${p/.tpl/} && echo '<a href="'"$l"'">'"$(grep '<title>' "$p" | sed 's@ *</\?title> *@@g')</a><br>";done}}
        </p>
    </main>
    <div style="display: grid;grid-gap: 30px 20px;grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));">
        <section>
            <a class="button" href="/feed.xml">RSS</a>
            <a class="button" href="https://blmayer.dev/whoami.html">About the author</a>
            <aside>
                <b>what is this?</b>
                <p>
                    this is a small space on the internet, like a bar, where i'd
                    like to share some thoughts in a casual way. you'll find here
                    topics like programming, linux, mathematics and some random
                    stuff.
                </p>
            </aside>
        </section>
        <section>
            <aside>
                <b>links</b>
                <p>
                    <a href="https://blmayer.dev">my portfolio</a><br>
                    <a href="https://somafm.com">soma fm</a>, a radio i like<br>
                    <a href="https://tilde.town/users.html">webring</a><br>
                    <a href="https://veneno.live/">radio veneno</a><br>
                    <a href="https://gossipsweb.net">handmade websites</a><br>
                    <a href="https://mussumipsum.com/">mussum ipsum</a><br>
                    <a href="https://sebomosaico.com.br/">sebo mosaico</a><br>
                    <a href="https://angekold.goomer.app">angekold</a>, artisanal cold brew<br>
                <p>
            </aside>
        </section>
         <p>
            This work © 2022 by Brian Mayer is licensed under
            <a href="https://creativecommons.org/licenses/by/4.0/">CC BY 4.0</a>.
        </p>
    </div>
</body>

</html>
