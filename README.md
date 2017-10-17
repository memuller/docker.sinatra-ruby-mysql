# Docker Ruby Sinatra MySQL Env

An skeleton for **Sinatra** applications using **MySQL**. Includes a **Docker** stack for running it.

## Usage

After cloning the repo, you may want to customize the database name and password at `docker-compose.yml`.

To build the docker containers, run `make build`. If there are any `.sql` files in the `./db` folder, they will be run on the database, in alphabetical order. You may use that to create tables or load sample data.

Afterwards, run the stack with `make run`. The Sinatra app will be available at _http://localhost:3000_ , and will auto-reload via the _Shotgun_ gem.

While the stack is running, you can access a MySQL prompt with `make mysql`.


## Stack

### DB

Standard _mysql:5.5_ image.

### Ruby

Custom image based on _ruby:alpine3.4_ . 3.4 is used because I've had some trouble building the `mysql2` gem on the most recent Alpine version (3.6).

The image install a few dev packages for Ruby and MySQL, Git, and curl. That's a lot of packages (around 400MB) - you may want to remove a few of them; or just remove them all and add just what you need to build your gems.

The image then runs a `bundle install`, performs some cleanup, then runs `rackup`.
