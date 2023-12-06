import ProjectDescription

/// Project helpers are functions that simplify the way you define your project.
/// Share code to create targets, settings, dependencies,
/// Create your own conventions, e.g: a func that makes sure all shared targets are "static frameworks"
/// See https://docs.tuist.io/guides/helpers/

extension Project {
  /// Helper function to create the Project for this ExampleApp
  public static func app(
    name: String, 
    destinations: Destinations,
    deploymentTargets: DeploymentTargets,
    testDestination: Destination,
    testDeploymentTargets: DeploymentTargets,
    additionalTargets: [String]) -> Project {
    var targets = makeAppTargets(name: name,
                                 destinations: destinations,
                                 deploymentTargets: deploymentTargets,
                                 testDestination: testDestination,
                                 testDeploymentTargets: testDeploymentTargets,
                                 dependencies: additionalTargets.map { TargetDependency.target(name: $0) } + [
                                  .external(name: "Macro"),
                                 ])
      targets += additionalTargets.flatMap({
        makeFrameworkTargets(
          name: $0,
          destinations: destinations, 
          deploymentTargets: deploymentTargets,
          testDestination: testDestination,
          testDeploymentTargets: testDeploymentTargets
        )
      })
    return Project(name: name,
                   organizationName: "qeude",
                   targets: targets)
  }

  // MARK: - Private

  /// Helper function to create a framework target and an associated unit test target
  private static func makeFrameworkTargets(
    name: String,
    destinations: Destinations,
    deploymentTargets: DeploymentTargets,
    testDestination: Destination,
    testDeploymentTargets: DeploymentTargets
  ) -> [Target] {
    let sources = Target(name: name,
                         destinations: destinations,
                         product: .framework,
                         bundleId: "com.qeude.\(name)",
                         deploymentTargets: deploymentTargets,
                         infoPlist: .default,
                         sources: ["Targets/\(name)/Sources/**"],
                         resources: [],
                         dependencies: [
                          .external(name: "Macro")
                         ])
    let tests = Target(name: "\(name)Tests",
                       destinations: [testDestination],
                       product: .unitTests,
                       bundleId: "com.qeude.\(name)Tests",
                       deploymentTargets: testDeploymentTargets,
                       infoPlist: .default,
                       sources: ["Targets/\(name)/Tests/**"],
                       resources: [],
                       dependencies: [.target(name: name)])
    return [sources, tests]
  }

  /// Helper function to create the application target and the unit test target.
  private static func makeAppTargets(
    name: String, destinations: Destinations,
    deploymentTargets: DeploymentTargets,
    testDestination: Destination,
    testDeploymentTargets: DeploymentTargets,
    dependencies: [TargetDependency]
  ) -> [Target] {
    let infoPlist: [String: Plist.Value] = [
      "CFBundleShortVersionString": "1.0",
      "CFBundleVersion": "1",
      "UIMainStoryboardFile": "",
      "UILaunchStoryboardName": "LaunchScreen"
    ]

    let mainTarget = Target(
      name: name,
      destinations: destinations,
      product: .app,
      bundleId: "com.qeude.\(name)",
      deploymentTargets: deploymentTargets,
      infoPlist: .extendingDefault(with: infoPlist),
      sources: ["Targets/\(name)/Sources/**"],
      resources: ["Targets/\(name)/Resources/**"],
      dependencies: dependencies
    )

    let testTarget = Target(
      name: "\(name)Tests",
      destinations: [testDestination],
      product: .unitTests,
      bundleId: "com.qeude.\(name)Tests",
      deploymentTargets: testDeploymentTargets,
      infoPlist: .default,
      sources: ["Targets/\(name)/Tests/**"],
      dependencies: [
        .target(name: "\(name)")
      ])
    return [mainTarget, testTarget]
  }
}
