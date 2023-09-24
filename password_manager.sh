#!/bin/bash

#パスワード追加処理
AddPassword(){
  echo "サービス名を入力してください：" 
  read service_name
  echo $service_name >> "./$service_name.txt"

  echo "ユーザー名を入力してください：" 
  read user_name
  echo $user_name >> "./$service_name.txt"

  echo "パスワードを入力してください：" 
  read password
  echo $password >> "./$service_name.txt"
}

#パスワード参照処理
GetPassword(){
  echo "Get"
}

#終了処理
Exit(){
  echo "Thank you!"
}

#メニュー表示処理
ShowMenu(){
  echo ""
  echo "次の選択肢からキーを入力してください"
  echo " a : Add Password"
  echo " b : Get Password"
  echo " c : Exit"
  echo ""
}

#main処理
main(){
  echo "パスワードマネージャーへようこそ！"
  ShowMenu
  read key

  while true
  do
    if [ $key = "a" ] > /dev/null 2>&1 ; then
      AddPassword
    elif [ $key = "b" ] > /dev/null 2>&1 ; then
      GetPassword
    elif [ $key = "c" ] > /dev/null 2>&1 ; then
      Exit
      break;
    else
      echo "入力が間違えています。Add Password / Get Password / Exit から入力してください。"
    fi
    
    ShowMenu
    read key
  done
}

main
