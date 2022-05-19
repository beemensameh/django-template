venv = poetry run
path = manage.py

server:
	cd src && $(venv) python $(path) runserver 0.0.0.0:9000

migrate:
	cd src && $(venv) python $(path) makemigrations
	cd src && $(venv) python $(path) migrate

rollback:
	cd src && $(venv) python $(path) migrate $(model) $(step)

translation:
	cd src && $(venv) python $(path) makemessages -l $(lang)

complile_translation:
	cd src && $(venv) python $(path) compilemessages

lint:
	cd src && $(venv) autopep8 --in-place -r .
	cd src && $(venv) isort .
	cd src && $(venv) flake8 --statistics .
