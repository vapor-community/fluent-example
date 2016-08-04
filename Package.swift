import PackageDescription

let package = Package(
    name: "FluentApp",
    dependencies: [
        .Package(url: "https://github.com/vapor/fluent.git", majorVersion: 0, minor: 4),
        .Package(url: "https://github.com/qutheory/sqlite-driver.git", majorVersion: 0, minor: 4),
    ]
)
