//
//  MockResponse.swift
//  WeatherApp
//
//  Created by Bhoopendra Umrao on 02/04/23.
//

#if DEBUG
import Foundation

struct MockResponse {
    static let weather: CurrentWeather = .init(
        location: .init(name: "Dubai", lat: 17.5454, long: 36.000),
        weather: .init(windDirection: 1212,
                       pressure: 1013,
                       precip: 0,
                       humidity: 54,
                       cloudcover: 25,
                       temperature: 25)
    )

    static let weatherForecast: WeatherForecast = .init(
        startTime: "2023-04-06T10:00:00Z",
        values: .init(windDirection: 1212,
                      pressure: 1013,
                      precip: 0,
                      humidity: 54,
                      cloudcover: 25,
                      temperature: 25)
    )
}
#endif
