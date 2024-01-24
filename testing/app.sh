#!/bin/bash

# creating temporary directory
dirTemp=$(mktemp -d)
mkdir -p "${dirTemp}"/.scripts/

# setting up workspace
cp -R "${PWD}"/* "${dirTemp}"/.scripts/
cp Makefile "${dirTemp}"/
cp CHANGELOG.md "${dirTemp}"/
cd "${dirTemp}"/

# listing bash script files
ls -l .scripts/scripts/ | grep -v total | awk -F ' ' '{print $9}' > scriptsList.txt

# listing functions
while read -r line
do
  source ".scripts/scripts/${line}"
done < scriptsList.txt

# counting all functions
scriptsCount=$(declare -F | grep "script_" | awk -F ' ' '{print $3}' | wc -l)

# debugging excluded functions
((scriptsCount=scriptsCount-$(cat .scripts/testing/exclude.txt | wc -l)))

# listing functions
declare -F | grep "script_" | awk -F ' ' '{print $3}' > scriptsFunctionTmp.txt

# debugging excluded functions
grep -vf .scripts/testing/exclude.txt scriptsFunctionTmp.txt > scriptsFunction.txt

# starting variable testingCount
testingCount=0

# starting loop tests for each function
while read -r line
do
  # validating if automated testing exists
  if test -f ".scripts/testing/${line}/run.sh"
  then
    # running automated test
    export line="${line}"
    .scripts/testing/${line}/run.sh

    # validating result
    if test -f ".scripts/testing/${line}/result.txt"
    then
      # modifying coverage percentage
      testingCount=$((testingCount + 1))
      # debug
      echo -ne "\e[32m Successful test: ${line} \e[0m \e[0m\n"
    else
      echo -ne "\e[31m Test failed: ${line} \e[0m \e[0m\n"
    fi

  else
    echo -ne "\e[33m Test skipped: ${line} \e[0m \e[0m\n"
  fi
done < scriptsFunction.txt

# printing result
echo -ne "\e[34m Test Coverage: $((${testingCount}*100/${scriptsCount}))% \e[0m \e[0m\n"
