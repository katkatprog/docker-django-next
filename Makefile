include .env
app_name=app #アプリケーション名(デフォルトでapp)

#使い方 make django-app app_name=api → python manage.py startapp apiが実行される。
django-app:
	docker-compose run --rm backend sh -c "cd $(BACK_PROJECT_NAME) && pipenv run django-app $(app_name)"

django-shell:
	docker-compose exec backend sh -c "cd $(BACK_PROJECT_NAME) && pipenv run django-shell"

# front_node_modulesボリュームにnodeのモジュールをインストールする。
npm-install:
	docker-compose run --rm frontend sh -c "cd $(FRONT_PROJECT_NAME) && npm install"

# back_py_modulesボリュームにpythonモジュールをインストールする。
pipenv-install:
	docker-compose run --rm backend sh -c "cd $(BACK_PROJECT_NAME) && pipenv install"

build:
	docker-compose build --no-cache
	@make pipenv-install
	@make npm-install

db-login:
	docker-compose exec db sh -c 'mysql -u ${MYSQL_USER} -p${MYSQL_PASSWORD}'

rm-volumes:
	docker volume rm next_django_db_store
	docker volume rm next_django_front_node_modules

#イメージ全削除する場合。
rm-all-images:
	docker ps -aq | xargs docker rm
	docker images -aq | xargs docker rmi
