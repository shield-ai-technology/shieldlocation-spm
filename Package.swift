// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "shieldlocation-spm",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(
            name: "ShieldLocation",
            targets: ["ShieldLocationLibrary"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/shield-ai-technology/shieldfraud-spm.git", branch: "main")
    ],
    targets: [
        .binaryTarget(
            name: "ShieldLocationAnalysisSPM",
            url: "https://s3.amazonaws.com/cashshield-sdk/shieldlocation-spm-ios-swift-1-0-2.zip",
            checksum: "8e7d9c8dc59b5a8b0e721d2eb60d7fb66717d007c781eb99779a7fbdb034b9aa"
        ),
        .binaryTarget(
            name: "SwiftProtobuf",
            path: "Frameworks/SwiftProtobuf.xcframework"
        ),
        .target(
            name: "ShieldLocationLibrary",
            dependencies: [
                "ShieldLocationAnalysisSPM",
                "SwiftProtobuf",
                .product(name: "ShieldFraud", package: "shieldfraud-spm")
            ],
            path: "Sources/ShieldLocationLibrary"
        )
    ]
)
