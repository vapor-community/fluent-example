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
