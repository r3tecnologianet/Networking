// swift-tools-version: 5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Networking",
    defaultLocalization: "pt-BR",
    platforms: [
        .iOS(.v13)
    ],
    products: [

        .library(
            name: "Networking",
            targets: ["Networking"]
        )
    ],
    dependencies: [

    ],
    targets: [

        .target(
            name: "Networking",
            dependencies: []),
        .testTarget(
            name: "NetworkingTests",
            dependencies: ["Networking"])
    ]
)
