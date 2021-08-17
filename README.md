
# PostgreDRM

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

4.中に入って見る

```bash
psql -U test01
```

5.テーブルの一覧を確認する

```bash
\dt
```

6.テーブルの中身を確認する

```bash
select * from test_table;
```

# Note

## xlaunchのインストールと起動について

以下のサイトを参考にインストール・動作確認を行ってください。

[VcXsrv（Xサーバー）をWindowsにインストールしLinuxのGUIをリモート操作する設定方法](https://rin-ka.net/windows-x-server/#toc8)

DISPLAY変数は以下を設定しておくと便利です(~/.profileなどへの追記をお勧めします)。

```bash
export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0.0
```
