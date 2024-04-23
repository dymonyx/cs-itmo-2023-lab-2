#!/bin/bash
ip="$1"
IFS="." read -a arr <<< "$ip"
get_ip(){
for ((i=0;i<${#arr[@]};i++));
do
  arr[i]=`echo "obase=2;${arr[$i]}" | bc`
  arr[i]=`printf "%08d" ${arr[$i]}`
done
}
get_ip
IFS=.
echo "${arr[*]}"
