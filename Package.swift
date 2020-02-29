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
    dependencies: [
        .package(url: "https://github.com/stencilproject/Stencil", from: "0.13.0")
    ],
    targets: [
        .target(
            name: "JSONSchema"),
        .testTarget(
            name: "JSONSchemaTests",
            dependencies: ["JSONSchema"]),

        .target(
            name: "JSONSchemaGenerator",
            dependencies: [
                "JSONSchema",
                "Stencil"
            ]),
        .testTarget(
            name: "JSONSchemaGeneratorTests",
            dependencies: ["JSONSchema", "JSONSchemaGenerator"]),
    ]
)
