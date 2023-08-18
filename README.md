# Microservice Template

**Swagger UI:** link here ..

## Developer

### Prepare the Repo
- Press use this template in GitHub
- Write the project name and description
- Run `cd` in local machine to the project directory
- Clone the created project
- Create an environment and install requirements for the local development: `poetry install`
- Activate the environment: `poetry shell`

Now, your project is set up and you can go ahead to create apps

### Start development
- Go to source folder `cd src`
- Create a new app `./manage.py startapp <appname>`
- Edit the settings file to include your app. `INSTALLED_APPS = ['cool-app', ]`.
- Add your `url` files to `config/urls.py`
- Run project: `./manage.py runserver`

## Deployment Instructions

- In `docker-compose.yml`, replace the port number 8000 to the server deployment port number.
- Rename `gitlab-ci-example.yml` to `gitlab-ci.yml`
- In `gitlab-ci.yml`. Replace every `microservice-template` in any key you see to the microservice name.
- SSH to the server and create a deployment environment file at `/xware/deployments/microservice-template/.env src/.env`
- Edit the keys in `.env`. Make sure you provide keys for the database so that the default SQLite database is ignored
- Register the GitLab runner: `sudo gitlab-runner register`
- `git push` on the main branch.

## Governance
As deployment main, you should consider the following:
- In order to have a separate *production* and *deployment* servers, consider using a branch called `staging`. In the `gitlab-ci.yml` file, add `staging` as a tag value to `tags` key. When registering the runner on the staging server, include `staging` in the tags key. Then, pushes on this branch will automatically deploy to the staging server, while pushes to the main branch will deploy to the production server.
