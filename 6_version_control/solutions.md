# exercises

## 2. cloning repo of this class website

- 2. Who was the last person to modify `README.md`? use `git log` with arguments.

```
~/m/6/missing-semester ❯❯❯ git log -1 --all  README.md
commit e2b716f3aee7a91189c5a3bf194c7e5fb82f7743
Author: Anish Athalye <me@anishathalye.com>
Date:   Sat Feb 8 20:15:48 2020 -0500

    Add link to website license page
```

- 3. What was the commit message associated with the last modification to the collections: line of `_config.yaml`? use `git blame` and `git show`.

```
~/m/6/missing-semester ❯❯❯ git blame _config.yml | grep collections: | awk '{print $1}' | xargs git show | head -n6
commit a88b4eac326483e29bdac5ee0a39b180948ae7fc
Author: Anish Athalye <me@anishathalye.com>
Date:   Fri Jan 17 15:26:30 2020 -0500

    Redo lectures as a collection

```

- 4. Create an alias in ~/.gitconfig when you run `git graph`, you get the output of `git log --all --graph --decorate --oneline`

Add the following into ~/.gitconfig

```
[alias]
        # git log history with all
        gra = log --all --graph --decorate
        # git log history with oneline
        gro = log --all --graph --decorate --oneline
```
