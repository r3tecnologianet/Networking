// swift-tools-version: 5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "R3Networking",
    defaultLocalization: "pt-BR",
    platforms: [
        .iOS(.v13)
    ],
    products: [

        .library(
            name: "R3Networking",
            targets: ["R3Networking"]
        )
    ],
    dependencies: [

    ],
    targets: [

        .target(
            name: "R3Networking",
            dependencies: []),
        .testTarget(
            name: "R3NetworkingTests",
            dependencies: ["R3Networking"])
    ]
)
