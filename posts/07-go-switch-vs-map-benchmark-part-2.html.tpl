<!DOCTYPE html>
<html lang="pt">

<head>
    <title>comparing int switch case with map speed in go</title>
    <meta name="revised" content="2022-02-22">
    <meta name="description" content="A benchmark about go's int switch case vs map performance.">
    <style>
        {{posts.css}}
    </style>
</head>

<body>
    <a class="button" href="/">Go Back</a>
    <h2>int switch case vs map comparison</h2>
    <p>
        continuing on the same idea from
        <a href="/posts/05-go-switch-vs-map-benchmark.html">article 5</a>,
        here i wanted to investigate the complexity of those two cases.
    </p>
    <p>
        for the int type this benchmark is easier as i only vary the number
        of cases inside the switch, and the map keys are just the numbers.
    </p>
    
    <h3>cases</h3>
    <p>
        the benchmark was done in like this:
    </p>
    <p>given a number <em>n</em> of cases.
    <ul>
        <li>generate the switch with <em>n</em> cases</li>
        <li>generate the map with <em>n</em> entries</li>
        <li>measure the time to retrieve an item</li>
    </ul>
    <p>
        i've done that for values from 10 to 10000 using a shell script
        to hardcode all values on the source file. the values are random
        strings of size 16.
    </p>
    <p>here is one example:</p>
    <p>
    <pre>
package switchvsmap

func switchCaseInt5(input int) string {
        res := ""
        switch input {
        case 0: res = "9U5mScxLZLbQfj7y"
        case 1: res = "P0CoRrj0x7PwOZTO"
        case 2: res = "jAbhtkEBmEXlmQ15"
        case 3: res = "2GJV7FBmYemqF7VB"
        case 4: res = "AflqdquuhoUBqYT0"
        }
        return res
}

func mapCaseInt5(input int) string { return mapInt5[input] }

var mapInt5 = map[int]string{
        0: "T5Nlajp4dWNsdAxq",
        1: "VLXyeeQVNP8LNEfS",
        2: "GfjlCRLOiv5qrj3m",
        3: "yySDbcA0Mf7J90qA",
        4: "GdKSg4pR8xpRb6Lx",
}

func switchCaseInt10(input int) string {
        res := ""
        switch input {
        case 0: res = "wylNCLjLylMZgjo9"
        case 1: res = "e6X044Vj9OyNliBC"
        case 2: res = "MfSoK3jCk3LujGUM"
        case 3: res = "FY8Z9owHtWAiA3eJ"
        case 4: res = "sof0DLcmDeR1nxGf"
        case 5: res = "Rny0iTpLbh79Tfl4"
        case 6: res = "XyFaFrCKpOLCIL6D"
        case 7: res = "OvYkV1NmdUpQA0q8"
        case 8: res = "cL7RWN0aSCEno37m"
        case 9: res = "AMgSpv4t7BN1Lj8l"
        }
        return res
}

func mapCaseInt10(input int) string { return mapInt10[input] }

var mapInt10 = map[int]string{
        0: "KlRf6TsIkvoaOf01",
        1: "IdBDDIIjLKnULDUA",
        2: "MmqxCLC4ssC8AoJo",
        3: "FJSFb2ozxQn0QRhu",
        4: "ISx7BqtOGsgcCODS",
        5: "vzHJ0gAhtj2Ejx4m",
        6: "Wm24QTHb4fVA34jt",
        7: "T6o64gYAr3N5Ppxr",
        8: "gspkuIF7rHYUySma",
        9: "SJAJSFdYKhWp7ZNH",
}
.
.
.</pre>
    <p>
        the complete file has 149,112 lines.
    </p>
    <p>the test file was generated using the same strategy:</p>
    <pre>
    package switchvsmap                    
         
import (
        "testing"                         
)

func BenchmarkSwitchCaseInt5(b *testing.B) {
        for n := 0; n < b.N; n++ {
                switchCaseInt5(n % 5)
        }
}

func BenchmarkMapCaseInt5(b *testing.B) {
        for n := 0; n < b.N; n++ {
                mapCaseInt5(n % 5)
        }
}

func BenchmarkSwitchCaseInt10(b *testing.B) {
        for n := 0; n < b.N; n++ {
                switchCaseInt10(n % 10)
        }
}

func BenchmarkMapCaseInt10(b *testing.B) {
        for n := 0; n < b.N; n++ {
                mapCaseInt10(n % 10)
        }
}
.
.
.</pre>
   <p>then i just ran the go test command and ploted it.</p>
   <h3>result</h3>
    <center>
        <img src="plot.png" alt="graphic of benchmark time">
    </center>
    <p>
        x axis is the size of the switch/map, and y axis is the
        ns/op value that go test outputs.
    </p>
    <p>
        for big number of cases both methods perform very close,
        due to the big variation of speed i cannot clearly see
        a faster one. one thing that suprised me is that the complexity
        looks more logarithmic, but my expectation was to see a
        linear growth for the switch case.
    </p>
    <h3>final remarks</h3>
    <p>
        we see that the switch statement is faster than the map
        up to 3000 cases, after that it is not waranteed. i don't
        think anyone would hardcode that much cases in a real life
        example.
    </p>
    <p>
        the advantage of the map is that it is a dynamic structure,
        i mean, it can me modified on runtime, so that is not a
        surprise that the switch case is faster, since it is a
        fully determined at compile time, and thus can be otimized.
    <p>
    <p>
        my conclusion is that if you know your cases at compile time,
        then use the switch case, otherwise use the map.
    </p>
</body>

</html>