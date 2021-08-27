# Docker Django Project + NGINX, PostgreSQL, Gunicorn

The project is a dockerized Django application with postgresql, gunicorn, and nginx.

The project purpose to show how can easily create a fully dockerized project for newbies, and of course working static file hosting too.

## 1. Running application

* Run the `build-dev.sh/bat` file. _(Mac/Linux or Windows)_
* The script will set up the environment variables, you can change the values if you want ex. database name, password, etc...
  * This values will use the docker and the django itself

## 2. Django settings

* SSH connect with the django in docker, and run all the necessary commands in it.
  * Please note maybe the `collectstatic` command will create extra directories, so must be run the bash with root privileges
```bash
# start the bash with root privileges
docker exec -it -u 0 dockerdjango_gunicorn_1 bash
# Enter the python venv
source env/bin/activate
python manage.py makemigrations  # Optional: The migrations script are already done
python manage.py migrate
python manage.py collectstatic  # Important! If you not run this, the static content will not hosting
python manage.py createsuperuser  # Optional: If yoy want to create a super user 
```
* If you want to exit the session press [CTRL + D] twice
* Now you can try the application, enter the `http://0.0.0.0` or `http://0.0.0.0/admin`

## Useful tips and advices

### Stop / Rebuild

* If you want to shut down the container, and remove them you can enter: `docker-compose down` to the terminal

### View Log

* If you want to check the log messages

```bash
docker-compose logs nginx
docker-compose logs gunicorn
docker-compose logs db
```

### SSH connect to the containers

Without root permissions 

```bash
docker exec -it dockerdjango_gunicorn_1 bash
docker exec -it dockerdjango_nginx_1 bash
docker exec -it dockerdjango_docker_db_1 bash
```

### Copy files to and from the container

```bash
$ docker cp ~/picture.png dockerdjango_gunicorn_1:/home/myproject/media/
$ docker cp dockerdjango_gunicorn_1:/home/myproject/media ~/Desktop/
```

* Let's see an example, you want to create a new app in the container, and want to copy to your local folder:
  * Enter the container, and starting it as you done in the 2. option _(with root permission)_, and activate the venv, then you can create a new app:

```bash
docker exec -it -u 0 dockerdjango_gunicorn_1 bash
source env/bin/activate
# Enter to the app folder, where you want to create the new app
ls  # If you want to list the directories
cd dockerdjango/apps
python ../../manage.py startapp test
# Now the app created
```

You can press [Ctrl + D] twice to exit the logged-in session

If you in your local terminal, or re-run the terminal, you can copy now the app

```bash
docker cp dockerdjango_gunicorn_1:/home/dockerdjango/dockerdjango/apps/test ./src/dockerdjango/dockerdjango/apps/
```

* Of course, you need to add to the `_base.py` file the new installed app, as you done it before locally

### More scripts

* You can create more copies from the base `build-dev.sh/bat`, if like: `build-production.sh`, `build-staging.sh`, and/or `build-test.sh`, then you can change `PIP_REQUIREMENTS` environment variable and change to different requirement txt, where you can install different dependencies what you need in your current build.


### PyCharm

Sadly if you use pycharm, it will not recognize the dockerized interpreter automatically, and it will load automatically your current installed python interpreter.
* You can follow the steps:
  1. Click to Add Interpreter option in Pycharm settings
  2. There you can choose the docker container, what is now called _dockerdjango_gunicorn:latest_
  3. In the path you can see automatically the python default directory, in this case it's wrong, because we created a venv.
     1. If you want to check your path, then follow the 2. point in this readme to activate the venv. 
     2. If done, enter `which python` command. Probably your result in this case will be `/home/dockerdjango/env/bin/python`
  4. Enter the `/home/dockerdjango/env/bin/python` path to the python path to python location manually.


### Now You have a fully configured Django Environment, so its time to make some fun :)