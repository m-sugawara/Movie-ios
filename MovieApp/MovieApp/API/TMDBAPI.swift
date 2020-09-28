//
//  TMDBAPI.swift
//  MovieApp
//
//  Created by M_Sugawara on 2020/09/28.
//  Copyright © 2020 M_Sugawara. All rights reserved.
//

import Foundation
import FileLoader

struct TMDB: Decodable {
    let apiKey: String
}

struct TMDBErrorInfo: Decodable {
    let success: Bool
    let statusCode: Int
    let statusMessage: String

    enum CodingKeys: String, CodingKey {
        case success
        case statusCode = "status_code"
        case statusMessage = "status_message"
    }
}

final class TMDBAPI: API {

    enum RequestType {
        case moviePopular

        private var path: String {
            switch self {
            case .moviePopular:
                return "/movie/popular"
            }
        }
        var fullPath: String {
            let scheme = "https"
            let baseURL = "api.themoviedb.org"
            let version = 3
            return "\(scheme)://\(baseURL)/\(version)/\(path)"
        }

        var method: Request.Method {
            switch self {
            case .moviePopular:
                return .get
            }
        }
    }

    let tmdb: TMDB

    init() {
        tmdb = try! FileLoader().loadPlist(fileName: "TMDB")
    }

    func sendRequest<T: Codable>(_ type: RequestType, completion: @escaping (Result<T, TMDBError>)->Void) {
        let request = Request(method: type.method,
                              url: URL(string: type.fullPath)!,
                              headers: ["Authorization": "Bearer \(tmdb.apiKey)"])
        sendRequest(request) { result in
            switch result {
            case .success(let data):
                let decoder = JSONDecoder()
                let item = try! decoder.decode(T.self, from: data.data!)
                completion(.success(item))
            case .failure(let error):
                switch error {
                case .clientError:
                    completion(.failure(.clientError))
                case .serverError(_, let data):
                    do {
                        let decoder = JSONDecoder()
                        let errorInfo = try decoder.decode(TMDBErrorInfo.self, from: data!)
                        completion(.failure(.serverError(info: errorInfo)))
                    } catch {
                        let body = String(data: data!, encoding: .utf8) ?? ""
                        completion(.failure(.unexpectedError(body: body)))
                    }
                }
            }
        }
    }
}

enum TMDBError: Error {
    case clientError
    case serverError(info: TMDBErrorInfo)
    case unexpectedError(body: String)

    var localizedString: String {
        switch self {
        case .clientError:
            return "client error"
        case .serverError(let apiInfo):
            return apiInfo.statusMessage
        case .unexpectedError(let body):
            return "unexpected error\n(body: \(body)"
        }
    }
}
