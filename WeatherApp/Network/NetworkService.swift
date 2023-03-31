//
//  NetworkService.swift
//  WeatherApp
//
//  Created by Bhoopendra Umrao on 3/31/23.
//

import Foundation

enum NetworkError: Error {
    case error(statusCode: Int, data: Data?)
    case notConnected
    case cancelled
    case generic(Error)
    case urlGeneration
}
