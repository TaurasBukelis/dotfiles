clock=$(lscpu | grep "CPU MHz" | awk '$1=$1' | cut -d" " -f3 | cut -d. -f1)
echo $clock MHz
