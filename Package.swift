// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ZZBase",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "ZZBase",
            targets: ["ZZBase"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "ZZBase",
            dependencies: [],
            path: "Sources"
        ),
    ]
)
//x-xcode-log://052589ED-7480-413C-916C-C1F9A63CFEAE Invalid Exclude '/Users/a123/Desktop/ZZTools/GitHub/ZZBase/ZZBase/Example': File not found.

//Showing All Messages
//Invalid Exclude '/Users/a123/Desktop/ZZTools/GitHub/ZZBase/ZZBase/Sources/Example': File not found.

///Users/a123/Desktop/ZZTools/GitHub/ZZBase/Example
//x-xcode-log://4F409C8B-1732-4D1C-B5A9-77446EE51B4D Invalid Resource 'ZZBase/Sources/*': File not found.
