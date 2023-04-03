# WeatherApp

# iOS App using Clean Architecture and MVVM &nbsp; [![CI](https://img.shields.io/travis/kudoleh/iOS-Clean-Architecture-MVVM)]

iOS Project implemented with Clean Layered Architecture and MVVM.

![Alt text](README_FILES/CleanArchitecture+MVVM.png?raw=true "Clean Architecture Layers")

## Layers
* **Domain Layer** = Entities + Use Cases + Repositories Interfaces
* **Data Repositories Layer** = Repositories Implementations + API (Network) + Persistence DB
* **Presentation Layer (MVVM)** = ViewModels + Views

## Architecture concepts used here
* MVVM
* Clean Architecture
* Data Binding using Observable
* Dependency Injection
* SwiftUI implementation using viewmodel

### Dependency Direction
![Alt text](README_FILES/CleanArchitectureDependencies.png?raw=true "Modules Dependencies")

**Note:** **Domain Layer** should not include anything from other layers(e.g Presentation — UIKit or SwiftUI or Data Layer — Mapping Codable)

 
## Includes
* SwiftUI for views
* Unit Tests for Use Cases(Domain Layer), ViewModels(Presentation Layer), NetworkService(Infrastructure Layer)
* UI test with XCUITests

## Requirements
* Xcode Version 13.4.1+  Swift 5.0+

# How to use app
