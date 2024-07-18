# README

* Ruby version

ruby 3.2.2 y Rails 7.1.3.4

* Clonar el repositorio

```console
git clone https://github.com/marlonp721/nasa-backend.git
cd nasa-backend
```

+ Asegurarse de tener postgreSQL

```console
psql --version
```

* Instalar dependencias

```console
bundle install
```

* Crear la base de datos y realizar las migraciones

```console
rails db:create
rails db:migrate
```

* Correr el rake para obtener la data de la API de la NASA (este paso es importante porque se registran las imagenes y asteroides en nuestra base de datos local)

```console
rails nasa:fetch_data
```
* Correr el proyecto

```console
rails server
```

* Verificar que este corriendo el proyecto

```console
http://localhost:3000/
```
