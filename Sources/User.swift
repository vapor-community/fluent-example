import Fluent

class User: Model {
	var id: Value?
	var name: String

	init(name: String, email: String) {
		self.name = name
	}

	func serialize() -> [String: Value?] {
		return [
			"name": self.name,
		]
	}

	class var table: String {
		return "users"
	}

	required init(serialized: [String: Value]) {
		id = serialized["id"]
		name = serialized["name"]?.string ?? ""
	}

}