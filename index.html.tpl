<!DOCTYPE html>
<html lang="en">
{{head.html}}

<body>
    <header>
        <h1>blmayer's blog page</h1>
        <a class="button" href="https://raw.githubusercontent.com/blmayer/blog/main/index.html.tpl">View Sauce</a>
    </header>
    <main>
        <b>posts:</b>
        <ul>
            {{!for p in $(ls -r posts/*.html*); do p=${p/.tpl/} && echo "<li><a href=\"$p\">$(basename $p)</a></li><br>";done}}
        </ul>
    </main>
    <br>
    <a class="button" href="/feed.xml">RSS</a>
    <a class="button" href="https://blmayer.dev/whoami.html">About the author</a>
    <footer>
        <p>
            This work © 2022 by Brian Mayer is licensed under <a href="https://creativecommons.org/licenses/by/4.0/">CC
                BY 4.0</a>.
        </p>
    </footer>
</body>

</html>