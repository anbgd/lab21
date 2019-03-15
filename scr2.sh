#!/bin/bash
echo "Введите имя файла для конкатенации:"
read filename
echo "Введите кол-во конкатенаций:"
read num
echo "Введите максимальную длину результирующего файла в байтах:"
read maxsize
filesize=$(stat -c '%s' $filename)
calc=$(($maxsize/$filesize))
if [ $calc -le $num ]
then echo "Нельзя выполнить $num конкатенаций,тк превысится max длина, можно не более $calc:"
fi
i=1
while [ $i -le $calc ]
do
cat $filename >>new
(( i++ ))
done 
cat new
exit 0