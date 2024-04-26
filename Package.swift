// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "UUIDV7",
  platforms: [.visionOS(.v1), .iOS(.v12)],
  products: [
    // Products define the executables and libraries a package produces, making them visible to other packages.
    .library(
      name: "UUIDV7",
      targets: ["UUIDV7"])
  ],
  targets: [
    // Targets are the basic building blocks of a package, defining a module or a test suite.
    // Targets can depend on other targets in this package and products from dependencies.
    .target(
      name: "UUIDV7"),
    .testTarget(
      name: "UUIDV7Tests",
      dependencies: ["UUIDV7"])
  ]
)
