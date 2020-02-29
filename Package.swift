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
        .executable(name: "json-schema", targets: ["Tool"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "0.0.1"),
        .package(url: "https://github.com/stencilproject/Stencil", from: "0.13.0")
    ],
    targets: [

        .target(
            name: "JSONSchema"),
        .testTarget(
            name: "JSONSchemaTests",
            dependencies: ["JSONSchema"]),

        .target(
            name: "Tool",
            dependencies: ["ArgumentParser", "Generator", "JSONSchema"]),

        .target(
            name: "Generator",
            dependencies: ["JSONSchema", "Stencil"]),
        .testTarget(
            name: "GeneratorTests",
            dependencies: ["Generator", "JSONSchema"]),
    ]
)
