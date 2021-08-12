
# PostgreDRM(編集中)

PostgisとQGISの環境構築が同時に出来るDocker-composeです。

# Requirement

"hoge"を動かすのに必要なライブラリなどを列挙する

* wsl2
* ubuntu 20.04

# Installation And StartUP

1.Gitからリポジトリをcloneする

```bash
git clone https://github.com/0xeffec74/PostgreDRM.git
```

2.cloneしてきたリポジトリに移動する

```bash
cd PostgreDRM
```

3.docker-composeを起動する

```bash
docker-compose up -d
```

4.DBを初期化する

```bash
bash init-db.bash
```

# Usage(QGIS)

1.起動したコンテナの中に入る

```bash
docker exec -it qgis_container bash
```

2.QGISを起動する

```bash
qgis
```

事前にwindows側でxlaunchを立ち上げて置く必要があります。
xlaunchの起動方法についてはNoteをご参照ください。

# Usage(PostGIS)

1.起動したコンテナの中に入る

```bash
docker exec -it postgre_container bash
```

2.サンプルのテーブルを作成する

```bash
./docker-entrypoint-initdb.d/init-db.sh
```

3.SQLを実行する

```bash
./docker-entrypoint-initdb.d/init-db.sh
```

# Note

注意点などがあれば書く

# Author

* s.noge

# License

"PostgreDRM" is Confidential.
