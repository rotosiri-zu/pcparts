## 【PCパーツ投稿サイト】
![demo](https://raw.github.com/wiki/rotosiri-zu/pcparts/images/c5a059a879d7ec3ea13ef0e5ad90ec99.gif)

## 概要
PCパーツを投稿するアプリケーションです。ユーザーが使用しているパーツやユーザーが購入したパーツを登録できます。
登録した情報はリストとして表示され、編集、削除、ページネーションが可能です。
スマートフォン様にレスポンシブ対応もしております。
パーツを使用した感想を口コミで投稿できます。

## 【ポートフォリオURL】
なお、各機能や使用技術を紹介した記事をQiitaにも投稿しました。
https://qiita.com/hongjitufang25/items/0c78602333ba5503dc9d

Amazon Web Services https://pcparts.work/


## 【開発した背景】
私は趣味で自作PCを作成しており、他のユーザーがどんなパーツを使っているのか興味がありました。そこで、自作PCを作成しているユーザー同士が、パーツの投稿をし合うSNSを作ることで、パーツ選びに対する関心を深めたり、購入時の参考にできると思い制作しました。

## 使用イメージ
## ログイン/ログアウト
![circleanimationmuvie](https://user-images.githubusercontent.com/55967256/97158576-f9f7f700-17bc-11eb-9565-cfeb83af94dc.gif)

## 投稿機能
![2020-10-2619 42 59](https://user-images.githubusercontent.com/55967256/97173957-b4472880-17d4-11eb-8feb-a9cafe691aa5.gif)

## 詳細画面
![スクリーンショット 2020-12-17 21.07.20.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/503777/65168280-60f6-ee6c-f9a0-fba89f82295d.png)

## マイページ
![224a16330e9b45b78577fffe23533062](https://user-images.githubusercontent.com/55967256/97175033-38e67680-17d6-11eb-85b7-846182c37687.gif)

## アイテム更新・削除
![2020-10-2620 18 54](https://user-images.githubusercontent.com/55967256/97303777-32bbcd00-189e-11eb-8eb9-b8b40aaf6926.gif)

## 検索
![d32d3f013b5898f6588425a0f95a3f51](https://user-images.githubusercontent.com/55967256/97304632-5895a180-189f-11eb-9616-499052b40d46.gif)

## カテゴリー検索
![1b3fedbfed2ba3dca6fd34f10a117d3f](https://user-images.githubusercontent.com/55967256/97288584-62140f00-1889-11eb-85c3-dda2f66fd1fb.gif)

## 口コミ投稿
![2020-10-2720 33 12](https://user-images.githubusercontent.com/55967256/97299177-e7062500-1897-11eb-9600-1c2334678ed9.gif)

## 口コミ更新・削除
![2020-10-2620 24 43](https://user-images.githubusercontent.com/55967256/97303868-5252f580-189e-11eb-9c4b-d68c112638aa.gif)

## 使用技術

* OS
  * mac Catalina バージョン 10.15.7
* フロントエンド
  * jQuery 4.4.0
  * Vue.js 2.6.12
  * HTML/SCSS/bootstrap4

* バックエンド
  * Ruby 2.6.6
  * Ruby on Rails 5.2.4.3

* インフラ
  * CircleCI
  * Docker 3.3.3/docker-compose 1.29.1
  * PostgreSQL 13.2/pgadmin4
  * Amazon Web Services(EC2, S3, VPC, Route 53, ACM, ALB, IAM, RDS)

* バージョン管理
  * github

* その他の使用ツール
  * Visual Studio Code
  * draw.io

## 【ER図】

![Database.png](./public/Database.png)

## 各テーブルについて

| テーブル名|説明|
|:-:|:-:|
|users|登録ユーザー情報|
|posts|商品投稿の情報|
|categories|商品カテゴリーの情報|
|comments|商品の評価、コメント情報|


## [AWS構成図]
![AWS.png](./public/AWS.png)

## 【機能一覧】
* ユーザー登録関連
  * 新規登録
  * ログイン、ログアウト機能
  * かんたんログイン機能（ゲストユーザーログイン）
* ページネーション機能
  * コメント一覧、投稿一覧
* コメント機能
  * コメント一覧機能（ページネーション）
* 検索機能
  * 投稿の検索
* フラッシュメッセージ表示機能
  * 投稿、編集、削除、ログイン、ログアウト、存在しない商品確認時にフラッシュメッセージを表示
* 画像アップロード(Amason S3バケット)
* マイページ関連
  * 投稿一覧
* RSpecテスト

## 環境構築手順
1. イメージを生成する

```
$ docker-compose build
```

2. Bundle Install

```
$ docker-compose exec web bundle install
```

3. コンテナを起動する
   データベースセットアップ前にコンテナを起動していないとデータベースのセットアップコマンドが失敗する

```
$ docker-compose up
```

4. データベースをセットアップする

```
$ docker-compose exec web bundle exec rails db:create db:migrate db:seed_fu
```

6. RuboCop を実行する

```
$ bundle exec  rubocop
```

## npm ライブラリインストール

```
docker-compose exec web yarn
```

docker-compose を利用しないとホスト用のライブラリがインストールされてしまい、Docker イメージ上の Linux OS 上で実行できなくなる場合がある。