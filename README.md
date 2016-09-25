## HS Store

This application was created with ruby 2.3.0, rails 4.2.6 and postgresql, please make sure you have those before going into to setup section.

```bash
$ ruby -v
$ ruby 2.3.0p0 (2015-12-25 revision 53290) [x86_64-darwin15]
$ rails -v 
$ Rails 4.2.6
$ psql -V
$ psql (PostgreSQL) 9.5.1
```

### Setup 

1. Clone this repository in your local machine
2. Fire up a terminal, go to the project folder and run:

```bash
$ bundle install
$ rake db:create
$ rake db:migrate
$ rake db:seed
```

After that just lift up rails server

```bash
$  rails s
```
