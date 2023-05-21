// swift-tools-version:5.7
import PackageDescription
let package = Package(
    name: "src",
    platforms: [.macOS(.v11), .iOS(.v15)],
    products: [
        .executable(name: "src", targets: ["src"])
    ],
    dependencies: [
        .package(url: "https://github.com/TokamakUI/Tokamak", from: "0.11.0")
    ],
    targets: [
        .executableTarget(
            name: "src",
            dependencies: [
                "srcLibrary",
                .product(name: "TokamakShim", package: "Tokamak")
            ]),
        .target(
            name: "srcLibrary",
            dependencies: []),
        .testTarget(
            name: "srcLibraryTests",
            dependencies: ["srcLibrary"]),
    ]
)
