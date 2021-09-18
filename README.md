# remaining_supplements

remaining_supplementsは、定量摂取しているサプリメントの残量とリマインドを管理するサービスです。

内容量と1日あたりの摂取量を設定することで、サプリメントがなくなる日がわかり、なくなる前にリマインドを設定することで買い忘れを防止してくれます。

## ローカルでの立ち上げ方法
```
$ bundle install
$ yarn install --check-files
$ rails db:create
$ rails db:migrate
$ rails s
```
## seed(初期データ)
```
$ rails db:seed
```
以下のアカウントでログインできます。
```  
eメール: test@example.com
パスワード: testtest
```

## test
```
$ bundle exec rspec
```
