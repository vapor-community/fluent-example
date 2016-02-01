import Fluent

class User: Model {
	var id: String?
	var name: String

	init(name: String, email: String) {
		self.name = name
	}

	func serialize() -> [String: String] {
		return [
			"name": self.name,
		]
	}

	class var table: String {
		return "users"
	}

	required init(serialized: [String: String]) {
		self.id = serialized["id"]
		self.name = serialized["name"] ?? ""
	}

}