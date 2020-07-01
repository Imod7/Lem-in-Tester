RED="\e[31m"
ORANGE="\e[33m"
BLUE="\e[94m"
GREEN="\e[92m"
STOP="\e[0m"

# for file in testmaps/*; do
#     echo "$(basename "$file")"
# done

FILES="testmaps/flow*"

tests_passed=0
tests_failed=0
for f in $FILES;
do
  printf $BLUE
  printf "File: $(basename "$f") $STOP\n"
  # wc="$(./push_swap $line | wc -l)"
  # echo "$wc"
  output="$(./lem-in < $f > output)"
  # echo "$line"
  # echo "ouput $output"
  search="Lines Needed"
  # result=`grep "$search" output | cut -d ":" -f2 | tr -d '[:space:]'`
  result=`sed '1,/^$/d' output | wc -l`
  echo "Dom Lines :'"$result"'"
  dom=`expr $result + 0`
  # echo $dom

  # in the file output, it finds the empty line and puts the text
  # result=`awk '$0=($0)?$0:"HERE IT IS"' output`

  search="lines required"
  result=`grep "$search" $f | head -1 | cut -d ":" -f2 | tr -d '[:space:]'`
  echo "Gen Lines :'"$result"'"
  gen=`expr $result + 0`
  # echo $gen

  if [ "$dom" -lt "$gen" ]
  then
    printf "$GREEN PASS SUPER $RESET\n"
    let tests_passed++
  elif [ "$dom" -eq "$gen" ]
  then
    printf "$GREEN PASS $RESET\n"
    let tests_passed++
  else
    printf "$RED FAIL $RESET\n"
    let tests_failed++
  fi
done

printf $ORANGE
printf "FINAL RESULTS\n"
printf "=============\n"
printf $STOP
printf $GREEN 
printf "Tests Passed : $tests_passed $RESET\n"
printf $RED
printf "Tests Failed : $tests_failed $RESET"

