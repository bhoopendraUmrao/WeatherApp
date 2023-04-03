//
//  AppConfigurationContainerMock.swift
//  WeatherApp
//
//  Created by Bhoopendra Umrao on 02/04/23.
//
#if DEBUG
import Foundation
import SwiftUI

struct AppConfigurationContainerMock {

    // MARK: - Make of scenes
    static func makeCurrentWeatherScene() -> some View {
        if UITestingHelper.isNetworkingSuccessFul {
            let weatherRepository = WeatherRepositoryMock(result: MockResponse.weather,
                                                          forecast: [MockResponse.weatherForecast])
            let weatherUseCase = DefaultWeatherUseCase(repository: weatherRepository)
            let viewModel = DefaultCurrentWeatherViewModel(weatherUseCase: weatherUseCase)
            return CurrentWeatherView(viewModel: viewModel)
        } else {
            let weatherRepository = WeatherRepositoryMock(result: nil,
                                                          forecast: nil)
            let weatherUseCase = DefaultWeatherUseCase(repository: weatherRepository)
            let viewModel = DefaultCurrentWeatherViewModel(weatherUseCase: weatherUseCase)
            return CurrentWeatherView(viewModel: viewModel)
        }
    }
}
#endif
