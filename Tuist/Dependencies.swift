import ProjectDescription
import ProjectDescriptionHelpers

let dependencies = Dependencies(
  swiftPackageManager: .init([
    .local(path: "Packages/Macro")
  ]),
  platforms: [.iOS]
)
