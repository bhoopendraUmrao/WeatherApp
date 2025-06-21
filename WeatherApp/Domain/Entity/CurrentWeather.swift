//
//  CurrentWeather.swift
//  WeatherApp
//
//  Created by Bhoopendra Umrao on 02/04/23.
//

import Foundation

struct CurrentWeather: Equatable {
    let location: Location?
    let weather: Weather?
}

extension CurrentWeather {
    struct Location: Equatable {
        let name: String?
        let lat: Double?
        let long: Double?
    }
}

struct Weather: Equatable {
    let windDirection: Float?
    let pressure: Float?
    let precip: Float?
    let humidity: Float?
    let cloudcover: Float?
    let temperature: Float?
}

struct WeatherForecast: Equatable {
    var id: Date { startTime ?? Date.distantPast }
    let startTime: Date?
    let values: Weather

    init(startTime: String, values: Weather) {
        self.startTime = startTime.formattedDate(withFormat: "yyyy-MM-dd'T'HH:mm:ss'Z'")
        self.values = values
    }
}
