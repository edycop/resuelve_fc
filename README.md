# Resuelve Football Club

**Resuelve FC** is an ruby backend application to compute the full salary of soccer player who gets bonus salary depending on the level and number of goals in the game.

### Dependencies

Dependecies of this project are located in the Gemfile. But the main are these ones:

- elixir: "~> 1.7",
- phoenix: "~> 1.5.12"

We need to create a new role in the PostgresQL (10) to create a DB:

- CREATE ROLE resuelve PASSWORD 'resuelve' NOSUPERUSER CREATEDB CREATEROLE INHERIT LOGIN;

To start your Phoenix server:

- Install dependencies with `mix deps.get`
- Create and migrate your database with `mix ecto.setup`
- Install Node.js dependencies with `npm install` inside the `assets` directory

### Run the app

- Start Phoenix endpoint with `mix phx.server`
- Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

### Run the tests

## Learn more

- Official website: https://www.phoenixframework.org/
- Guides: https://hexdocs.pm/phoenix/overview.html
- Docs: https://hexdocs.pm/phoenix
- Forum: https://elixirforum.com/c/phoenix-forum
- Source: https://github.com/phoenixframework/phoenix
