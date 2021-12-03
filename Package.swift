// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Publicist",
    products: [
        .executable(name: "publicist", targets: ["publicist"]),
        .library(name: "PublicistKit", targets: ["PublicistKit"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.0.0"),
        .package(name: "SwiftSyntax", url: "https://github.com/apple/swift-syntax.git", .exact("0.50400.0")),
    ],
    targets: [
        .target(
            name: "publicist",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                "PublicistKit"
            ]
        ),
        .target(
            name: "PublicistKit",
            dependencies: ["SwiftSyntax"]
        ),
        .testTarget(
            name: "PublicistKitTests",
            dependencies: ["PublicistKit"]
        )
    ]
)
