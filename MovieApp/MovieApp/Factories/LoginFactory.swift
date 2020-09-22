//
//  LoginFactory.swift
//  MovieApp
//
//  Created by M_Sugawara on 2020/09/22.
//  Copyright © 2020 M_Sugawara. All rights reserved.
//

import SwiftUI

enum LoginFactory {
    static func make(with appState: AppState?) -> some View {
        let presenter = LoginPresenter(appState: appState, loginModel: LoginModel())
        let view = LoginView(presenter: presenter)
        return view
    }
}
