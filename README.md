```
> docker-compose up -d
> docker-compose exec web /bin/bash
root@8113164e2e81:/code# 
root@8113164e2e81:/code/myproject# ./manage.py makemigrations
Migrations for 'myapp':
  myapp/migrations/0001_initial.py
    - Create model Position
root@8113164e2e81:/code/myproject# ./manage.py migrate
Operations to perform:
  Apply all migrations: admin, auth, contenttypes, myapp, sessions
Running migrations:
  Applying myapp.0001_initial... OK
root@8113164e2e81:/code/myproject# ./manage.py shell
Python 3.8.3 (default, Jun  9 2020, 17:39:39)
[GCC 8.3.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
(InteractiveConsole)
>>> from django.contrib.gis.geos import Point
>>> from myapp.models import Position
>>> Position.objects.create(point=Point(100, 200))
<Position: Position object (1)>
>>> Position.objects.create(point=Point(300, 200))
<Position: Position object (2)>
>>> Position.objects.filter(point__contains=Point(300, 200))
<QuerySet [<Position: Position object (2)>]>
>>> from django.contrib.gis.geos import LineString
>>> Position.objects.filter(point__coveredby=LineString((0,200), (400, 200)))
<QuerySet [<Position: Position object (1)>, <Position: Position object (2)>]>
>
```
