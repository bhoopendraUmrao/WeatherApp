//
//  AppConfigurationContainer.swift
//  WeatherApp
//
//  Created by Bhoopendra Umrao on 02/04/23.
//

import Foundation
import SwiftUI

enum AppConfiguration: String {
    case apiKey = "G9nXjML6nyPEU6NMgrOgbl1vmDcqrOzz"
    case apiBaseURL = "https://api.tomorrow.io/v4"
}

final class AppConfigurationContainer: ObservableObject {

    // MARK: - Network
    lazy var apiDataTransferService: DataTransferService = {
        let config = ApiDataNetworkConfig(
            baseURL: URL(string: AppConfiguration.apiBaseURL.rawValue)!,
            queryParameters: ["apikey": AppConfiguration.apiKey.rawValue]
        )

        let apiDataNetwork = DefaultNetworkService(config: config)
        return DefaultDataTransferService(with: apiDataNetwork)
    }()

    // MARK: - Make of scenes
    func makeCurrentWeatherScene() -> some View {
        let weatherRepository = DefaultWeatherRepository(dataTransferService: apiDataTransferService)
        let weatherUseCase = DefaultWeatherUseCase(repository: weatherRepository)
        let viewModel = DefaultCurrentWeatherViewModel(weatherUseCase: weatherUseCase)
        return CurrentWeatherView(viewModel: viewModel)
    }
}
