#!/bin/bash
echo "パスワードマネージャーへようこそ！"
selection1="Add Password"
selection2="Get Password"
selection3="Exit"
echo
$selections=$selecton
echo
#以下は、繰り返し構文？
	echo -n  "次の選択肢から入力してください(Add Password/Get Password/Exit)："
	read selected
# （if文？）Add Password が入力された場合
if [ "$selections" = "$selection1" ]; then
	echo -n "サービス名を入力してください："
    read servicename
	echo -n "ユーザー名を入力してください：" 
	read username
	echo -n "パスワードを入力してください：" 
	read password
	echo	
	#パスワードの入力Enter後
	echo "パスワードの追加は成功しました。"
	echo $servicename $username $password >>pw.log
	#以下は、繰り返し構文？
	echo -n "次の選択肢から入力してください(Add Password/Get Password/Exit)："	
	read selected
	echo
#(if文？)Get Password が入力された場
elif [ "$selections" = "$selection2" ]; then	
	echo -n "サービス名を入力してください："
	read servicename
	## （if文？）サービス名が保存されていなかった場合
	if [ ! "$servicename" = "" ]; then
		echo "そのサービスは登録されていません。"
		## （elif？）サービス名が登録されていた場合
		else 
			echo "サービス名：" awk '{print $1}' pw.log
			echo "ユーザー名：" awk '{print $2}' pw.log
			echo "パスワード：" awk '{print $3}' pw.log
		echo
		#以下は、繰り返し構文？
		echo -n "次の選択肢から入力してください(Add Password/Get Password/Exit)："
		read servicename
	fi
#Exit が入力された場合
elif [ "$selections" = "$selection3" ]; then
	echo "Thank you!"
#Add Password/Get password/Exit 以外が入力された場合
else
	echo "入力が間違えています。Add Password/Get Password/Exit から入力してください。"
	echo -n "次の選択肢から入力してください(Add Password/Get Password/Exit)："
	read servicename
fi