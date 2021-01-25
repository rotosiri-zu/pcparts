# 【PCパーツ投稿サイト】
![demo](https://raw.github.com/wiki/rotosiri-zu/pcparts/images/c5a059a879d7ec3ea13ef0e5ad90ec99.gif)

PCパーツ投稿サイトはユーザーが使用しているパーツやユーザーが購入したパーツを投稿できます。
パーツを使用した感想を口コミで投稿できます。

# 【ポートフォリオURL】
https://pcparts-staging.herokuapp.com/

なお、各機能や使用技術を紹介した記事をQiitaにも投稿しました。
https://qiita.com/hongjitufang25/items/0c78602333ba5503dc9d

# 【開発した背景】
趣味で自作PCを作成したりしているのですが自分が知らないPCパーツのスペックをしりたい他のユーザーはどんなPCパーツを使っているのか気になり、自作PCを作成している他のユーザーからの紹介で使用しているPCパーツや購入したもので作成するときのパーツ選びに参考になればと思いWebアプリを作りました。

# 苦労した点
カテゴリー機能の機能追加でIDエラーの解決に時間がかかったところです。
解決した方法は検証と仮説を立てその後検索して一次情報を参考にして解決しました。

# 工夫した点
ホーム画面からゲストログインできるようにしホーム画面に機能の説明を記載したり説明とアイテム投稿一覧の境目に黒線を追加、詳細画面の口コミ投稿のフォームに黒線を追加してわかりやすくしました。

# 【使用言語、フレームワーク】
- HTML/CSS(SCSS)
- bootstrap4
- jquery
- rails 5.2.4.3
- ruby 2.6.6

# 【インフラ】
- GitHub
- heroku
- postgresql

# 【ER図】

![Database.png](./public/Database.png)

# 【機能一覧】
- PCPARTをクリックするとホーム画面に戻る
# ログイン/ログアウト機能
- 登録したユーザーやゲストログインでログインできます。ホーム画面からもゲストログインでログインすることができます。

![circleanimationmuvie](https://user-images.githubusercontent.com/55967256/97158576-f9f7f700-17bc-11eb-9565-cfeb83af94dc.gif)

# 投稿機能
- 会員登録することで自由に投稿することができます。
- 入力に誤りがあれば、投稿はされずエラ-メッセージが表示されます。

![2020-10-2619 42 59](https://user-images.githubusercontent.com/55967256/97173957-b4472880-17d4-11eb-8feb-a9cafe691aa5.gif)

# 詳細画面
- 投稿した商品の詳細画面です。

![スクリーンショット 2020-12-17 21.07.20.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/503777/65168280-60f6-ee6c-f9a0-fba89f82295d.png)

# マイページ機能
- ユーザーが投稿したアイテム一覧を確認することができます。

![224a16330e9b45b78577fffe23533062](https://user-images.githubusercontent.com/55967256/97175033-38e67680-17d6-11eb-85b7-846182c37687.gif)

# アイテム更新・削除機能
- 投稿したアイテムを更新・削除ができます。

![2020-10-2620 18 54](https://user-images.githubusercontent.com/55967256/97303777-32bbcd00-189e-11eb-8eb9-b8b40aaf6926.gif)

# ransackによる検索機能
- 投稿時に記入したタイトル名で検索できます。

![d32d3f013b5898f6588425a0f95a3f51](https://user-images.githubusercontent.com/55967256/97304632-5895a180-189f-11eb-9616-499052b40d46.gif)

# カテゴリー検索機能
- 投稿時に選択肢したカテゴリーで検索できます。

![1b3fedbfed2ba3dca6fd34f10a117d3f](https://user-images.githubusercontent.com/55967256/97288584-62140f00-1889-11eb-85c3-dda2f66fd1fb.gif)

# 口コミ投稿機能
- PCパーツの感想を投稿できます。
- 入力に誤りがあれば、投稿はされずエラ-メッセージが表示されます。

![2020-10-2720 33 12](https://user-images.githubusercontent.com/55967256/97299177-e7062500-1897-11eb-9600-1c2334678ed9.gif)

# 口コミ更新・削除機能
- 投稿した口コミを更新・削除ができます。

![2020-10-2620 24 43](https://user-images.githubusercontent.com/55967256/97303868-5252f580-189e-11eb-9c4b-d68c112638aa.gif)

- ページネーション機能
- 単体・統合テスト(RSpec, Capybara)
- 星評価機能(jQuery Raty)