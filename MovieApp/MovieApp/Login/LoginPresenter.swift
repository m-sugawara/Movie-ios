//
//  LoginPresenter.swift
//  MovieApp
//
//  Created by M_Sugawara on 2020/09/22.
//  Copyright © 2020 M_Sugawara. All rights reserved.
//

import SwiftUI

protocol LoginPresenterInput: ObservableObject {
    var errorMessage: String { get }
    func createUser(withEmail email: String, password: String)
    func signIn(withEmail email: String, password: String)
}

final class LoginPresenter: LoginPresenterInput {

    private var loginModel: LoginModelProtocol
    private weak var appState: AppState?

    @Published private(set) var errorMessage: String = ""

    init(appState: AppState?, loginModel: LoginModelProtocol) {
        self.loginModel = loginModel
        self.appState = appState
    }

    func createUser(withEmail email: String, password: String) {
        loginModel.createUser(withEmail: email, password: password) { result in
            switch result {
            case .success:
                self.errorMessage = "Your account has been created successfully"
            case .failure:
                self.errorMessage = "Failed to create account."
            }
        }
    }

    func signIn(withEmail email: String, password: String) {
        loginModel.signIn(withEmail: email, password: password) { result in
            switch result {
            case .success:
                self.appState?.isLoggedIn = true
                self.errorMessage = "success!"
            case .failure:
                self.errorMessage = "Failed to sign in"
            }
        }
    }

}
