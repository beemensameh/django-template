venv = pdm run
path = manage.py

new-app:
	cd src && $(venv) python $(path) startapp $(app)

server:
	cd src && $(venv) python $(path) runserver 0.0.0.0:8000

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
	cd src && $(venv) black .
	cd src && $(venv) isort .
	cd src && $(venv) flake8 --statistics .

requirements:
	pdm export -f requirements --without-hashes --prod -o requirements.txt

dev-requirements:
	pdm export -f requirements --without-hashes -d -o requirements-dev.txt
