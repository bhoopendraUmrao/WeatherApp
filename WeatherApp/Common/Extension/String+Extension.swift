//
//  String+Extension.swift
//  WeatherApp
//
//  Created by Bhoopendra Umrao on 02/04/23.
//

import Foundation

extension String {
    func formattedDate(withFormat format: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.date(from: self)
    }
}
