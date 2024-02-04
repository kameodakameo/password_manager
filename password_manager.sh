#!/bin/bash

selection1="Add Password"
selection2="Get Password"
selection3="Exit"

echo "パスワードマネージャーへようこそ！"
while :
do
	echo -n "次の選択肢から入力してください(Add Password/Get Password/Exit)："
	read selection
#Add Password が入力された場合
	if [ "$selection" = "$selection1" ]; then
		echo -n "サービス名を入力してください："
    	read servicename
		echo -n "ユーザー名を入力してください：" 
		read username
		echo -n "パスワードを入力してください：" 
		read password
		echo	
		echo $servicename $username $password >>pw.log
		echo "パスワードの追加は成功しました。"
	elif [ "$selection" = "$selection2" ]; then
		echo -n "サービス名を入力してください："
		read searchname
			if ! grep $searchname pw.log >/dev/null; then
				echo "そのサービスは登録されていません。"
			else
				echo -n "サービス名："
				echo cat | grep "$searchname" pw.log | awk '{print $1}'
				echo -n "ユーザー名："
				echo cat | grep "$searchname" pw.log | awk '{print $2}'
				echo -n "パスワード："
				echo cat | grep "$searchname" pw.log | awk '{print $3}'
			fi
	elif [ "$selection" = "$selection3" ]; then
		echo "Thank you!"
		break
	else
		echo "入力が間違えています。Add Password/Get Password/Exit から入力してください。"
		echo
	fi
done