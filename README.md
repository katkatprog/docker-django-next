# [作成中]
## Django × Next.js × MySQL × docker-composeの開発環境のテンプレート

### envファイル(git clone 後に作成してください。)
- docker-django-next/.env に記載する環境変数
```
WORK_DIR=/root/src
FRONT_PORT=<任意>
FRONT_PROJECT_NAME=next_project
BACK_PORT=<任意>
BACK_PROJECT_NAME=django_project
DB_PORT=<任意>
DB_NAME=<任意>
DB_USER=<任意>
DB_PASS=<任意>
DB_ROOT_PASS=<任意>
```
- docker-django-next/backend/django_project/.env に記載する環境変数
```
DJANGO_SECRET_KEY=django-insecure-******************************
```
