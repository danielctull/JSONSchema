// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "JSONSchema",
    platforms: [
        .macOS(.v10_13),
        .iOS(.v11)
    ],
    products: [
        .library(name: "JSONSchema", targets: ["JSONSchema"]),
    ],
    targets: [
        .target(
            name: "JSONSchema"),
        .testTarget(
            name: "JSONSchemaTests",
            dependencies: ["JSONSchema"]),
    ]
)
