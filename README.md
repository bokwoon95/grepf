```
   Usage: grepf <pattern> [INCLUDED...] [:: EXCLUDED...] [--OPTIONS...]

   Search for <pattern> within [INCLUDED] files, ignoring [EXCLUDED] files.
   [INCLUDED] files are separated from [EXCLUDED] files by a '::'.
   When omitted, [INCLUDED] is the current dir and [EXCLUDED] is empty.
   Any [--OPTIONS] you can pass to grep, you can pass to grepf as well

   Examples:
      grepf pattern
      grepf pattern *.py
      grepf pattern file1.txt folder1/ :: folder1/file2.txt
      grepf pattern :: file1.txt **/*.log

   Options(only for grepf):
      --list       Instead of showing each match, show an overview of which files
                   were matched
      --describe   Show the full command that grepf transforms into.
      --help       Show this help
```
