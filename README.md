rust で lambda 関数を実装して terraform でデプロイするサンプルです。

# requirements

- `zip` `make` `cargo` `terraform`
- `rustup target add x86_64-unknown-linux-musl` :クロスコンパイルに必要

# つかいかた

- `make build`
  - lambda 実行環境向けにクロスコンパイルし、バイナリを `./bootstrap.zip` に固めます
- `cd terraform && terraform init`
- `terraform apply`
  - (AWS 認証情報が適宜必要です)
- output に関数の URL が出力されます。curl 等で叩いてみましょう
- rust のソースを書き換えて `make build` `terraform apply` で更新できます

# 検討中

- terraform 側から build コマンドを実行するようにして `terraform apply` で全部完結させる
  - terraform 側の責務がちょっと広くなりすぎる感もあるのでどっちがいいのか悩ましいところ
