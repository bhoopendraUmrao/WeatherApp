//
//  WeatherForecast+Mapping.swift
//  WeatherApp
//
//  Created by Bhoopendra Umrao on 02/04/23.
//

import Foundation

struct WeatherForecastReponse: Decodable {
    struct Timeline: Decodable {
        let timestep: String
        let startTime: String
        let endTime: String
        let intervals: [ForecastWeather]
    }

    struct Timelines: Decodable {
        let timelines: [Timeline]
    }

    let data: Timelines
}

extension WeatherForecastReponse {
    func toDomain() -> [WeatherForecast] {
        data.timelines.first?.intervals.compactMap {
            WeatherForecast(startTime: $0.startTime, values: $0.values.toDomain())
        } ?? []
    }
}

struct ForecastWeather: Decodable {
    let startTime: String
    let values: WeatherData

    struct WeatherData: Decodable {
        let cloudCover: Float
        let humidity: Float
        let pressureSurfaceLevel: Float
        let temperature: Float
        let windDirection: Float
        let windSpeed: Float
    }
}

extension ForecastWeather.WeatherData {
    func toDomain() -> Weather {
        .init(
            windDirection: windDirection,
            pressure: pressureSurfaceLevel,
            precip: 0.0,
            humidity: humidity,
            cloudcover: cloudCover,
            temperature: temperature
        )
    }
}
