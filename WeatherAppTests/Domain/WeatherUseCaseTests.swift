//
//  WeatherUseCaseTests.swift
//  WeatherAppTests
//
//  Created by Bhoopendra Umrao on 02/04/23.
//

import XCTest
@testable import WeatherApp

final class WeatherUseCaseTests: XCTestCase {

    func test_FetchCurrentWeatherWithResponseData() async {
        // given
        var useCaseCompletionCallsCountCount = 0
        let repository = WeatherRepositoryMock(result: MockResponse.weather,
                                               forecast: nil)
        let usecase = DefaultWeatherUseCase(repository: repository)
        let expectation = self.expectation(description: "Should receive data")
        do {
            let result = try await usecase.fetchCurrentWeather(query: "Dubai")
            useCaseCompletionCallsCountCount += 1
            XCTAssertNotNil(result)
            XCTAssertEqual(result?.location?.name, "Dubai")
            expectation.fulfill()
        } catch {
            useCaseCompletionCallsCountCount += 1
            XCTFail("Should not happen")
        }
        XCTAssertEqual(useCaseCompletionCallsCountCount, 1)
        XCTAssertEqual(repository.fetchCurrentWeatherCompletionCallsCount, 1)
        // then
        wait(for: [expectation], timeout: 0.1)
    }

    func test_FetchCurrentWeatherWithNoData() async {
        var useCaseCompletionCallsCountCount = 0
        let repository = WeatherRepositoryMock(result: nil, forecast: nil)
        let usecase = DefaultWeatherUseCase(repository: repository)
        let expectation = self.expectation(description: "Should throw no data error")
        do {
            _ = try await usecase.fetchCurrentWeather(query: "Dubai")
            useCaseCompletionCallsCountCount += 1
            XCTFail("Should not happen")
        } catch {
            useCaseCompletionCallsCountCount += 1
            if case DataTransferError.noResponse = error {
                expectation.fulfill()
            } else {
                XCTFail("Wrong error")
            }
        }
        XCTAssertEqual(useCaseCompletionCallsCountCount, 1)
        XCTAssertEqual(repository.fetchCurrentWeatherCompletionCallsCount, 1)
        // then
        wait(for: [expectation], timeout: 0.1)
    }

    func test_FetchWeatherForecastWithResponseData() async {
        // given
        var useCaseCompletionCallsCountCount = 0
        let repository = WeatherRepositoryMock(result: nil,
                                               forecast: [MockResponse.weatherForecast])
        let usecase = DefaultWeatherUseCase(repository: repository)
        let expectation = self.expectation(description: "Should receive data")
        do {
            let result = try await usecase.fetchWeatherForeCast(
                lat: "\(MockResponse.weather.location?.lat ?? 0.0)",
                long: "\(MockResponse.weather.location?.long ?? 0.0)"
            )
            useCaseCompletionCallsCountCount += 1
            XCTAssertNotNil(result)
            expectation.fulfill()
        } catch {
            useCaseCompletionCallsCountCount += 1
            XCTFail("Should not happen")
        }
        XCTAssertEqual(useCaseCompletionCallsCountCount, 1)
        XCTAssertEqual(repository.fetchWeatherForecastCompletionCallsCount, 1)
        // then
        wait(for: [expectation], timeout: 0.1)
    }

    func test_FetchWeatherForecastWithNoData() async {
        var useCaseCompletionCallsCountCount = 0
        let repository = WeatherRepositoryMock(result: nil, forecast: nil)
        let usecase = DefaultWeatherUseCase(repository: repository)
        let expectation = self.expectation(description: "Should throw no data error")
        do {
            _ = try await usecase.fetchWeatherForeCast(
                lat: "\(MockResponse.weather.location?.lat ?? 0.0)",
                long: "\(MockResponse.weather.location?.long ?? 0.0)"
            )
            useCaseCompletionCallsCountCount += 1
            XCTFail("Should not happen")
        } catch {
            useCaseCompletionCallsCountCount += 1
            if case DataTransferError.noResponse = error {
                expectation.fulfill()
            } else {
                XCTFail("Wrong error")
            }
        }
        XCTAssertEqual(useCaseCompletionCallsCountCount, 1)
        XCTAssertEqual(repository.fetchWeatherForecastCompletionCallsCount, 1)
        // then
        wait(for: [expectation], timeout: 0.1)
    }
}
