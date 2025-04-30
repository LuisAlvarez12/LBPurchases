// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LBPurchases",
    platforms: [
        .macOS("14"),
        .watchOS("6.2"),
        .iOS("17"),
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "LBPurchases",
            targets: ["LBPurchases"]
        ),
    ],
    dependencies: [
        .package(name: "RevenueCat", url: "https://github.com/RevenueCat/purchases-ios.git", from: "5.22.1"),
        .package(name: "LBFoundation", url: "https://github.com/LuisAlvarez12/LBFoundation.git", from: "2.0.5"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "LBPurchases",
            dependencies: [
                .product(name: "RevenueCat", package: "RevenueCat"),
                .product(name: "RevenueCatUI", package: "RevenueCat"),
                .product(name: "LBFoundation", package: "LBFoundation"),
            ]
        ),
    ]
)
