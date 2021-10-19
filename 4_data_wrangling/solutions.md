
https://missing.csail.mit.edu/2020/data-wrangling/

## 1. regex tutorial

https://regexone.com/

## 2. search and deal with words

Find the number of words (in /usr/share/dict/words) that contain at least three a and don’t have a 's ending. What are the three most common last two letters of those words? sed’s y command, or the tr program, may help you with case insensitivity. How many of those two-letter combinations are there? And for a challenge: which combinations do not occur?

- write regex for container at least three a, and donot have 's ending.

at least three a: `\w*[aA]\w*[aA]\w*[aA]`

[donot have 's end](https://stackoverflow.com/questions/406230/regular-expression-to-match-a-line-that-doesnt-contain-a-word): `((!?\'s).)*$`

combain them: `\w*[aA]\w*[aA]\w*[aA]((!?\'s).)*$`

- using `grep -E` and the pattern above to search

```bash
zl@LAPTOP-ZL ~/m/4_data_wrangling> grep -E '\w*[aA]\w*[aA]\w*[aA]((!?\'s).)*$' words | head -n4
Acadia
Aconcagua
Adana
Adhara
```

- What are the three most common last two letters of those words?

extract last two letters of those words (using `sed`)

```bash
zl@LAPTOP-ZL ~/m/4_data_wrangling> grep -E '\w*[aA]\w*[aA]\w*[aA]((!?\'s).)*$' words | sed -E 's/.*(\w{2})/\1/' | head -n3
ia
ua
na
```

compare the results with the first step, ia to Acadia, ua to Aconcagua ...

- How many of those two-letter combinations are there?

using `sort`, `uniq -c` to sort and calculate lines

```bash
zl@LAPTOP-ZL ~/m/4_data_wrangling> grep -E '\w*[aA]\w*[aA]\w*[aA]((!?\'s).)*$' words | sed -E 's/.*(\w{2})/\1/' | sort | uniq -c | sort | tail -n3
     28 na
     28 ra
     51 ia
```

- How many of those two-letter combinations are there?

- Which combinations donot occur?

3. Does `sed s/REGEX/SUBSTITUTION/ input.txt > input.txt` work well? Any alternative ways?

No, the `input.txt` will be empty.

Use `sed s/REGEX/SUBSTITUTION/ input.txt > output.txt`

or 

`sed -i s/REGEX/SUBSTITUTION/ input.txt` on Linux

or 

`sed -i '' 's/REGEX/SUBSTITUTE/ input.txt'` or `sed -i -e 's/REGEX/SUBSTITUTE/ input.txt'` when using FreeBSD `sed`.
