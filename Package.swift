import PackageDescription

let package = Package(
    name: "FluentApp",
    dependencies: [
        //.Package(url: "https://github.com/tannernelson/vapor.git", majorVersion: 0),
        .Package(url: "https://github.com/tannernelson/fluent.git", majorVersion: 0),
        .Package(url: "https://github.com/tannernelson/fluent-sqlite.git", majorVersion: 0),
    ]
)