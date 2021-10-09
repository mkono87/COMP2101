interfaceList=$(ip -o link show | awk -F': ' '{print $2}')
ifArray=()
for i in $interfaceList; do
if [ $i != "lo" ]; then

ifArray+=$i
fi
done

echo $i