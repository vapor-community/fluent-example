import PackageDescription

let package = Package(
    name: "FluentApp",
    dependencies: [
        .Package(url: "https://github.com/vapor/fluent.git", majorVersion: 1, minor: 4),
        .Package(url: "https://github.com/vapor/fluent-sqlite.git", majorVersion: 1, minor: 1),
    ]
)
