//
//  WeatherRepository.swift
//  WeatherApp
//
//  Created by Bhoopendra Umrao on 02/04/23.
//

import Foundation

protocol WeatherRepository {

    /// Fetch the current weather of the location
    /// - Parameter query: Location
    /// - Returns: CurrentWeather
    func fetchCurrentWeather(query: String) async throws -> CurrentWeather?

    /// Fetch the weaterh forecast
    /// - Parameters:
    ///   - lat: location latitude
    ///   - long: location longitude
    /// - Returns: Array of weather forecast [WeatherForecast]
    func fetchWeatherForeCast(lat: String, long: String) async throws -> [WeatherForecast]?
}
