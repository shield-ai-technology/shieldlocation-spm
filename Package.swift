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
            url: "https://s3.amazonaws.com/cashshield-sdk/shieldlocation-spm-ios-swift-1-0-1.zip",
            checksum: "a6e9072f8daeb93b731fe614f68dd922cf3cfa38620724dfda0f322d5d134119"
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
