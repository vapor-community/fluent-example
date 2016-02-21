import Fluent
import FluentSQLite

Database.driver = SQLiteDriver()

if let user = User.find(1) {
	print(user.name)

	user.name = "Test"
	user.save()
}