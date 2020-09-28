//
//  API.swift
//  MovieApp
//
//  Created by M_Sugawara on 2020/09/28.
//  Copyright © 2020 M_Sugawara. All rights reserved.
//

import Foundation

struct Request {
    enum Method: String {
        case get = "GET"
        case post = "POST"
    }

    let method: Method
    let url: URL
    let headers: [String: String]?
}

struct Response {
    var data: Data?
}

enum APIError: Error {
    case clientError
    case serverError(statusCode: Int?, data: Data?)
}

protocol API {}

extension API {
    @discardableResult
    func sendRequest(_ request: Request, completion: @escaping (Result<Response, APIError>) -> Void) -> URLSessionDataTask {
        let session = URLSession.shared
        var urlRequest = URLRequest(url: request.url)
        urlRequest.allHTTPHeaderFields = request.headers
        urlRequest.httpMethod = request.method.rawValue
        let task = session.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                let apiError = self.handleClientError(error)
                completion(.failure(apiError))
                return
            }
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                let apiError = self.handleServerError(response, data: data)
                completion(.failure(apiError))
                return
            }
            let response = self.handleResponse(response, data: data)
            completion(.success(response))
        }
        task.resume()
        return task
    }

    private func handleClientError(_ error: Error) -> APIError {
        print("client error: \(error.localizedDescription)")
        return .clientError
    }

    private func handleServerError(_ response: URLResponse?, data: Data?) -> APIError {
        return .serverError(statusCode: (response as? HTTPURLResponse)?.statusCode, data: data)
    }

    private func handleResponse(_ response: URLResponse?, data: Data?) -> Response {
        return Response(data: data)
    }
}
