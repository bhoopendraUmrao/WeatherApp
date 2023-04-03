//
//  NetworkServiceMock.swift
//  WeatherAppTests
//
//  Created by Bhoopendra Umrao on 02/04/23.
//
#if DEBUG
import Foundation

struct NetworkSessionManagerMock: NetworkSessionManager {

    let response: HTTPURLResponse?
    let data: Data?
    let error: Error?

    func request(_ request: URLRequest) async throws -> (Data?, URLResponse?) {
        guard let error = error else {
            return (data, response)
        }
        throw error
    }
}

#endif
