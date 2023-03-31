//
//  DataTransferService.swift
//  WeatherApp
//
//  Created by Bhoopendra Umrao on 3/31/23.
//

import Foundation

enum DataTransferError: Error {
    case noResponse
    case parsing(Error)
    case networkFailure(NetworkError)
    case resolvedNetworkFailure(Error)
}

public protocol ResponseDecoder {
    func decode<T: Decodable>(_ data: Data) throws -> T
}


protocol DataTransferService {
    typealias DataTransferResult<T> = Result<T, DataTransferError>
    @discardableResult
    func request<T: Decodable, E: ResponseRequestable>(with endpoint: E) async throws -> DataTransferResult<T>? where E.Response == T
    
    @discardableResult
    func request<E: ResponseRequestable>(with endpoint: E) async throws -> DataTransferResult<Void>? where E.Response == Void
}
