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
- Replace every `{{project_name}}` in any key you see to the microservice name.
- Create a new app `make new-app app=<appname>`
- Edit the settings file to include your app. `INSTALLED_APPS = ['<appname>', ]`.
- Add your `url` files to `config/urls.py`
- Run project: `make server`

## Deployment Instructions

- Add some varibales in environment variables in CI/CD tool.
    - `PG_DB_STAGING` is the database name in staging
    - `PG_USER_STAGING` is the user name in staging
    - `CONFIG_PATH_STAGING` is the env file path in staging
    - `PG_DB_PROD` is the database name in production
    - `PG_USER_PROD` is the uesr name in production
    - `CONFIG_PATH_PRODUCTION` is the env file path in production
- Rename `gitlab-ci-example.yml` to `gitlab-ci.yml`
- SSH to the server and create a deployment environment file at `.env`
- Edit the keys in `.env`. Make sure you provide keys for the database so that the default SQLite database is ignored
- Register the CI/CD tool
    - Register the GitLab runner: `sudo gitlab-runner register`
- Push or merge on the main branch.

## Governance
As deployment main, you should consider the following:
- In order to have a separate *production* and *deployment* servers, consider using a branch called `staging`. In the `gitlab-ci.yml` file, add `staging` as a tag value to `tags` key. When registering the runner on the staging server, include `staging` in the tags key. Then, pushes on this branch will automatically deploy to the staging server, while pushes to the main branch will deploy to the production server.
