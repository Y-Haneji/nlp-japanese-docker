# nlp-japanese-docker

https://hub.docker.com/repository/docker/yhaneji/nlp-japanese のdockerイメージのレポジトリ。

[「作りながら学ぶ！PyTorchによる発展ディープラーニング」](https://github.com/YutaroOgawa/pytorch_advanced)の第7章、8章の自然言語処理を実行するための環境を構築できます。

## Dockerイメージのダウンロードとコンテナの立ち上げ

```sh:ターミナル
docker image pull yhaneji/nlp-japanese:1.0.0
cd (プロジェクトのディレクトリ)
docker container run --rm -it -v $(PWD):/tmp/working yhaneji/nlp-japanese:1.0.0
```

たったこれだけで、書籍のコードを実行する環境が整い、JupyterLabが立ち上がります。本Dockerイメージでは、自動でJupyterLabのブラウザは立ち上がらない（はず）ので、ターミナルに表示されたリンクを開きます。イメージのダウンロードは2回目以降は必要ありません。

## Dockerfileからイメージをビルドするには

```sh:ターミナル
cd (Dockerfileがあるディレクトリ)
docker image build --tag nlp-japanese .
```

## VSCodeでRemoteContainerを利用する方法
本レポジトリの`Dockerfile`と`.devcontainer`ディレクトリをプロジェクトのルートディレクトリに配置します。そしてVSCodeのコマンドパレットで`Remote-Containers: Reopen and Rebuild Container`を選びます。これでVSCodeと統合されたコンテナが開きます。
