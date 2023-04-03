//
//  WeatherDetailView.swift
//  WeatherApp
//
//  Created by Bhoopendra Umrao on 02/04/23.
//

import SwiftUI

struct WeatherDetailView: View {

    var weatherForecast: WeatherForecast

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Humidity")
                Spacer()
                Text(String(format: "%.2f F", weatherForecast.values.humidity ?? 0.0))
            }
            HStack {
                Text("Temperature")
                Spacer()
                Text(String(format: "%.2f F", weatherForecast.values.temperature ?? 0.0))
            }

            HStack {
                Text("Cloudcover")
                Spacer()
                Text(String(format: "%.2f F", weatherForecast.values.cloudcover ?? 0.0))
            }

            HStack {
                Text("WindDirection")
                Spacer()
                Text(String(format: "%.2f F", weatherForecast.values.windDirection ?? 0.0))
            }

            HStack {
                Text("Pressure")
                Spacer()
                Text(String(format: "%.2f F", weatherForecast.values.pressure ?? 0.0))
            }

            HStack {
                Text("Precip")
                Spacer()
                Text(String(format: "%.2f F", weatherForecast.values.precip ?? 0.0))
            }
        }
        .padding()
        .navigationTitle(Text(weatherForecast.startTime ?? Date(), style: .date))
        .navigationBarHidden(false)

    }
}

struct WeatherDetailView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDetailView(weatherForecast: .init(
            startTime: "2023-04-06T10:00:00Z",
            values: .init(windDirection: 1212,
                          pressure: 1013,
                          precip: 0,
                          humidity: 54,
                          cloudcover: 25,
                          temperature: 25)
        ))
    }
}
