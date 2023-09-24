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
  EncriptFile $service_name
}

#パスワード参照処理
GetPassword(){
  echo "--サービス名リスト--"
  echo ""
  for i in *.txt.gpg; do echo "${i%.txt.gpg}"; done
  echo ""
  echo "--------------------"

  echo "サービス名を入力してください："
  read name
  echo ""
  ReadFile "$name"
}

#終了処理
Exit(){
  echo "Thank you!"
}

#パスワードファイル読み込み処理
ReadFile(){
  dataname=("サービス名" "ユーザー名" "パスワード")
  filename=./$1.txt.gpg
  if [[ -f "$filename" ]]; then
      DecriptFile $1
      i=0
      while read line
      do
        echo "${dataname[$i]} : $line"
        i=$((i+1))
      done < ./tmp_info.txt
      rm ./tmp_info.txt
  else
      echo "そのサービスは登録されていません。"
  fi
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

#暗号化処理
EncriptFile(){
  echo "$1.txtを暗号化します"
  gpg -c $1.txt
  rm $1.txt
  echo "$1.txtを暗号化した$1.txt.gpgを作成しました。"
}

#復号化処理
DecriptFile(){
  echo "$1.txt.gpgを復号化します"
  gpg -d $1.txt.gpg >> tmp_info.txt
}

#main処理
main(){
  echo "パスワードマネージャーへようこそ！"
  ShowMenu
  read key

  while true
  do
    if [ $key = "a" ] ; then
      AddPassword
    elif [ $key = "b" ] ; then
      GetPassword
    elif [ $key = "c" ] ; then
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
