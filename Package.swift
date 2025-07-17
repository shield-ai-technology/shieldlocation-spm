// swift-tools-version:5.5

import PackageDescription
let version = "1-0-5"
let shieldlocation_checksum = "ec8ab5293cd44d71e66ae194ffccae46b3a77345789e781d8c5551a566b49b89"

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
        .package(url: "https://github.com/shield-ai-technology/shieldfraud-spm.git", from: "1.5.50")
    ],
    targets: [
        .binaryTarget(
            name: "ShieldLocationAnalysisSPM",
            url: "https://s3.amazonaws.com/cashshield-sdk/shieldlocation-spm-ios-swift-\(version).zip",
            checksum: shieldlocation_checksum
        ),
        .target(
            name: "ShieldLocationLibrary",
            dependencies: [
                "ShieldLocationAnalysisSPM",
                .product(name: "ShieldFraud", package: "shieldfraud-spm")
            ],
            path: "Sources/ShieldLocationLibrary"
        )
    ]
)
