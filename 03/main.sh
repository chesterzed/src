#!/bin/bash

# Проверка корректности ввода
if [ ! $# = 4 ]; then
echo "Incorrect input"
exit 1
fi

for param in "$@"
do
if [[ ! $param =~ ^[1-6]$ ]]; then
echo "Not digit 1-6"
exit 1
fi
done

if [[ $1 = $2 || $3 = $4 ]]; then
    echo "same colors in one column"
    read -p 'do you want to try again? (Y/N)' ans
    case $ans in
      y | Y) echo "input colors (1-6):"
      read -r a b c d
      bash "$0" "$a" "$b" "$c" "$d";;
      *) echo "ok"
      exit 1;;
    esac
fi

# Массивы цветов
f=("\e[31m" "\e[32m" "\e[33m" "\e[34m" "\e[35m" "\e[37m")
b=("\e[41m" "\e[42m" "\e[43m" "\e[44m" "\e[45m" "\e[47m")

# Смещение индексов на 1, чтобы пользователь вводил числа от 1 до 6
b1=${b[$1-1]} # фон 1 (параметр 1)
f1=${f[$2-1]} # шрифт 1 (параметр 2)
b2=${b[$3-1]} # фон 2 (параметр 3)
f2=${f[$4-1]} # шрифт 2 (параметр 4)
end="\033[0m"

echo -e "${b1}${f1}HOSTNAME${end} = ${b2}${f2}$(hostname)${end}"
echo -e "${b1}${f1}TIMEZONE${end} = ${b2}${f2}$(timedatectl | grep 'Time zone' | awk '{print $3, $4, $5}')${end}"
echo -e "${b1}${f1}USER${end} = ${b2}${f2}$(whoami)${end}"
echo -e "${b1}${f1}OS${end} = ${b2}${f2}$(hostnamectl | grep "Operating System" | awk '{printf $3, $4, $5}')${end}"
echo -e "${b1}${f1}DATE${end} = ${b2}${f2}$(date | awk '{print $2, $3, $4, $5}')${end}"
echo -e "${b1}${f1}UPTIME${end} = ${b2}${f2}$(uptime -p)${end}"
echo -e "${b1}${f1}UPTIME_SEC${end} = ${b2}${f2}$(awk '{ print $1 }' /proc/uptime)${end}"
echo -e "${b1}${f1}IP${end} = ${b2}${f2}$(hostname -I)${end}"
ip a | grep -m 'inet' | cut -d '/' -f 2 $2 | awk '{a = $1}'
echo -e "${b1}${f1}MASK${end} = ${b2}${f2}$(ipcalc /$a | grep 'Netmask' | awk '{print $2}'${end}"
echo -e "${b1}${f1}GATEWAY${end} = ${b2}${f2}$(ip route | grep 'default' | awk '{print $3}')${end}"
echo -e "${b1}${f1}RAM_TOTAL${end} = ${b2}${f2}$(free --mega | grep 'Mem' | awk '{printf "%.3f GB", $2/1024}')${end}"
echo -e "${b1}${f1}RAM_USED${end} = ${b2}${f2}$(free --mega | grep 'Mem' | awk '{printf "%.3f GB", $3/1024}')${end}"
echo -e "${b1}${f1}RAM_FREE${end} = ${b2}${f2}$(free --mega | grep 'Mem' | awk '{printf "%.3f GB", $4/1024}')${end}"
echo -e "${b1}${f1}SPACE_ROOT${end} = ${b2}${f2}$(df -BM | grep '/$' | awk '{printf "%.2f MB", $2/1024}')${end}"
echo -e "${b1}${f1}SPACE_ROOT_USED${end} = ${b2}${f2}$(df -BM | grep '/$' | awk '{printf "%.2f MB", $3/1024}')${end}"
echo -e "${b1}${f1}SPACE_ROOT_FREE${end} = ${b2}${f2}$(df -BM | grep '/$' | awk '{printf "%.2f MB", $4/1024}')${end}"