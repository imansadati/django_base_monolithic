
# Django base with Gunicorn, Nginx, and Docker

A ready-to-use Django monolithic application configured for production and development, leveraging Docker, PostgreSQL, Gunicorn, and Nginx for optimal performance and scalability.



## Features

- **Environment Separation**: Distinct configurations for development and production environments.
- **Dockerized Services**: Includes separate Docker containers for the Django app, Nginx, and PostgreSQL.
- **Gunicorn Integration**: Handles WSGI requests in the production environment.
- **Static and Media File Management**: Proper handling via Nginx.
- **Database Readiness Check**: Ensures that the database is ready before running migrations.

## Environment Variables

The following environment variables must be configured in the `.env` file:

- **`DJANGO_ENV`**: Determines the environment mode (`development` or `production`).


## Scripts and Configuration

### `entrypoint.sh`

Handles Django initialization tasks like database migrations. Key functions:
- Waits for dependent services like the database.
- Executes Django management commands.

### `start.sh`

Starts the application based on the `DJANGO_ENV`:
- In development: Runs `runserver`.
- In production: Runs `collectstatic`, `migrate`, and Gunicorn.

## Setup and Usage 

### 1. Clone the Repository 
```bash
git clone https://github.com/imansadati/django_base_monolithic.git
```

### 2. Configure the Environment
Create a `.env` file and populate it with the necessary environment variables.

### 3. Create a Virtual Environment (for development mode)
```bash
python -m venv venv
venv/scripts/activate
python.exe -m pip install --upgrade pip
pip install -r .\requirements\production.txt
```

### 4. Build and Run (Development)
in `.env` file:
```bash
DJANGO_ENV=development
```
after run:
```bash
docker-compose up --build
```

### 5. Build and Run (Production)
in `.env` file:
```bash
DJANGO_ENV=production
```
after run:
```bash
docker-compose -f docker-compose.prod.yml up --build
```


## License

This project is licensed under the MIT License. See the LICENSE file for details.
