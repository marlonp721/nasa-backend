# README

* Ruby version

ruby 3.2.2 y Rails 7.1.3.4

* Instalar dependencias

```console
bundle install
```

* Crear la base de datos y realizar las migraciones

```console
rails db:create
rails db:migrate
```

* Correr el rake para obtener la data de la API de la NASA

```console
rails nasa:fetch_data
```
* Correr el proyecto

```console
rails server
```
