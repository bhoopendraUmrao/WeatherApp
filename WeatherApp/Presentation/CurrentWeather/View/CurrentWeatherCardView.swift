//
//  CurrentWeatherCardView.swift
//  WeatherApp
//
//  Created by Bhoopendra Umrao on 02/04/23.
//

import SwiftUI

struct CurrentWeatherCardView: View {
    var currentWeather: CurrentWeather
    var body: some View {
        VStack {
            HStack {
                Text(currentWeather.location?.name ?? "NA")
                    .accessibilityIdentifier("location")
                Spacer()
            }
            .padding(.bottom, 18)
            HStack(alignment: .top) {
                Image("thermometer")
                    .resizable()
                    .padding()
                    .scaledToFit()
                    .background(.white)
                    .frame(width: 130, height: 130)
                    .accessibilityIdentifier("icon")
                VStack(alignment: .leading) {
                    HStack {
                        Text("Temperature:")
                        Text(String(format: "%.2f C", currentWeather.weather?.temperature ?? 0.0))
                            .accessibilityIdentifier("temperature")

                    }
                    HStack {
                        Text("Wind:")
                        Text(String(format: "%.2f C", currentWeather.weather?.windDirection ?? 0.0))
                            .accessibilityIdentifier("wind")
                    }
                    HStack {
                        Text("Pressure:")
                        Text(String(format: "%.2f C", currentWeather.weather?.pressure ?? 0.0))
                            .accessibilityIdentifier("pressure")
                    }
                    HStack {
                        Text("Precip:")
                        Text(String(format: "%.2f C", currentWeather.weather?.precip ?? 0.0))
                            .accessibilityIdentifier("precip")
                    }
                    HStack {
                        Text("Humidity:")
                        Text(String(format: "%.2f C", currentWeather.weather?.humidity ?? 0.0))
                            .accessibilityIdentifier("humidity")
                    }
                    HStack {
                        Text("Cloud:")
                        Text(String(format: "%.2f C", currentWeather.weather?.cloudcover ?? 0.0))
                            .accessibilityIdentifier("cloudcover")
                    }
                }
            }
        }
        .padding()
        .background(Color("background"))
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .shadow(color: .black, radius: 4)
    }
}
