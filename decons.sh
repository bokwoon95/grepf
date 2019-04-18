#!/bin/bash

# POSIX loop
# https://unix.stackexchange.com/a/410637
argc="$#";: "$((i=0))"
while [ "$i" -lt "$argc" ]; do
  if [ "$1" = "--list" ];                                  then List="true"
  elif [ "$1" = "--describe" ];                            then Describe="true"
  elif [ "$1" = "--help" -o "$1" = "-h" -o "$1" = "--h" ]; then Help="true"
  elif [ "$(echo $1 | cut -c1-1)" = "-" ];                 then OPTS="$(echo $OPTS $1 | xargs)"
  elif [ -z "$PATTERN" -a "$1" != "::" ];                  then PATTERN="\"$1\""
  elif [ "$1" = "::" ];                                    then exclude_active="true"
  else
    isdir=""; [ "$(echo -n $1 | tail -c1)" = "/" ] && isdir="true"
    if [ "$exclude_active" ]; then
      if [ "$isdir" ]; then
        ED="$(echo $ED --exclude-dir=\"$1\")"
      else
        EF="$(echo $EF --exclude=\"$1\")"
      fi
    else
      if [ "$isdir" ]; then
        ID="$(echo $ID \"$1\")"
      else
        IF="$(echo $IF \"$1\")"
      fi
    fi
  fi
  shift;: "$((i=i+1))"
done

[ "$List" ] && echo "--list is active"
[ "$Describe" ] && echo "--describe is active"
[ "$Help" ] && echo "--help is active"
echo "PATTERN is $PATTERN"
echo "ED is $ED"
echo "EF is $EF"
echo "ID is $ID"
echo "IF is $IF"
echo "OPTS are $OPTS"

[ "$ID$IF" = "" ] && ID="."
echo "grep -rEIHn --context=3 --color=always -e $PATTERN $ID $IF $ED $EF | less -RiMSFX#4"
read -p "continue? y/n (leave blank for y) " CONTINUE
[ "$CONTINUE" != "y" -a "$CONTINUE" != "" ] && exit 0
eval "grep -rEIHn --context=3 --color=always -e $PATTERN $ID $IF $ED $EF | less -RiMSFX#4"

# Exclude directory: --exclude-dir=test
# Exclude file: --exclude=
#   if globbing, need quotes --exclude="*.sh"
#   if exact file name, need dot slash --exclude="./test/1/a.txt"
# XXX: --exclude={a,b} doesn't work reliably, but --exclude=a --exclude=b does
# XXX: grep -r "PATTERN" . --include=test/ doesn't work, but grep -r "PATTERN" . test/ does
# XXX: --exclude=*.sh doesn't work, but --exclude="*.sh" does
# --exclude-dir={"test","best"}
# --exclude={"*.sh","best"}

# always quote
# always separate args, not ={a,b,c}
# always use --exclude-dir= for directories to exclude, without trailing slash. rmb to quote and
# always use relative path
# included dirs can be directly specified after PATTERN one by one
