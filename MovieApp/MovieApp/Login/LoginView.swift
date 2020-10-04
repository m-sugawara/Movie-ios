//
//  LoginView.swift
//  MovieApp
//
//  Created by M_Sugawara on 2020/08/20.
//  Copyright © 2020 M_Sugawara. All rights reserved.
//

import SwiftUI

struct Background<Content: View>: View {
    private var content: Content

    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }

    var body: some View {
        Color.white
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            .overlay(content)
    }
}

struct LoginView<T: LoginPresenterInput>: View {

    @ObservedObject var presenter: T

    @State var email = ""
    @State var password = ""

    var body: some View {
        Background {
            VStack(alignment: .center, spacing: 16.0) {
                Text(presenter.errorMessage)
                TextField("email", text: $email)
                    .frame(width: 200, height: 24, alignment: .center)
                TextField("password", text: $password)
                    .frame(width: 200, height: 24, alignment: .center)
                Button(action: {
                    presenter.signIn(
                        withEmail: self.email,
                        password: self.password)
                }) {
                    Text("Login")
                }
                Button(action: {
                    presenter.createUser(
                        withEmail: self.email,
                        password: self.password)
                }) {
                    Text("Create New User")
                }
            }
        }.onTapGesture {
            self.endEdiing()
        }
    }

    private func endEdiing() {
        UIApplication.shared.endEditing()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        let appState = AppState.default
        let presenter = LoginPresenter(appState: appState, loginModel: DummyLoginModel())
        LoginView(presenter: presenter)
    }
}
