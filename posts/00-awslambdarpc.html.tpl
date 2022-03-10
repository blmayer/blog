<!DOCTYPE html>
<html lang="en">
<head>
	<title>running and debugging go lambda functions locally</title>
    <meta name="description" content="A small project of mine that I also published on Medium">
    <meta name="revised" content="2021-10-18">
	<style>
		{{posts.css}}
	</style>
</head>

<body>
    <a class="button" href="/">Go Back</a>
	<h2>Running and debugging Go Lambda functions locally</h2>
	<p>
        A solution without CLIs, Docker or big frameworks; just a binary,
        a debugger and simple configs.
    </p>
    <p>
        Debugging locally a lambda function written in Go is not a trivial
        task, this article is my trial at this subject, it represents the
        result of a week of intense research and frustration pursuing a thing
        that should be trivial for any developer: running your code on your
        machine and attaching a debugger to it. This setup it great for
        development and essential for building high quality software, but even
        after days of effort I wasn't able to properly step-through my code, so
        I gave up and decided to do thing the old way.
        After trying various approaches with recommended tools like 
        <kbd>aws-sam-cli</kbd> and the <em>serverless-framework</em> with no
        success, I ended up with a very simple setup that let me step-through
        my code, check values and dig into the function execution, with the
        real debugging, and it was adopted in the back-end team at my company.
    </p>
    <p>
        So here it goes. The setup is basically the following:
    </p>
    <ol>
        <li>Build your lambda function with debugging symbols</li>
        <li>Run it and attach the debugger</li>
        <li>Make a RPC call to it using a client (included here)</li>
        <li>Follow the code execution on visual studio</li>
    </ol>
    <center>
        <img src="vscode-files.png" alt="VSCode files needed">    
    </center>

    <h3>Needed software</h3>
    <ul>
        <li>
            go package <a href="https://github.com/go-delve/delve">delve</a>
            , install it running:
            <kbd>go get github.com/go-delve/delve/cmd/dlv</kbd>
        </li>
        <li>
            go package
            <a href="https://github.com/blmayer/awslambdarpc">awslambdarpc</a>,
            install running <kbd>go get github.com/blmayer/awslambdarpc</kbd>
        </li>
        <li>I used visual studio code but it should work on other IDEs</li>
        <li>
            And for convenience and speed, the
            <a href="https://marketplace.visualstudio.com/items?itemName=DmitriyMuraviov.lunatic-file-picker">file-picker</a> 
            VSCode extension.
        </li>
    </ul>
    <p>
        Make sure your <em>$GOPATH/bin</em> folder is in your <em>path</em> so
        that VSCode can find them.
    </p>
    
    <h3>Before we start</h3>
    <p>
        Just a little brief, a lambda function is basically a RPC
        (remote procedure call) server, and RPC servers work in a different
        way: they advertise methods that they have available, and clients call
        these methods passing its name and the arguments needed, if any. In a
        lambda function the function exposed is called <kbd>Invoke()</kbd> and
        it's defined on the <kbd>Function</kbd> type, so the method called is:
        <kbd>Function.Invoke</kbd>, this function takes only one argument: an
        <em>InvokeRequest</em>. This type is defined in the 
        <kbd>aws-lambda-go/lambda/messages</kbd> package, and it's defined as:
    </p>
    <pre>
type InvokeRequest struct {
    Payload               []byte
    RequestId             string
    XAmznTraceId          string
    Deadline              InvokeRequest_Timestamp
    InvokedFunctionArn    string
    CognitoIdentityId     string
    CognitoIdentityPoolId string
    ClientContext         []byte
}</pre>
    <p>
        Luckily the only field that matters to us is <em>Payload</em>, and it
        is simply the JSON that will be passed to the lambda as input. The last
        piece of information is that a lambda function, as a RPC server,
        listens on a port, this port is chosen at runtime by an environment
        variable named <kbd>_LAMBDA_SERVER_PORT</kbd>. This is the code
        responsible:
        <a href="https://github.com/aws/aws-lambda-go/blob/e9e6220a4d688b1b5a70c7643c87f0d38fea37f3/lambda/entry.go#L67">GitHub</a>
        . So we must define it.
    </p>
    
    <h3>Configuration</h3>
    <p>
        First we must build our lambda function with debugging symbols, the
        build command goes like this:
    </p>
    <pre>go build -v -gcflags='all=-N -l' your/file.go</pre>
    <p>
        The important part is this <kbd>-gcflags='all=-N -l'</kbd> which is the
        flag for turning on the debugging symbols. You may like to add it to your
        <em>Makefile</em> or whatever you use to build, we will setup a task in
        VSCode briefly.
    </p>
    <p>
        Now create the input JSON files your function is supposed to receive,
        it's convenient to create a folder for them as they tend to multiply,
        I chose <em>events</em>. Pay attention to the type your function is
        expecting to receive, some functions take input from different AWS
        services, so you must adjust the JSON according to that. This received
        type is defined on your Handler function you pass to the
        <em>lambda.Start</em> function in the main file, here is an example:
    </p>
    <pre>
