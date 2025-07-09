//
//  WeatherAppUITests.swift
//  WeatherAppUITests
//
//  Created by Bhoopendra Umrao on 3/31/23.
//

import XCTest

class WeatherAppUITests: XCTestCase {
    var app: XCUIApplication!
    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments = ["-ui-testing"]
        app.launchEnvironment = ["-networking-success": "1"]
        app.launch()
    }

    func testCurrentWeatherDetail() {
        print(app.debugDescription)
        let temperature = app.staticTexts["temperature"]
        XCTAssertTrue(temperature.waitForExistence(timeout: 5),
                      "the temperature text should be visible")
        XCTAssertEqual("25.00 C", temperature.label)

        let wind = app.staticTexts["wind"]
        XCTAssertTrue(wind.waitForExistence(timeout: 5),
                      "the wind text should be visible")
        XCTAssertEqual("1212.00 C", wind.label)

        let location = app.staticTexts["location"]
        XCTAssertTrue(location.waitForExistence(timeout: 5),
                      "the loaction text should be visible")
        XCTAssertEqual("Dubai", location.label)
    }

    func testWeatherDetailAction() {
        let navigationButton = app.buttons["NavigationLink"]

        XCTAssertTrue(navigationButton.waitForExistence(timeout: 5),
                      "the navigation link should be present")
        navigationButton.tap()
    }

    override func tearDown() {
        app = nil
    }

}
