// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "Astro96",
    platforms: [.macOS(.v12), .iOS(.v15)],
    products: [.library(name: "Astro96", targets: ["Astro96"])],
    targets: [.target(name: "Astro96")]
)
