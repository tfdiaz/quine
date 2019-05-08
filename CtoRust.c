#include <stdio.h>
int main()
{
    char q = 34;
    char nl = 10;
    char *l[] = {
    "    ",
    "#include <stdio.h>",
    "int main()",
    "{",
    "    char q = 34;",
    "    char nl = 10;",
    "    char *l[] = {",
    "    };",
    "    for(int i = 30; i <= 32; i++)",
    "        printf(",
    "%s%c",
    ", l[i], nl);",
    "    for(int i = 0; i <= 56; i++)",
    "        printf(",
    "%s%c%s%c,%c",
    ", l[0], q, l[i], q, nl);",
    "    for(int i = 33; i <= 56; i++) {",
    "        printf(",
    "%s",
    ", l[i]);",
    "        if(i == 35 || i == 36 || i == 40 || i == 41 || i == 45 || i == 46 || i == 49 || i == 50)",
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
    "   let q = 34u8 as char;",
    "   let l = [",
    "   ];",
    "   for i in 1..7 as usize {",
    "       println!(",
    "{}",
    ", l[i]);",
    "   }",
    "   for i in 0..57 as usize {",
    "       println!(",
    "{}{:?},",
    ", l[0], l[i]);",
    "   }",
    "   for i in 7..30 as usize {",
    "       print!(",
    "{}",
    ", l[i]);",
    "       if i == 9 || i == 10 || i == 13 || i == 14 || i == 17 || i == 18 || i == 21 || i == 22 || i == 25 || i == 26 {",
    "           print!(",
    "{}",
    ", q);",
    "      } else {",
    "           println!();",
    "      }",
    "   }",
    "}",
    };
    for(int i = 30; i <= 32; i++)
        printf("%s%c", l[i], nl);
    for(int i = 0; i <= 56; i++)
        printf("%s%c%s%c,%c", l[0], q, l[i], q, nl);
    for(int i = 33; i <= 56; i++) {
        printf("%s", l[i]);
        if(i == 35 || i == 36 || i == 40 || i == 41 || i == 45 || i == 46 || i == 49 || i == 50)
            printf("%c", q);
        else
            printf("%c", nl);
    }
}
