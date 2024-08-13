new-app:
	cd src && python manage.py startapp $(app)

server:
	cd src && python manage.py runserver 0.0.0.0:8000

makemigrations:
	cd src && python manage.py makemigrations

migrate:
	cd src && python manage.py migrate

migrate-all: makemigrations migrate

rollback:
	cd src && python manage.py migrate $(app) $(step)

trans:
	cd src && python manage.py makemessages -l $(lang)

complile_translation:
	cd src && python manage.py compilemessages

lint:
	cd src && ruff check . --fix
	cd src && ruff format

test:
	cd src && python manage.py test

requirements:
	pdm export -f requirements --without-hashes --prod -o requirements.txt

dev-requirements:
	pdm export -f requirements --without-hashes -d -o requirements-dev.txt

test:
	cd src && python manage.py check
	cd src && python manage.py makemigrations --check
	cd src && python manage.py test
