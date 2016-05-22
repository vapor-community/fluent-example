# Fluent Example

Clone this repo and run `swift build` to download the dependencies, then run `.build/debug/FluentApp`

View [Fluent](https://github.com/qutheory/fluent) for documentation.

Swift 2.2 or later is required.

## Example Table

SQLite file is here.

```bash
sqlite3 Database/main.sqlite
```

Run the following SQL query to set up the example table.

```sql
CREATE TABLE users(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL);
```

Works on Ubuntu.
