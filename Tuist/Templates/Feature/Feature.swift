//
//  Feature.swift
//  ProjectDescriptionHelpers
//
//  Created by Quentin Eude on 30/11/2023.
//

import ProjectDescription

let nameAttribute: Template.Attribute = .required("name")

let template = Template(
  description: "A template for a new feature",
  attributes: [nameAttribute],
  items: [
    .file(path: "Targets/\(nameAttribute)/Sources/\(nameAttribute)Kit.swift", templatePath: "KitSource.stencil"),
    .file(path: "Targets/\(nameAttribute)/Tests/\(nameAttribute)KitTests.swift", templatePath: "KitTests.stencil")
  ]
)
