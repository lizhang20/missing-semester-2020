
https://missing.csail.mit.edu/2020/data-wrangling/

## 1. regex tutorial

https://regexone.com/

## 2. search and deal with words

Find the number of words (in /usr/share/dict/words) that contain at least three a and don’t have a 's ending. What are the three most common last two letters of those words? sed’s y command, or the tr program, may help you with case insensitivity. How many of those two-letter combinations are there? And for a challenge: which combinations do not occur?

- Write regex for container at least three a, and donot have 's ending.

     At least three a: `.*[aA].*[aA].*[aA].*` or `(.*[aA].*){3,}` (Note: `{3,}` will match 3 or more tokens.)

     [donot have 's end](https://stackoverflow.com/questions/406230/regular-expression-to-match-a-line-that-doesnt-contain-a-word): `((!?\'s).)*$`

     Combain them: `(.*[aA].*){3,}((!?\'s).)*$`

     Or we can use interted match flag: `-v` to find lines do not match specified patterns.

     `grep -E "^(.*[aA]{3,}.*)$" | grep -v ".*'s"`


- Using `grep -E` and the pattern above to search

     ```bash
     zl@LAPTOP-ZL ~/m/4_data_wrangling> grep -E '(.*[aA]\w*){3,}((!?\'s).)*$' words | head -n4
     Acadia
     Aconcagua
     Adana
     Adhara
     ```

TODO: 

- What are the three most common last two letters of those words?

- How many of those two-letter combinations are there?

- How many of those two-letter combinations are there?

- Which combinations donot occur?

3. Does `sed s/REGEX/SUBSTITUTION/ input.txt > input.txt` work well? Any alternative ways?

     No, the `input.txt` will be empty.
     
     Use `sed s/REGEX/SUBSTITUTION/ input.txt > output.txt`
     
     or 
     
     `sed -i s/REGEX/SUBSTITUTION/ input.txt` on Linux
     
     or 
     
     `sed -i '' 's/REGEX/SUBSTITUTE/ input.txt'` or `sed -i -e 's/REGEX/SUBSTITUTE/ input.txt'` when using FreeBSD `sed`.
