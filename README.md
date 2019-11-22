[![asciicast](https://asciinema.org/a/w5Dw52mj2dupFGMnOGfWRxIr1.svg)](https://asciinema.org/a/w5Dw52mj2dupFGMnOGfWRxIr1)

## Why this exists
I'm not happy with the verbosity of existing tools (find, grep, ag, sed, etc) in order to do a directory-wide regex search (and replace) of a keyword. Especially when it comes to whitelisting/blacklisting specific files (or file patterns) from your search. I created this to transpile my preferred syntax for search (and replace) into their corresponding find/grep/ag/sed commands so that I don't have to memorise grep/ag/etc specific syntax for whitelisting and blacklisting of files.

It's not perfect yet and sorely due for a revamp (no ripgrep support, file pattern globs don't work the way I want it to) but I've been using it in its current state very heavily for symbolic search and replace.

Heavily inspired by thoughtbot's [search and replace script](https://thoughtbot.com/blog/sed-102-replace-in-place#find-and-replace-in-multiple-files), except `grepf` and `rgrepf` allow you to review all instances of the keywords you want to replace first (with `grepf`) before you actually replace them (with `rgrepf`). And it also allows for simple whitelisting and blacklisting of files in your search using the `::` separator (all files to the left of `::` are whitelisted, all files to the right of `::` are blacklisted).

## Installation
To install `grepf` and `rgrepf`, run this command
```
bash -c "$(curl https://raw.githubusercontent.com/bokwoon95/grepf/master/install)"
```

## Search only: `grepf`
```
   Usage: grepf <pattern> [INCLUDED...] [:: EXCLUDED...] [--OPTIONS...]

   Search for <pattern> within [INCLUDED] files, ignoring [EXCLUDED] files.
   [INCLUDED] files are separated from [EXCLUDED] files by a '::'.
   By default, [INCLUDED] is the current directory.

   Examples:
      grepf pattern
      grepf pattern '*.py'
      grepf pattern file1.txt folder1/ :: folder1/file2.txt
      grepf pattern :: file1.txt '**/*.log'

   Options:
      --help       Show this help
      --list       List the files that are affected
      --describe   Show the full command that grepf transforms into
      --raw        Raw unfiltered searches i.e. .git/ is filtered by default, this
                   turns it off

   Note:
      Any [--OPTIONS] you can pass to grep, you can pass to grepf as well.
      If in doubt, wrap it in single quotes 'like this'
```

## Search and Replace: `rgrepf`
```
   Usage: rgrepf <old> <new> [INCLUDED...] [:: EXCLUDED...] [--OPTIONS...]

   Search and replace <old> with <new> in [INCLUDED] files, ignoring [EXCLUDED] files.
   [INCLUDED] files are separated from [EXCLUDED] files by a '::'.
   By default, [INCLUDED] is the current directory.

   Examples:
      rgrepf old new
      rgrepf old new '*.py'
      rgrepf old new file1.txt folder1/ :: folder1/file2.txt
      rgrepf old new :: file1.txt '**/*.log'

   Options(only for rgrepf):
      --help       Show this help
      --list       List the files that are affected
      --describe   Show the full command that grepf transforms into
      --raw        Raw unfiltered searches i.e. .git/ is filtered by default, this
                   turns it off

   Note:
      Any [--OPTIONS] you can pass to grep, you can pass to grepf as well.
      If in doubt, wrap it in single quotes 'like this'
```
