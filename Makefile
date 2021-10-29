pipenv = pipenv run
path = manage.py

server:
	cd src && $(pipenv) python $(path) runserver 0.0.0.0:9000

migrate:
	cd src && $(pipenv) python $(path) makemigrations
	cd src && $(pipenv) python $(path) migrate

translation:
	cd src && $(pipenv) python $(path) makemessages -l $(lang)

complile_translation:
	cd src && $(pipenv) python $(path) compilemessages

lint:
	cd src && $(pipenv) isort .
	cd src && $(pipenv) autopep8 --in-place -r .
