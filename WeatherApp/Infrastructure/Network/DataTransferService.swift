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

protocol DataTransferErrorLogger {
    func log(error: Error)
}

protocol DataTransferService {
    @discardableResult
    func request<T: Decodable, E: ResponseRequestable>(with endpoint: E) async throws -> T? where E.Response == T
}

final class DefaultDataTransferService: DataTransferService {

    private let networkService: NetworkService
    private let errorLogger: DataTransferErrorLogger

    public init(
        with networkService: NetworkService,
        errorLogger: DataTransferErrorLogger = DefaultDataTransferErrorLogger()
    ) {
        self.networkService = networkService
        self.errorLogger = errorLogger
    }

    func request<T, E>(with endpoint: E) async throws -> T? where T: Decodable,
                                                                  T == E.Response,
                                                                  E: ResponseRequestable {
        do {
            let result = try await networkService.request(endpoint: endpoint)
            let decodedResult: Result<T, DataTransferError> = self.decode(
                data: result,
                decoder: endpoint.responseDecoder
            )
            switch decodedResult {
            case .success(let decodedData):
                return decodedData
            case .failure(let error):
                throw error
            }
        } catch let error as NetworkError {
            errorLogger.log(error: error)
            let error = self.resolve(networkError: error)
            throw error
        }
    }

    // MARK: - Private
    private func decode<T: Decodable>(data: Data?, decoder: ResponseDecoder) -> Result<T, DataTransferError> {
        do {
            guard let data = data else { return .failure(.noResponse) }
            let result: T = try decoder.decode(data)
            return .success(result)
        } catch {
            errorLogger.log(error: error)
            return .failure(.parsing(error))
        }
    }

    private func resolve(networkError error: NetworkError) -> DataTransferError {
        return .networkFailure(error)
    }
}

// MARK: - Logger
final class DefaultDataTransferErrorLogger: DataTransferErrorLogger {

    func log(error: Error) {
        printIfDebug("-------------")
        printIfDebug("\(error)")
    }

    func printIfDebug(_ string: String) {
        #if DEBUG
        print(string)
        #endif
    }
}

// MARK: - Response Decoders
final class JSONResponseDecoder: ResponseDecoder {
    private let jsonDecoder = JSONDecoder()
    func decode<T: Decodable>(_ data: Data) throws -> T {
        try jsonDecoder.decode(T.self, from: data)
    }
}
