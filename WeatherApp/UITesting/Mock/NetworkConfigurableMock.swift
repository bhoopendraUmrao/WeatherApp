//
//  NetworkConfigurableMock.swift
//  WeatherAppTests
//
//  Created by Bhoopendra Umrao on 02/04/23.
//
#if DEBUG
import Foundation

class NetworkConfigurableMock: NetworkConfigurable {
    var baseURL: URL = URL(string: "https://mock.test.com")!
    var headers: [String: String] = [:]
    var queryParameters: [String: String] = [:]
}

#endif
