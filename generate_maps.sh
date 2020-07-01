RANDOM=$$

filename="flow-one${RANDOM}"
echo $filename
gen="$(./generator --flow-one > testmaps/$filename)"

filename="flow-ten${RANDOM}"
echo $filename
gen="$(./generator --flow-ten > testmaps/$filename)"

filename="flow-thousand${RANDOM}"
echo $filename
gen="$(./generator --flow-thousand > testmaps/$filename)"

filename="big${RANDOM}"
echo $filename
gen="$(./generator --big > testmaps/$filename)"

filename="big-superposition${RANDOM}"
echo $filename
gen="$(./generator --big-superposition > testmaps/$filename)"
