import Fluent
import FluentSQLite

do {
    let driver = try SQLiteDriver()
    Database.default = Database(driver)

    let results = try driver.raw("SELECT sqlite_version();")

    if
        let row = results.array?.first?.object,
        let version = row["sqlite_version()"]?.string
    {
        print("SQLite Version: \(version)")
    }

} catch {
    print("Could not initialize driver: \(error)")
}

// Database preparation code from <https://github.com/vapor/fluent-provider/blob/master/Sources/Prepare.swift#L49-L62>

let preparations: [Preparation.Type] = [User.self]
if let database = Database.default {
  do {
      try preparations.forEach { preparation in
          let name = "\(preparation.self)"

          let hasPrepared = try database.hasPrepared(preparation)
          // only prepare the unprepared
          guard !hasPrepared else { return }
          print("Preparing \(name)")
          try database.prepare(preparation)
          print("Prepared \(name)")
      }
  } catch {
      print("Could not modify user: \(error)")
  }

  print("Database prepared")
}

do {
    if var user = try User.find(1) {
        print(user.name)

        //increments the user's age with every run
        user.age = user.age + 1

        try user.save()
        print("\(user.name) is \(user.age) iterations old")
    } else {
        print("Could not find any users")
        var newUser = User(name: "vapor", age: 1)
        try newUser.save()
        print("Added a user named \(newUser.name)")
    }
} catch {
    print("Could not modify user: \(error)")
}
