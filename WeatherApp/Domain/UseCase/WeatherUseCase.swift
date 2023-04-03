//
//  WeatherUseCase.swift
//  WeatherApp
//
//  Created by Bhoopendra Umrao on 02/04/23.
//

import Foundation

protocol WeatherUseCase {

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

final class DefaultWeatherUseCase: WeatherUseCase {

    private let weatherRepository: WeatherRepository

    /// Initilise with any type confirming WeatherRepository protocol
    /// - Parameter repository: WeatherRepository
    init(repository: WeatherRepository) {
        self.weatherRepository = repository
    }

    func fetchCurrentWeather(query: String) async throws -> CurrentWeather? {
        try await weatherRepository.fetchCurrentWeather(query: query)
    }

    func fetchWeatherForeCast(lat: String, long: String) async throws -> [WeatherForecast]? {
        try await weatherRepository.fetchWeatherForeCast(lat: lat, long: long)
    }
}
