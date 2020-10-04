//
//  RootView.swift
//  MovieApp
//
//  Created by M_Sugawara on 2020/09/22.
//  Copyright © 2020 M_Sugawara. All rights reserved.
//

import SwiftUI

struct RootView<ContentView: View, LoginView: View>: View {

    @ObservedObject var appState: AppState

    var contentView: ContentView
    var loginView: LoginView

    var body: some View {
        ZStack {
            contentView
        }.modalLink(isPresented: !$appState.isLoggedIn, destination: {
            loginView
        })
    }
}

#if DEBUG
struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        let appState = AppState()
        let loginView = LoginFactory.make(with: appState)
        let contentView = MovieListFactory.make()
        RootView(appState: appState, contentView: contentView, loginView: loginView)
    }
}
#endif
