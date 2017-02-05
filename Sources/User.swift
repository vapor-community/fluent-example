import Fluent

class User: Entity {
    var id: Node?
    var name: String
    var age: Int

    // This is an attribute from an older version of Fluent. It is deprecated
    // and will be removed eventually
    var exists: Bool = false

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }

    func serialize() -> [String: Node?] {
        return [
            "name": Node(self.name),
            "age": Node(self.age)
        ]
    }

    class var table: String {
        return "users"
    }

    required init(serialized: [String: Node]) {
        id = serialized["id"]
        name = serialized["name"]?.string ?? ""
        age = serialized["age"]?.int ?? 0
    }

    required init(node: Node, in context: Context) throws {
        id = try node.extract("id")
        name = try node.extract("name")
        age = try node.extract("age")
    }

    /**
     The prepare method should call any methods
     it needs on the database to prepare.
     */
    static func prepare(_ database: Database) throws {
        try database.create(entity) { builder in
            builder.id()
            builder.string("name")
            builder.int("age")
        }
    }

    /**
     The revert method should undo any actions
     caused by the prepare method.

     If this is impossible, the `PreparationError.revertImpossible`
     error should be thrown.
     */
    static func revert(_ database: Database) throws {
        try database.delete(entity)
    }


    func makeNode(context: Context) throws -> Node {
        return try Node(node: [
            "id": id,
            "name": name,
            "age": age
        ])
    }

}
