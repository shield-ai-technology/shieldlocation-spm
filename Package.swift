// swift-tools-version:5.5

import PackageDescription
let version = "1-0-5-beta"
let shieldlocation_checksum = "18085ac92ea4ef78ddd3f4f64c08bccb4437f2bc7be6e419f3596195c9d3be24"

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
            url: "https://cashshield-sdk.s3.us-east-1.amazonaws.com/shieldlocation-spm-ios-swift-\(version).zip",
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
