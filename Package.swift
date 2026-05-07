// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "iban4j²JavApi",
    platforms: [.macOS(.v26),.visionOS(.v1),.iOS(.v16),.tvOS(.v16)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "iban4j2JavApi",
            targets: ["iban4j2JavApi"]),
    ],
    dependencies: [
      .package(
        url: "https://github.com/bastie/JavApi4Swift.git",
        .upToNextMajor(from: "0.8.1")
      )
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
          name: "iban4j2JavApi",
          dependencies: [
            .product(name: "JavApi", package: "JavApi4Swift")
          ],
          swiftSettings: [
            .enableExperimentalFeature("StrictConcurrency")
          ]
        ),
        .testTarget(
            name: "iban4j2JavApiTests",
            dependencies: ["iban4j2JavApi",
                           .product(name: "JavApi", package: "JavApi4Swift")
                           ]
        ),
    ]
)


