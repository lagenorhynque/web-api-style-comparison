# web-api-style-comparison
Web API style comparison: REST, GraphQL, gRPC

## 開発環境構築

### ローカルDBのセットアップ

```sh
# DBの起動
docker compose up -d
# SQLファイルのインポート
## Biblog DBのテーブル定義
docker compose exec -T rdb mysql -uroot -proot biblog < mysql/ddl/biblog-tables.sql
docker compose exec -T rdb-test mysql -uroot -proot biblog_test < mysql/ddl/biblog-tables.sql
## Biblog DBのサンプルデータ
docker compose exec -T rdb mysql -uroot -proot biblog < mysql/dml/biblog-data.sql
```
