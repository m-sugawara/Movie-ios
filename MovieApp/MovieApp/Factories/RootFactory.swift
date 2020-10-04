//
//  RootFactory.swift
//  MovieApp
//
//  Created by M_Sugawara on 2020/09/27.
//  Copyright © 2020 M_Sugawara. All rights reserved.
//

import SwiftUI

enum RootFactory {
    static func make(withAppState appState: AppState) -> some View {
        let loginView = LoginFactory.make(with: appState)
        let movieListView = MovieListFactory.make()
        let view = RootView(appState: appState, contentView: movieListView, loginView: loginView)
        return view
    }
}
