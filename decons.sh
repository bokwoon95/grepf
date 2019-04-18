#!/bin/bash

# POSIX loop
# https://unix.stackexchange.com/a/410637
argc="$#";: "$((i=0))"
while [ "$i" -lt "$argc" ]; do
  # echo "$1" # for debugging
  if [ "$1" = "--list" ];                                  then List="true"
  elif [ "$1" = "--describe" ];                            then Describe="true"
  elif [ "$1" = "--help" -o "$1" = "-h" -o "$1" = "--h" ]; then Help="true"
  elif [ "$(echo $1 | cut -c1-1)" = "-" ];                 then OPTS="$(echo $OPTS $1 | xargs)"
  elif [ -z "$PATTERN" ];                                  then PATTERN="\"$1\""
  elif [ "$1" = "::" ];                                    then exclude_active="true"
  else
    isdir=""; [ "$(echo -n $1 | tail -c1)" = "/" ] && isdir="true"
    if [ "$isdir" ]; then arg="$(echo $1 | sed 's/.$//')"; else arg="$1"; fi
    arg="$(echo \"$arg\" | sed 's/$/,/')"
    if [ "$exclude_active" ]; then
      if [ "$isdir" ]; then ED="$ED$arg"; else EF="$EF$arg"; fi
    else
      if [ "$isdir" ]; then ID="$ID$arg"; else IF="$IF$arg"; fi
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
