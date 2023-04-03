//
//  DefaultWeatherRepository.swift
//  WeatherApp
//
//  Created by Bhoopendra Umrao on 02/04/23.
//

import Foundation

final class DefaultWeatherRepository: WeatherRepository {

    private let dataTransferService: DataTransferService

    /// Initilise with any type confirming DataTransferService protocol
    /// - Parameter dataTransferService: DataTransferService
    init(dataTransferService: DataTransferService) {
        self.dataTransferService = dataTransferService
    }

    func fetchCurrentWeather(query: String) async throws -> CurrentWeather? {
        let endpoint = Endpoint<RealtimeWeatherResponse>(
            path: "/weather/realtime",
            method: .get,
            queryParametersEncodable: ["location": query]
        )
        return try await dataTransferService.request(with: endpoint)?.toDomain()
    }

    func fetchWeatherForeCast(lat: String, long: String) async throws -> [WeatherForecast]? {
        let fields: [String] = [
            "temperature",
            "cloudCover",
            "humidity",
            "windDirection",
            "windSpeed",
            "pressureSurfaceLevel",
            "cloudCover"
        ]
        let request: [String: Any] = [
            "location": "\(lat),\(long)",
            "fields": fields,
            "units": "metric",
            "timesteps": ["1d"],
            "startTime": "now",
            "endTime": "nowPlus6d"
        ]

        let endpoint = Endpoint<WeatherForecastReponse>(
            path: "timelines",
            method: .post,
            bodyParamaters: request
        )
        return try await dataTransferService.request(with: endpoint)?.toDomain()
    }
}
