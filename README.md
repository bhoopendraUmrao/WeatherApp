# WeatherApp

iOS Project implemented with Clean Layered Architecture and MVVM.

## Layers
* **Domain Layer** = Entities + Use Cases + Repositories Interfaces
* **Data Repositories Layer** = Repositories Implementations + API (Network)
* **Presentation Layer (MVVM)** = ViewModels + Views

## Architecture concepts used here
* MVVM
* Clean Architecture
* Data Binding using Observable
* Dependency Injection
* SwiftUI implementation using viewmodel

### Dependency Direction
![Alt text](https://raw.githubusercontent.com/kudoleh/iOS-Clean-Architecture-MVVM/master/README_FILES/CleanArchitectureDependencies.png "Modules Dependencies")

**Note:** **Domain Layer** should not include anything from other layers(e.g Presentation — UIKit or SwiftUI or Data Layer — Mapping Codable)

 
## Includes
* Object oriented programming approach
* SwiftUI for views
* Data Binding using Observable
* For data parsing, used the Codable approach.
* Unit Tests for Use Cases(Domain Layer), ViewModels(Presentation Layer), NetworkService(Infrastructure Layer)
* UI test with XCUITests
* Static code analysis using Swift lint

## Requirements
* Xcode Version 13.4.1+  Swift 5.0+

# How to use app
* Clone the repository
* Install the pods by running
```
pod install
```
* Build and run the app

# How to run tests
* Build the Test Target
```
⇧⌘U (shift + command + U)
```
* Build and Run All Test Cases using following command in XCode
```
⌘U (command + U)
```
## How to Gather Test case coverage
* Open the Test scheme 
* In the Options tab, and check the Code Coverage checkbox
* After this each time test cases runs. it will generate the code coverage report
* Code coverage report can be view in Report Navigator(⌘9)
