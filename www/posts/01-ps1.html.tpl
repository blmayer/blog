<!DOCTYPE html>
<html lang="en">
<head>
    <title>my PS1 variable</title>
    <meta name="description" content="A hint about using PS1 variable">
    <meta name="revised" content="2021-11-02">
	<style>
		{{posts.css}}
	</style>
</head>

<body>
    <a class="button" href="/">Go Back</a>
    <h2><a name="ps1">my PS1 variable</a></h2>
    <p>
        I often use the linux terminal, and one thing that I use to help
        me on my day is to use the history to see past commands:
    </p>
    <img src="history.png" alt="history">
    <p>
        Then I run the command with <tt>!</tt>, e.g.: <tt>!76</tt>. As I
        do this frequently, one thing that makes this process faster is
        my shell prompt showing each history number:
    </p>
    <img src="prompt.png" alt="prompt">
    <p>
        So it's easy to re-run commands. To show the command number on
        your prompt add <tt>\!</tt>. To your PS1 definition. Mine one is:
    </p>
    <pre>"\u@\w \! $ "</pre>
</body>

</html>
