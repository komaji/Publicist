// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "hesoten",
    products: [
        .executable(name: "hesoten", targets: ["hesoten"]),
        .library(name: "HesotenKit", targets: ["HesotenKit"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.0.0"),
        .package(name: "SwiftSyntax", url: "https://github.com/apple/swift-syntax.git", .exact("0.50400.0")),
    ],
    targets: [
        .target(
            name: "hesoten",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                "HesotenKit"
            ]
        ),
        .target(
            name: "HesotenKit",
            dependencies: ["SwiftSyntax"]
        ),
        .testTarget(
            name: "hesotenTests",
            dependencies: ["HesotenKit"]
        ),
    ]
)
