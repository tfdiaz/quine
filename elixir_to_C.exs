q = [34]
dna = [
    "    ",
    "#include <stdio.h>",
    "int main()",
    "{",
    "    char q = 34;",
    "    char nl = 10;",
    "    char *dna[] = {",
    "    };",
    "    for(int i = 30; i < 32; i++)",
    "        printf(",
    "%s%c",
    ", dna[i], nl);",
    "    for(int i = 0; i < 71; i++)",
    "        printf(",
    "%s%c%s%c,%c",
    ", dna[0], q, dna[i], q, nl);",
    "    for(int i = 32; i < 49; i++) {",
    "        printf(",
    "%s",
    ", dna[i]);",
    "        if(i == 34 || i == 35 || i == 39 || i == 40 || i == 44 || i == 45)",
    "            printf(",
    "%c",
    ", q);",
    "        else",
    "            printf(",
    "%c",
    ", nl);",
    "    }",
    "}",
    "fn main() {",
    "   let dna = [",
    "   ];",
    "   for i in 49..51 as usize {",
    "       println!(",
    "{}",
    ", dna[i]);",
    "   }",
    "   for i in 0..71 as usize {",
    "       println!(",
    "{}{:?},",
    ", dna[0], dna[i]);",
    "   }",
    "   for i in 51..71 as usize {",
    "       println!(",
    "{}",
    ", dna[i]);",
    "   }",
    "}",
    "q = [34]",
    "dna = [",
    "]",
    "Enum.slice(dna, 1..6)",
    "|> Enum.map(fn x -> IO.puts x end)",
    "Enum.map(dna, fn x ->",
    "   IO.write List.first(dna)",
    "   IO.write q",
    "   IO.write x",
    "   IO.write q",
    "   IO.puts \',\'",
    "   end)",
    "Enum.with_index(dna)",
    "|> Enum.slice(7..29)",
    "|> Enum.map(fn",
    "   {x, y} when y == 9 or y == 13 or y == 17 or y == 21 or y == 25 -> IO.write x",
    "   {x, y} when y == 10 or y == 14 or y == 18 or y == 22 or y == 26 ->",
    "       IO.write q",
    "       IO.write x",
    "       IO.write q",
    "   {x, _y} -> IO.puts x",
    "   end)",
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
