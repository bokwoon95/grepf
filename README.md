```
   Usage: grepf <pattern> [INCLUDED...] [:: EXCLUDED...] [--OPTIONS...]

   Search for <pattern> within [INCLUDED] files, ignoring [EXCLUDED] files.
   [INCLUDED] files are separated from [EXCLUDED] files by a '::'.
   When omitted, [INCLUDED] is the current dir and [EXCLUDED] is empty.
   Any [--OPTIONS] you can pass to grep, you can pass to grepf as well
   Note: If '!' appears in <old> or <new>, it must be escaped i.e. '\!'
         and you must use single quotes, not double quotes with '\!'

   Examples:
      grepf pattern
      grepf pattern '*.py'
      grepf pattern file1.txt folder1/ :: folder1/file2.txt
      grepf pattern :: file1.txt '**/*.log'

   Options(only for grepf):
      --list       Instead of showing each match, show an overview of which files
                   were matched
      --describe   Show the full command that grepf transforms into.
      --raw        Raw unfiltered searches i.e. .git/ is filtered by default, this
                   turns it off
      --help       Show this help
```
