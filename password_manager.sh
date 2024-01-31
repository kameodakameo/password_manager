#!/bin/bash

echo "パスワードマネージャーへようこそ！"

echo -n  "次の選択肢から入力してください(Add Password/Get Password/Exit)："
read selection
#Add Password が入力された場合
echo
if [ "$selection" = "Add Password" ]; then
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
	echo "Thank you!"
fi