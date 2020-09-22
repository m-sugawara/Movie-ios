//
//  LoginModel.swift
//  MovieApp
//
//  Created by M_Sugawara on 2020/09/06.
//  Copyright © 2020 M_Sugawara. All rights reserved.
//

import Foundation
import FirebaseAuth

protocol LoginModelProtocol {
    func createUser(withEmail email: String, password: String, completion: @escaping (Result<Any?, Error>) -> Void)
    func signIn(withEmail email: String, password: String, completion: @escaping (Result<Any?, Error>) -> Void)
}

final class LoginModel: LoginModelProtocol {

    private lazy var auth = Auth.auth()

    func createUser(withEmail email: String, password: String, completion: @escaping (Result<Any?, Error>) -> Void) {
        auth.createUser(withEmail: email, password: password) { result, error in
            if let _ = result {
                completion(.success(nil))
            } else {
                completion(.failure(error!))
            }
        }
    }

    func signIn(withEmail email: String, password: String, completion: @escaping (Result<Any?, Error>) -> Void) {
        auth.signIn(withEmail: email, password: password) { result, error in
            if let _ = result {
                completion(.success(nil))
            } else {
                completion(.failure(error!))
            }
        }
    }
}

#if DEBUG
final class DummyLoginModel: LoginModelProtocol {
    func createUser(withEmail email: String, password: String, completion: @escaping (Result<Any?, Error>) -> Void) {
        completion(.success(nil))
    }

    func signIn(withEmail email: String, password: String, completion: @escaping (Result<Any?, Error>) -> Void) {
        completion(.success(nil))
    }
}
#endif
