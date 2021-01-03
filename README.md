<div align="center">
    <img src="https://raw.githubusercontent.com/swiftpackages/SuperString/main/.github/resources/logo.svg" width="90%" alt="Super String for Swift" />
</div>
<br />

![macOS](https://github.com/swiftpackages/SuperString/workflows/macOS/badge.svg)
![ubuntu](https://github.com/swiftpackages/SuperString/workflows/ubuntu/badge.svg)
![docs](https://github.com/swiftpackages/SuperString/workflows/docs/badge.svg)
[![Codacy Badge](https://app.codacy.com/project/badge/Grade/a859e81da1974a5db9625519e7278d0e)](https://www.codacy.com/gh/swiftpackages/SuperString/dashboard?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=swiftpackages/SuperString&amp;utm_campaign=Badge_Grade)

Extend the power of Strings in Swift.

## Getting Started

You can easily add as a requirement with SwiftPM.

### Know what you’re doing?

Here are some quick copypastas for you
```swift
.package(url: "https://github.com/swiftpackages/SuperString.git", from: "1.0.0"),
```
```swift
.product(name: "SuperString", package: "SuperString"),
```

### Need a reminder?

Your `Package.swift` file should look something like this

```swift
// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "SuperCoolProject",
    products: [
        .library(
            name: "SuperCoolProject",
            targets: ["SuperCoolProject"]),
    ],
    dependencies: [
        .package(url: "https://github.com/swiftpackages/SuperString.git", from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "SuperCoolProject",
            dependencies: [
                .product(name: "SuperString", package: "SuperString"),
            ]),
        .testTarget(
            name: "SuperCoolProject",
            dependencies: ["SuperCoolProject"])
    ]
)
```

## Usage

Currently there is `camelcamed`, `kebabcased`, and `snakecased`.

```swift
"ThisIs a Cool string".camelcase() // thisIsACoolString

"ThisIs a Cool string".camelcase(.upper) // ThisIsACoolString

"ThisIs a Cool string".kebabcased() // this-is-a--cool-string

"ThisIs a Cool string".snakecased() // this_is_a__cool_string
```

### Additional Documentation

[You can find the full documentation on the documentation website.](https://swiftpackages.github.io/SuperString)
