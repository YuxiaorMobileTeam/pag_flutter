// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "pag_darwin",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        // 库名必须是横线分隔（Flutter 生成的 FlutterGeneratedPluginSwiftPackage
        // 以 product 名作为动态库的 CFBundleIdentifier，不允许下划线）。
        .library(name: "pag-darwin", targets: ["pag_darwin"])
    ],
    dependencies: [
        // 官方 libpag SPM 分发。https://github.com/libpag/pag-ios
        .package(url: "https://github.com/libpag/pag-ios.git", from: "4.4.68")
    ],
    targets: [
        .target(
            name: "pag_darwin",
            dependencies: [
                .product(name: "libpag", package: "pag-ios")
            ],
            resources: [
                // SPM 规定 .process 路径相对 target 目录（Sources/pag_darwin），
                // 资源实际位于包根 Resources/ 下，需用 ../ 回退。
                .process("../Resources/PrivacyInfo.xcprivacy")
            ]
        )
    ]
)