func Handler(req events.APIGatewayProxyRequest) (events.APIGatewayProxyResponse, error) {
    ...
}</pre>
    <p>
        In this case the input type for this function is an
        <em>APIGatewayProxyRequest</em> and the output type is a
        <em>APIGatewayProxyResponse</em>, that means you input and output JSONs
        will be of that form. Take a look at the
        <a href="https://github.com/aws/aws-lambda-go/tree/master/events">events</a>
        package to understand the format, as it can be confusing sometimes and
        can lead you to loose hours trying to get it right.
    </p>

    <h3>The launch file</h3>
    <p>
        VSCode uses the launch file, in <em>.vscode/launch.json</em>, to
        configure debugging sessions, here we will declare the needed port
        for the lambda function and how the debug session is to be setup,
        this is mine:
    </p>
    <pre>
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Launch",
            "type": "go",
            "request": "launch",
            "mode": "exec",
            "program": "${workspaceFolder}/backend",
            "env": {
                "_LAMBDA_SERVER_PORT": "8080"
            },
            "args": []
        }
    ],
    "compounds": [
        {
            "name": "build and debug",
            "configurations": ["Launch"],
            "preLaunchTask": "build-debug"
        }
    ]
}</pre>
    <p>
        I chose port <em>8080</em> for the lambda, but you can change for
        whatever you prefer. This <em>compounds</em> field is very convenient:
        it lets you run a task before starting the debug session, so we point
        the <em>build-debug</em> task, to build our function for us.
    </p>

    <h3>The tasks file</h3>
    <p>
        This file, <em>.vscode/tasks.json</em>, is where common build tasks are
        declared, but you can declare many other things, for example, getting
        input from the user. Here we will define two things:
    </p>
    <ul>
        <li>The build-debug target</li>
        <li>
            And the event file for the RPC event, this is optional and needs
            the VSCode extension, if you don't want it you can run it manually
            in the terminal.
        </li>
    </ul>

    <p>This is the tasks.json file I'm currently using:</p>
    <pre>
{
    "version": "2.0.0",
    "inputs": [
        {
            "id": "json",
            "type": "command",
            "command": "filePicker.pick",
            "args": {
                "masks": "events/*.json",
                "display": {
                    "type": "fileName",
                    "json": "name"
                },
                "output": "fileRelativePath"
            }
        }
    ],
    "tasks": [
        {
            "label": "build-debug",
            "type": "shell",
            "command": "go build -v -gcflags='all=-N -l' ${file}"
        },
        {
            "label": "event",
            "type": "shell",
            "command": "awslambdarpc -e ${input:json}",
            "problemMatcher": []
        }
    ]
}</pre>
    <p>
        Some explanation here: the <em>masks</em> field is where you point
        the folder with your JSON events, you can change it at your discretion,
        this file is then replaced on the <kbd>${input:json}</kbd> part. This
        is responsible for issuing the RPC request to the running lambda.
    </p>
    <p>And that's all.</p>

    <h3>Running</h3>
    <p>Now it's clean and simple: with the <em>.go</em> file open on VSCode:</p>
    <ol>
        <li>
            Click on Run on your sidebar, or type <kbd>Command+Shift+d</kbd>,
            <kbd>Ctrl+Shift+d</kbd> on Windows, then select
            <em>build and run</em> and click run. Now your lambda function
            will be built and run.
            <center>
                <img src="vscode-debugger-pane.png" alt="VSCode debugging pane">
            </center>
        </li>
        <li>
            Then issue an event to your lambda using the run task command from
            the terminal bar with <kbd>Command+Shift+p</kbd> or
            <kbd>Ctrl+Shift+p</kbd> on Windows.
            <center>
                <img src="vscode-run-task.png" alt="Select run task">
            </center>
        </li>
        <li>
            Select <kbd>event</kbd>, a file picker will open to show available
            options from the <em>events</em> folder.
            <center>
                <img src="vscode-event.png" alt="Choose event">
            </center>
        </li>
        <li>
            Select the json you want and press enter, the json will be sent to
            the lambda function on the session and the debugger will trigger.
            <center>
                <img src="vscode-select.png" alt="Select which event">
            </center>
        </li>
    </ol>
    <p>
        After these commands if everything ran well, you should then see
        something like:
    </p>
    <img src="vscode-debugging.png" alt="VSCode with breakpoint reached">
    <p>
        This setup does not need docker or complicated CLIs with many
        configuration files, here we just explored already used
        configuration files with minimal changes, I hope you enjoy using this
        setup.
    </p>

    <h3>Going beyond</h3>
    <p>
        This workflow is great for local testing/debugging, but at first sight
        it can seen complicated, however after using it 2 or 3 times you notice
        that you'll be much quicker. This small RPC client
        <em>awslambdarpc</em> can be imported as a library into your code and
        used to run your test files, using it to run tests can help you
        validate input/output from your application.
    </p>
</body>

</html>
