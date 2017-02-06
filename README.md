# Fluent Example

1. Read through the Example Table section below to setup the sample database
2. Run `swift package update` to download dependencies
3. Run `swift build` to build the example application
4. Execute the program `.build/debug/FluentApp`

View [Fluent](https://github.com/vapor/fluent) for documentation.

Swift 3.0 or later is required.

## Example Table

1. Install the `sqlite3` package. It's recommended to use a package manager:

On macOS use [brew](http://brew.sh):

```sh
brew install sqlite3
```

On Ubuntu use `apt-get`

```sh
sudo apt-get update
sudo apt-get install sqlite3 libsqlite3-dev
```

Using the `sqlite3` command, create a database in the location the example
app will look for:

```bash
sqlite3 Database/main.sqlite
```

That will put you in a sql prompt. Copy and paste the following SQL query to set up the example table.

```sql
CREATE TABLE users(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL, age INT NOT NULL);
```

Then type `exit;` and you can open up the application with the steps at the top of this README.

Works on macOS and Ubuntu.
