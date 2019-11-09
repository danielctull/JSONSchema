// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "JSONSchema",
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
