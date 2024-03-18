// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DataProvider",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "DataProvider",
            targets: ["DataProvider"]),
    ],
    dependencies: [
        .package(path: "./Network"),
        .package(url: "https://github.com/Alamofire/Alamofire", "5.8.1"..."6.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "DataProvider",
            dependencies: [
                "Network",
                .product(name: "Alamofire", package: "Alamofire")
            ]),
        .testTarget(
            name: "DataProviderTests",
            dependencies: ["DataProvider"]),
    ]
)
