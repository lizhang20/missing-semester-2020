
https://missing.csail.mit.edu/2020/data-wrangling/

## 1. regex tutorial

https://regexone.com/

## 2. search and deal with words

Find the number of words (in /usr/share/dict/words) that contain at least three a and don’t have a 's ending. What are the three most common last two letters of those words? sed’s y command, or the tr program, may help you with case insensitivity. How many of those two-letter combinations are there? And for a challenge: which combinations do not occur?

- write regex for container at least three a, and donot have 's ending.

     - at least three a: `.*[aA].*[aA].*[aA]`, or `(.*[aA]){3,}`

       Note: `.*` should not be `\w*` here, or words like Baha'ullah will be excluded.

     - do not have 's end
     
          - [pure regex](https://stackoverflow.com/questions/16398471/regex-for-string-not-ending-with-given-suffix): `.*(?<!'[sS])$`
          
          - use `-v` option of `grep`: `grep -v ".*'s"`

     - combine them
          
          - pure regex: `^(.*[aA]){3,}.*(?<!'[sS])$`
          
          - another option: `grep -E "^(.*[aA]){3,}.*$" | grep -v ".*'s"`

- Since default grep does not support look-behind, `-P` option should be used to activate Perl mode.

     ```bash
     zl@LAPTOP-ZL ~/m/4_data_wrangling> grep -P "^(.*[aA]){3,}.*(?<!'[sS])$" words | head -n4
     Aaliyah
     Abraham
     Acadia
     Achaean
     ```

- What are the three most common last two letters of those words?

     extract last two letters of those words (using `sed`)

     ```bash
     zl@LAPTOP-ZL ~/m/4_data_wrangling> grep -P "^(.*[aA]){3,}.*(?<!'[sS])$" words | sed -E 's/.*(\w{2})/\1/' | head -n3
     ah
     am
     ia
     ```

     compare the results with the first step, ah to Aaliyah, am to Abraham...

- How many of those two-letter combinations are there?

     using `sort`, `uniq -c` to sort and calculate lines

     ```bash
     zl@LAPTOP-ZL ~/m/4_data_wrangling> grep -P "^(.*[aA]){3,}.*(?<!'[sS])$" words | sed -E 's/.*(\w{2})/\1/' | sort | uniq -c | sort | tail -n5
          49 al
          51 ia
          54 as
          63 ns
         101 an
     ```

- How many of those two-letter combinations are there?

     Use `wc` command with `-l` option.

     ```bash
     zl@LAPTOP-ZL ~/m/4_data_wrangling> grep -P "^(.*[aA]){3,}.*(?<!'[sS])$" words | sed -E 's/.*(\w{2})/\1/' | sort | uniq -c | wc -l
     111
     ```

- Which combinations do not occur?

     `awk` may be an alternative:

     ```bash
     zl@LAPTOP-ZL ~/m/4_data_wrangling> grep -P "^(.*[aA]){3,}.*(?<!'[sS])$" words | sed -E 's/.*(\w{2})/\1/' | sort | uniq 
          | awk '{b[$1]=1} END{split("abcdefghijklmnopqrstuvwxyz", A, "");
            for(i=1; i<=26; ++i) {for(j=1; j<=26; ++j) 
            {if(b[A[i]""A[j]]!=1) {print A[i]""A[j]}}}}'
          | head
     ab
     af
     ai
     aj
     ao
     ap
     aq
     au
     av
     aw
     ```


## 3. In-place substitution using sed

Is `sed s/REGEX/SUBSTITUTION/ input.txt > input.txt` a good idea? Alternative ways?

No, the `input.txt` will be empty.

Use the `-i` option: `sed -i 's/REGEX/SUBSTITUTION/' input.txt`

Or use `sed s/REGEX/SUBSTITUTION/ input.txt > output.txt`
