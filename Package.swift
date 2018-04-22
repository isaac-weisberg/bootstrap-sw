// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "Bootstrap-SW",
    products: [
        .library(
            name: "Bootstrap",
            targets: ["Bootstrap"]),
    ],
    dependencies: [
        
    ],
    targets: [
        .target(
            name: "Bootstrap",
            dependencies: [  ]),
        .testTarget(
            name: "BootstrapTests",
            dependencies: [ "Bootstrap" ])
    ]
)
