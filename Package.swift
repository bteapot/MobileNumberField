// swift-tools-version: 5.10

import PackageDescription


let package = Package(
    name: "MobileNumberField",
    platforms: [
        .macOS(.v14),
        .iOS(.v17),
        .tvOS(.v17),
        .watchOS(.v10),
        .macCatalyst(.v17),
    ],
    products: [
        .library(
            name: "MobileNumberField",
            targets: ["MobileNumberField"]
        ),
    ],
    targets: [
        .target(
            name: "MobileNumberField"
        ),
        .testTarget(
            name: "MobileNumberFieldTests",
            dependencies: ["MobileNumberField"]
        ),
    ]
)
