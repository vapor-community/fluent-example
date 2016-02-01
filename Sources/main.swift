import Vapor

import Fluent
import SQLiteDriver

Database.driver = SQLiteDriver()

Route.get("users") { request in

	if let user = User.find(1) {
		return user.name
	} else {
		return "No user with id 1"
	}

}

Route.post("users") { request in

	guard let user = User.find(1) else {
		return "No user with id 1"
	}
	guard let name = request.data["name"] else {
		return "please put a name"
	}

	user.name = name
	user.save()

	return "done"
}

let server = Server()
server.run(port: 8080)