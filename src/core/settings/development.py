from .common import *

DEBUG = True

ALLOWED_HOSTS = ['*']

# INSTALLED_APPS = [

# ] + INSTALLED_APPS


DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': os.getenv('DB_NAME', 'postgres'),
        'USER': os.getenv('DB_USER', 'postgres'),
        'PASSWORD': os.getenv('DB_PASSWORD', 'postgres'),
        'HOST': os.getenv('DB_HOST', 'db'),
        'PORT': os.getenv('DB_PORT', '5432'),
    }
}

# CSRF_COOKIE_SECURE = False
# SECURE_SSL_REDIRECT = False
# HOST_SCHEME = "http://"
