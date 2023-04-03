//
//  ForecastView.swift
//  WeatherApp
//
//  Created by Bhoopendra Umrao on 02/04/23.
//

import SwiftUI

struct ForecastView: View {
    var weather: ForecastWeatherItemViewModel
    var body: some View {
        HStack {
            Text(weather.date ?? Date(), style: .date)
            Spacer()
            Text(String(format: "%.2f F", weather.temperature))
        }
        .padding()
    }
}
