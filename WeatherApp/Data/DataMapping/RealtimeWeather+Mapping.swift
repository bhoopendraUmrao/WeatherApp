//
//  RealtimeWeather+Mapping.swift
//  WeatherApp
//
//  Created by Bhoopendra Umrao on 02/04/23.
//

import Foundation

struct RealtimeWeatherResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case location
        case weather = "data"
    }
    let location: Location?
    let weather: WeatherData?
}

extension RealtimeWeatherResponse {
    struct WeatherData: Decodable {
        let time: String?
        let values: Weather?
    }
}

extension RealtimeWeatherResponse {
    struct Location: Decodable {
        let name: String?
        let lat: Double?
        let lon: Double?
    }

    struct Weather: Decodable {
        let temperature: Float?
        let windSpeed: Float?
        let windDirection: Float?
        let pressureSurfaceLevel: Float?
        let precipitationProbability: Float?
        let humidity: Float?
        let cloudCover: Float?
        let uvIndex: Float?
        let visibility: Float?
    }
}

extension RealtimeWeatherResponse {
    func toDomain() -> CurrentWeather {
        .init(location: location?.toDomain(), weather: weather?.toDomain())
    }
}

extension RealtimeWeatherResponse.WeatherData {
    func toDomain() -> Weather {
        .init(
            windDirection: values?.windDirection,
            pressure: values?.pressureSurfaceLevel,
            precip: values?.precipitationProbability,
            humidity: values?.humidity,
            cloudcover: values?.cloudCover,
            temperature: values?.temperature
        )
    }
}

extension RealtimeWeatherResponse.Location {
    func toDomain() -> CurrentWeather.Location {
        .init(name: name, lat: lat, long: lon)
    }
}
