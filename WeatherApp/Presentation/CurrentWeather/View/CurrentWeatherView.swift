//
//  CurrentWeatherView.swift
//  WeatherApp
//
//  Created by Bhoopendra Umrao on 02/04/23.
//

import SwiftUI

struct CurrentWeatherView<ViewModel: CurrentWeatherViewModel>: View {

    @ObservedObject var viewModel: ViewModel

    var body: some View {
        NavigationView {
            VStack {
                if let weather = viewModel.currentWeather {
                    CurrentWeatherCardView(currentWeather: weather)
                    Text("Forecast")
                        .font(.title)
                    List(viewModel.forecastWeatherList.enumerated().map { $0 }, id: \.offset) { index, item in
                        NavigationLink {
                            WeatherDetailView(weatherForecast: item)
                        } label: {
                            ForecastView(
                                weather: .init(
                                    date: item.startTime ?? Date(),
                                    temperature: item.values.temperature ?? 0.0
                                )
                            )
                        }.accessibilityIdentifier("NavigationLink")
                    }
                    .listStyle(.inset)
                    Spacer()
                } else {
                    ProgressView {
                        Text("Featching current weather....")
                    }
                    .progressViewStyle(.automatic)
                }
            }
            .alert(isPresented: $viewModel.showError) {
                Alert(
                    title: Text("Error!"),
                    message: Text(viewModel.currentErrorMessage ?? "NA"),
                    dismissButton: .default(Text("Got it!"))
                )
            }
            .padding()
            .onAppear {
                if viewModel.currentWeather == nil {
                    viewModel.didFetch()
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct CurrentWeather_Previews: PreviewProvider {
    static var previews: some View {
        AppConfigurationContainer().makeCurrentWeatherScene()
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
