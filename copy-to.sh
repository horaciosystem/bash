appusu='/mnt/appusu/'
app='/Systex5/'
shell='shell/' 
funcoes='funcoes/'
user='horacio.f'
files='/home/horacio/Documentos/temp/license-vision/'
file='/home/horacio/Downloads/all.bat'

old_ifs=$IFS
IFS="
"
for line in $(cat $file); 
do 
	user="$line"
	echo $user

	destino="$appusu$user$app"
	cp "$files"*.ucl "$destino"
	cp "$files"*.uvz "$destino"

	destino="$destino$shell"
	cp "$files"*.jar "$destino"

	destino="$destino$funcoes"
	cp "$files"*.dll "$destino"
	cp "$files"*.DLL "$destino"
done

IFS=$old_ifs


