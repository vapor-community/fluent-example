import Fluent
import FluentSQLite

do {
    let driver = try SQLiteDriver()
    Database.default = Database(driver: driver)

    let results = try driver.raw("SELECT sqlite_version();")

    if
        let row = results.first,
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

        //increments the user's name with every run
        let count = Int(user.name) ?? 0
        user.name = "\(count + 1)"

        try user.save()
    }
} catch {
    print("Could not modify user: \(error)")
}
