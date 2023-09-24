## PASSWORD_MANAGER_APPRENTICE
## 概要
  [アプレンティスWebテスト](https://github.com/APPRENTICE-jp/apprentice-challenge/blob/main/quest/linux/PASSWORD_MANAGER.md)の課題です。ステップ1からステップ3まで仕様に従い実装しています。

## 基本機能
### パスワード追加機能 :
サービスごとにパスワードを追加できます。

### パスワード参照機能 :
サービスごとに追加したパスワードを参照できます。

### パスワード暗号化/復号化機能 :
パスワードを追加する時に暗号化、参照する際に復号化できます。

## 工夫した点
### 暗号化/復号化 : 
[gpg](https://gnupg.org/documentation/manuals/gnupg24/gpg.1.html)を使用して、ファイルの暗号化と復号化を実装しています。

### 関数化 : 
共通の処理や処理が複雑になった場合、別の関数に切り分けて可読性と拡張性を意識して実装しています。

### key入力簡易化 :
menu選択時のkey入力をa,b,cで選択できるように、以下のような形でkey入力を簡易化させました。
```sh
次の選択肢からキーを入力してください
 a : Add Password
 b : Get Password
 c : Exit
```

## 実行方法
```sh
#password_manager.shの実行権限を付与
$ chmod a+x password_manager.sh
#実行
$ ./password_manager.sh

パスワードマネージャーへようこそ！

次の選択肢からキーを入力してください
 a : Add Password
 b : Get Password
 c : Exit

#aを入力した場合
$ a

サービス名を入力してください：
$ test_service
ユーザー名を入力してください：
$ test_user
パスワードを入力してください：
$ test_pass

#このタイミングで暗号化のためのパスフレーズ入力が求められます

#パスフレーズ入力後、暗号化が成功した場合
test_service.txtを暗号化します
test_service.txtを暗号化したtest_service.txt.gpgを作成しました。

#bを入力した場合
$ b

#現在登録されているサービス名を表示
--サービス名リスト--

test_service

-----------------
サービス名を入力してください：
$ test_service

test_service.txt.gpgを復号化します
gpg: AES256.CFB暗号化済みデータ
gpg: 1 個のパスフレーズで暗号化

#test_serviceの情報を表示
サービス名 : test_service
ユーザー名 : test_user
パスワード : test_pas

#cを入力した場合、処理を終了
$ c
Thank you!
```
