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
            url: "https://s3.amazonaws.com/cashshield-sdk/shieldlocation-spm-ios-swift-1-0-0.zip",
            checksum: "d2013927ad77af34f06c8f124c918107814e9c22b7a34bfa501e774dbf6450b4"
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
