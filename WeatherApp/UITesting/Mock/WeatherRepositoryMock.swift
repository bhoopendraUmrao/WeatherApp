//
//  WeatherRepositoryMock.swift
//  WeatherApp
//
//  Created by Bhoopendra Umrao on 02/04/23.
//
#if DEBUG
import Foundation

class WeatherRepositoryMock: WeatherRepository {
    var result: CurrentWeather?
    var forecast: [WeatherForecast]?
    var fetchCurrentWeatherCompletionCallsCount = 0
    var fetchWeatherForecastCompletionCallsCount = 0

    init(result: CurrentWeather?, forecast: [WeatherForecast]?) {
        self.result = result
        self.forecast = forecast
    }

    func fetchCurrentWeather(query: String) async throws -> CurrentWeather? {
        fetchCurrentWeatherCompletionCallsCount += 1
        guard let result = result else {
            throw DataTransferError.noResponse
        }
        return result
    }

    func fetchWeatherForeCast(lat: String, long: String) async throws -> [WeatherForecast]? {
        fetchWeatherForecastCompletionCallsCount += 1
        guard let forecast = forecast else {
            throw DataTransferError.noResponse
        }
        return forecast
    }
}
#endif
