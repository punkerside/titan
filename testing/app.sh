#!/bin/bash

# espacio temporal
dirTemp=$(mktemp -d)
mkdir -p "${dirTemp}"/.scripts/
cp -R "${PWD}"/* "${dirTemp}"/.scripts/
cp Makefile "${dirTemp}"/
cd "${dirTemp}"/

# listando funciones
ls -l .scripts/scripts/ | grep -v total | awk -F ' ' '{print $9}' > scriptsList.txt

while read -r line
do
  source ".scripts/scripts/${line}"
done < scriptsList.txt

scriptsCount=$(declare -F | grep "script_" | awk -F ' ' '{print $3}' | wc -l)

# depurando
((scriptsCount=scriptsCount-$(cat .scripts/testing/exclude.txt | wc -l)))
declare -F | grep "script_" | awk -F ' ' '{print $3}' > scriptsFunctionTmp.txt
grep -vf .scripts/testing/exclude.txt scriptsFunctionTmp.txt > scriptsFunction.txt

# bucle
testingCount=0
while read -r line
do
  echo -ne "\e[48m[INFO]\e[0m Testing Script: ${line} \e[0m\n"
  if test -f ".scripts/testing/${line}/run.sh"
  then
    export line="${line}"
    .scripts/testing/${line}/run.sh

    if test -f ".scripts/testing/${line}/result.txt"
    then
      testingCount=$((testingCount + 1))
      echo -ne "\e[42m[INFO]\e[0m Exitoso \e[0m\n"
    else
      echo -ne "\e[41m[INFO]\e[0m Fallido \e[0m\n"
    fi

  else
    echo -ne "\e[43m[INFO]\e[0m Omitido \e[0m\n"
  fi
done < scriptsFunction.txt

# resultado
echo -ne "\e[44m[INFO]\e[0m Cobertura $((${testingCount}*100/${scriptsCount}))% \e[0m\n"