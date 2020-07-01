#!/bin/bash

# In this script I only open a new iterm window 10 times
# When each new iterm window is opened then it automatically 
# runs the script generate_maps.sh because I added in file
#  ~/.zshrc (at the end of the file) this line 
# . /Users/dominiquesaripapazoglou/Documents/Lemin-Tester/generate_maps.sh

counter=1
while [ $counter -le 10 ]
do
  echo $counter
  filename="${opt}${counter}"
  echo $filename
  # gen="$(var=$(ps -ef | grep bash | awk '{print $2}' | head -n 1))"
  # gen="$(kill -9 $var)"
  # opens terminal but then I can't control terminal afterwards  
  gen="$(open . -a iterm)"
  # gen="$(sh | ./generator --flow-one > dom1)"
  # gen="$(./generator --flow-ten > dom2)"
  ((counter++))
done




