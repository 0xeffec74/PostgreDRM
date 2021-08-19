
# PostgreDRM

PostgisとQGISの環境構築が同時に出来るDocker-composeです。

# Requirement

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
docker-compose -f ./docker/docker-compose.yml up --build -d
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

## PostGISの動作確認を行う

1.起動したコンテナの中に入る

```bash
docker exec -it postgre_container bash
```

2.データベースの中に入る

```bash
psql -U docker -d postgre
```

3.テーブルの一覧を確認する

```SQL
\dt
```

4.テーブルの中身を確認する

```SQL
select * from test_table;
```

## PgRoutingの動作確認を行う

以下コマンドはデータベースの中に入って要る状態で実行してください。

1.PostGisの拡張機能をインストールする

```SQL
create extension postgis;
```

※すでにインストールされている場合

***
ERROR:  extension "postgis" already exists
***

と表示される場合があります。

2.pgroutingの拡張機能をインストールする

```SQL
create extension pgrouting;
```

※すでにインストールされている場合

***
ERROR:  extension "pgrouting" already exists
***

と表示される場合があります。

3.pgroutingが正常にインストールされているかどうかを確認する

```SQL
SELECT  * FROM pgr_version();
```

出力が以下のようになれば成功です。

```plaintext
 pgr_version
-------------
 3.2.1
(1 row)
```

4.テスト用のデータベースを作成する

```SQL
CREATE DATABASE d1;
```

5.テスト用のデータベースに接続する

```SQL
\c d1
```

6.テスト用のデータベースにPostGisの拡張機能をインストールする

```SQL
CREATE EXTENSION postgis;
```

7.テスト用のデータベースにpgroutingの拡張機能をインストールする

```SQL
CREATE EXTENSION pgrouting;
```

8.テスト用のテーブルを作成する

```SQL
CREATE TABLE edges (id serial, source int, target int, cost int);
```

9.テスト用のテーブルにデータをセットする

```SQL
INSERT INTO edges (source, target, cost) VALUES (1, 2, 7), (1, 3, 9), (1, 6, 14), (2, 3, 10), (2, 4, 15), (3, 4, 11), (3, 6, 2), (4, 5, 6), (5, 6, 9);
```

10.pgroutingを試してみる

```SQL
SELECT seq, node, edge, cost FROM pgr_dijkstra('SELECT id, source, target, cost FROM edges', 1, 5, directed:=false);
```

以下のような出力になれば成功です。

```plaintext
 seq | node | edge | cost  
-----+------+------+------  
   1 |    1 |    2 |    9  
   2 |    3 |    7 |    2  
   3 |    6 |    9 |    9  
   4 |    5 |   -1 |    0  
(4 rows)
```

11.テスト用のデータベースを削除する

以下の手順を実行して削除してください。

```SQL
\c postgre
```

```SQL
DROP DATABASE d1
```

```SQL
\q
```

# Note

## xlaunchのインストールと起動について

以下のサイトを参考にインストール・動作確認を行ってください。

[VcXsrv（Xサーバー）をWindowsにインストールしLinuxのGUIをリモート操作する設定方法](https://rin-ka.net/windows-x-server/#toc8)

DISPLAY変数は以下を設定しておくと便利です(~/.profileなどへの追記をお勧めします)。

```bash
export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0.0
```

## 参考サイト

[Postgresコマンド一覧](https://xn--qiita-jp4dtfrgoh.com/jerrywdlee/items/951bb28dacdc86abbf04)

[pgRoutingをはじめて使ってみた](https://qiita.com/aosho235/items/80aae5f31b3c7bdb5355)
