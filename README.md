# airflow-docker-boilerplate

> Boilerplate containing a isolated Airflow environment to build data pipelines and ETL projects

- Easy and fast setup development environment :running:;

## Informations

* Based on python:3.7-stretch official image :snake:;
* PostgreSQL 11.1
* Install [Docker](https://www.docker.com/)
* Install [Docker Compose](https://docs.docker.com/compose/install/)
* Following the Airflow release from [Python Package Index](https://pypi.python.org/pypi/airflow)

## How to run/start a project?

### Running container
```bash
docker-compose up
```

### Stopping container
```bash
docker-compose down
```

**Access the Airflow Webserver: ** http://localhost:8080

That's it!

## Snippets

### Create User for WebServer

```python
from airflow import models, settings
from airflow.contrib.auth.backends.password_auth import PasswordUser

user = PasswordUser(models.User())
user.username = input("Enter username: ")
user.email = input("Enter email address: ")
user.password = input("Enter password: ")

session = settings.Session()
session.add(user)
session.commit()
session.close()
```
