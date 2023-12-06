import ProjectDescription
import ProjectDescriptionHelpers
import MyPlugin

/*
                +-------------+
                |             |
                |     App     | Contains Moni App target and Moni unit-test target
                |             |
         +------+-------------+-------+
         |         depends on         |
         |                            |
 +----v-----+                   +-----v-----+
 |          |                   |           |
 |   Kit    |                   |     UI    |   Two independent frameworks to share code and start modularising your app
 |          |                   |           |
 +----------+                   +-----------+

 */

// MARK: - Project

// Local plugin loaded
let localHelper = LocalHelper(name: "MyPlugin")

// Creates our project using a helper function defined in ProjectDescriptionHelpers
let project = Project.app(name: "Moni",
                          destinations: [.iPhone, .iPad, .mac],
                          deploymentTargets: .init(iOS: "17.0", macOS: "14.0", watchOS: nil, tvOS: nil, visionOS: nil),
                          testDestination: .iPhone,
                          testDeploymentTargets: .init(iOS: "17.0", macOS: nil, watchOS: nil, tvOS: nil, visionOS: nil),
                          additionalTargets: [
                            "MoniKit",
                            "MoniUI",
                            "CreateEntry",
                            "Settings"
                          ])
