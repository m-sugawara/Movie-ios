//
//  API.swift
//  MovieApp
//
//  Created by M_Sugawara on 2020/09/28.
//  Copyright © 2020 M_Sugawara. All rights reserved.
//

import Foundation

struct Request {
    let url: URL
}

struct Response {
    var data: Data?
}

enum APIError: Error {
    case httpError(statusCode: Int?)
    case other
}

protocol API {
    func request(_ request: Request, completion: (Response) -> Void)
}

extension API {
    func request(_ request: Request, completion: @escaping (Result<Response, APIError>) -> Void) {
        let session = URLSession.shared
        let urlRequest = URLRequest(url: request.url)
        session.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                let apiError = self.handleClientError(error)
                completion(.failure(apiError))
                return
            }
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                let apiError = self.handleServerError(response)
                completion(.failure(apiError))
                return
            }
            let response = self.handleResponse(response, data: data)
            completion(.success(response))
        }
    }

    private func handleClientError(_ error: Error) -> APIError {
        return .other
    }

    private func handleServerError(_ response: URLResponse?) -> APIError {
        if let httpResponse = response as? HTTPURLResponse {
            return .httpError(statusCode: httpResponse.statusCode)
        }
        return .other
    }

    private func handleResponse(_ response: URLResponse?, data: Data?) -> Response {
        return Response(data: data)
    }
}
