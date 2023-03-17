# 概要
shopify cliを利用するためのDockerコンテナ

# 背景
sopify theme devで起動したときに基本的にはlocalhostのみでしかリクエストを受け入れないようになっている
nginxのプロキシをすることで、localhostからのアクセスとみなしていいる
nginxを別のコンテナにすると、localhostだとみなされない可能性があるため、同じコンテナで動かしている
docker-compose.ymlはそっちの方が値の変更しやすかったからというだけ

# 利用方法

```bash
docker compose build
docker compose run --rm shopify shopify init
```

theme固定を入力することを想定してentrypoint.shを書いているので、必要に応じて修正してください

```bash
#ここはひとつのコマンドにしたかったけど、うまく標準入力を受け入れてくれなかったので、bashで起動する
docker compose run --rm shopify bash

# dockerコンテナ内部
cd theme
# --storeの引数は利用する環境に合わせて変更して下さい
shopify theme dev --store xxx.myshopify.com
```

URlが出てくるのでコンテナ外部のブラウザでアクセス
127.0.0.1へのリダイレクトになっており、エラーになるので、URLをコピーしてdockerコンテナに戻る

```bash
# Ctrl + z を押して、中断する
# curlを実行するが、URLに&が入っているので、""でくくるのと、バックグラウンドで実行したいので最後に&をつける
curl "コピーしたURL" &

fg
```
loginの文字列が出たらOKなので、Ctrl + cを押して処理を終了してコンテナを抜ける

```bash
exit
```

コンテナを起動すればOK。
場合によってはーdを付けてバックグラウンドで実行してください
```bash
docker compose up shopify
```
