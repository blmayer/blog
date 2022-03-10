<!DOCTYPE html>
<html lang="en">
<head>
    <title>comparing switch case with map speed in go</title>
	<meta name="description" content="A benchmark between two solutions in golang">
    <meta name="revised" content="2022-01-24">
	<style>
		{{posts.css}}
	</style>
</head>

<body>
    <a class="button" href="/">Go Back</a>
	<h2>comparing switch case with map speed in go</h2>
	<p>
		I decided to do a simple benchmark between two
		solutions I often use in my code.
	</p>
	<p>
		The situation is: you have an input, not necessarily
		known at compile time, and you'l like to assign a value
		that depends on it. I made this benchmark using strings
		and ints as inputs.
	</p>
	<p>
		The solutions I see for this are the following:
		<ul>
			<li>Use a switch case</li>
			<li>create a map that returns the correspoding value</li>
		</ul>
	</p>
	<p>So which is the fastest?</p>

	<h3>string input</h3>
	<p>The code is really simple. First I defined the functions.</p>
<pre>
package switchvsmap

var selector = map[string]string{
	"1": "one",
	"2": "two",
	"3": "three",
	"4": "four",
	"5": "five",
	"6": "six",
	"7": "seven",
	"8": "eight",
	"9": "nine",
	"0": "zero",
}

func SwitchCase(in string) string {
	var res string
	switch in {
	case "1":
		res = "one"
	case "2":
		res = "two"
	case "3":
		res = "three"
	case "4":
		res = "four"
	case "5":
		res = "five"
	case "6":
		res = "six"
	case "7":
		res = "seven"
	case "8":
		res = "eight"
	case "9":
		res = "nine"
	case "0":
		res = "zero"
	}

	return res
}

func MapCase(in string) string {
	res := selector[in]

	return res
}
</pre>

<p>And created the test file.</p>
<pre>
package switchvsmap

import (
	"math/rand"
	"testing"
)

const chars = "0123456789"

var (
	cases    = make([]string, 10e7)
)

func init() {
	for i := 0; i < 10e7; i++ {
		cases[i] = string(chars[rand.Intn(len(chars))])
	}
}

func BenchmarkSwitchCase(b *testing.B) {
	for n := 0; n < b.N; n++ {
		SwitchCase(cases[n])
	}
}

func BenchmarkMapCase(b *testing.B) {
	for n := 0; n < b.N; n++ {
		MapCase(cases[n])
	}
}
</pre>
<p>
	You can see I initialized a very big array, and
	filled it with random chars. That is to make tests
	unpredictable.
</p>

<h3>int input</h3>
<p>I remade the tests using ints as input</h3>
<pre>
var selectorInt = map[int]string{
	1: "one",
	2: "two",
	3: "three",
	4: "four",
	5: "five",
	6: "six",
	7: "seven",
	8: "eight",
	9: "nine",
	0: "zero",
}

func SwitchCaseInt(in int) string {
	var res string
	switch in {
	case 1:
		res = "one"
	case 2:
		res = "two"
	case 3:
		res = "three"
	case 4:
		res = "four"
	case 5:
		res = "five"
	case 6:
		res = "six"
	case 7:
		res = "seven"
	case 8:
		res = "eight"
	case 9:
		res = "nine"
	case 0:
		res = "zero"
	}

	return res
}

func MapCaseInt(in int) string {
	res := selectorInt[in]

	return res
}
</pre>
<p>I'm showing only the changes.</p>

<pre>

var (
	casesInt = make([]int, 10e8)
)

func init() {
	for i := 0; i < 10e8; i++ {
		casesInt[i] = rand.Intn(len(chars))
	}
}

func BenchmarkSwitchCaseInt(b *testing.B) {
	for n := 0; n < b.N; n++ {
		SwitchCaseInt(casesInt[n])
	}
}

func BenchmarkMapCaseInt(b *testing.B) {
	for n := 0; n < b.N; n++ {
		MapCaseInt(casesInt[n])
	}
}
</pre>

<p>And combined them in the same file.</p>

<h3>Results</h3>
<p>
	I used the command:
	<kbd>go test -bench=. -benchtime 10000000x</kbd>
	to run the benchmark, I need to define <kbd>benchtime</kbd>
	to not overflow my test data.
</p>
<pre>
goos: linux
goarch: amd64
pkg: mapvsswitch
cpu: Intel(R) Core(TM) i5-4570T CPU @ 2.90GHz
BenchmarkSwitchCase-4      	10000000	        20.02 ns/op
BenchmarkMapCase-4         	10000000	        26.99 ns/op
BenchmarkSwitchCaseInt-4   	10000000	         9.188 ns/op
BenchmarkMapCaseInt-4      	10000000	        20.55 ns/op
PASS
ok  	mapvsswitch	13.841
</pre>
<p>
	So far the switch statement is faster, I was expecting that,
	but let's see how it behaves when we increase the input cases.
</p>

</body>
</html>
