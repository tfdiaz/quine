# Ouroboros - A cycle of Code
Have you ever wanted to take Elixir code that generates C code that generates Rust code that generates Elixir code that generates...? Well I got just the thing for you!

## About
A quine is a program that creates a copy of its own source code. Named after [Willard Van Orman Quine](https://en.wikipedia.org/wiki/Willard_Van_Orman_Quine), these programs are not as trivial as they sound. The trick relies on what Scott Aaronson describes in his fantastic book [*Quantum Computing since Democritus*](http://www.cambridge.org/catalogue/catalogue.asp?isbn=9781107302105):
> Print the following twice, the second time in quotes.
> 
> "Print the following twice, the second time in quotes."

While the above instructions seems rather simple, transferring it to code sometimes requires some clever manipulation.

An example in Elixir:
```Elixir
"fn x->IO.puts~s(\#{inspect x}|>\#{x}) end.()"|>fn x->IO.puts~s(#{inspect x}|>#{x}) end.()
```
To those who haven't seen Elixir syntax, the first part
```Elixir
"fn x->IO.puts~s(\#{inspect x}|>\#{x}) end.()"
```
is the actual running code in quotes.
```Elixir
|>fn x->IO.puts~s(#{inspect x}|>#{x}) end.()
```
We take that string and pipe it into an anonymous function that will print to the screen twice. Once in quotes with
```Elixir
#{inspect x}
```
and the second without. The
```Elixir
~s
```
turns everything into a string.

## A Quine Relay
Adds the additional level of complexity where the source code has to create a copy in another language's code which has to create a copy in to another language's code and so on.

This is what my program does and while at first it may sound difficult, I can show you exactly how it works and how it can be extended to include many more languages.

There are three parts:
* Print the starting variables and any main or headers
* Print out the entire "DNA" string in quotes
* Print out functions in the next language from "DNA" string

Let's look at the elixir code:

*I've hidden most of the DNA string*
```Elixir
q = [34]
dna = [ //DNA STRING
    "    ",
    "#include <stdio.h>",
    "int main()",
    "{",
    "    char q = 34;",
    ....
]
Enum.slice(dna, 1..6)
|> Enum.map(fn x -> IO.puts x end)
Enum.map(dna, fn x ->
   IO.write List.first(dna)
   IO.write q
   IO.write x
   IO.write q
   IO.puts ','
   end)
Enum.with_index(dna)
|> Enum.slice(7..29)
|> Enum.map(fn
   {x, y} when y == 9 or y == 13 or y == 17 or y == 21 or y == 25 -> IO.write x
   {x, y} when y == 10 or y == 14 or y == 18 or y == 22 or y == 26 ->
       IO.write q
       IO.write x
       IO.write q
   {x, _y} -> IO.puts x
   end)
```
The first part:
```Elixir
q = [34]
```
We need to render out quotes and Elixir will print lists as ascii if the number falls in range. You can see that this is done in the C code too in the DNA STRING. A sensible question is why don't we just declare q as a literal " symbol. The reason is because to have quotes in a quoted string we need backslashes. This makes the second step quite torturous, so numeral representation is best.

After the DNA string comes the actual code. The code is exactly the three steps from above. First:
```Elixir
Enum.slice(dna, 1..6)
|> Enum.map(fn x -> IO.puts x end)
```
Will render out the start variables/main etc. Second:
```Elixir
Enum.map(dna, fn x ->
   IO.write List.first(dna)
   IO.write q
   IO.write x
   IO.write q
   IO.puts ','
   end)
```
Will render out the whole dna string in quotes. And finally:
```Elixir
Enum.with_index(dna)
|> Enum.slice(7..29)
|> Enum.map(fn
   {x, y} when y == 9 or y == 13 or y == 17 or y == 21 or y == 25 -> IO.write x
   {x, y} when y == 10 or y == 14 or y == 18 or y == 22 or y == 26 ->
       IO.write q
       IO.write x
       IO.write q
   {x, _y} -> IO.puts x
   end)
```
will write out the actual code. This is more involved to deal with quotes that are needed in printf.

## How to Actually Test

You'll need
* Elixir compiler/interpreter
* Rust rustc compiler
* C compiler

Just run this long command
```bash
elixir elixir_to_C.exs >> c_to_rust.c && gcc c_to_rust.c -o c_to_rust && ./c_to_rust >> rust_to_elixir.rs && rustc rust_to_elixir.rs && ./rust_to_elixir >> copy.exs
diff copy.exs elixir_to_C.exs
```
This will make all the copies and show that the new file we make copy is the exact same as our original!





