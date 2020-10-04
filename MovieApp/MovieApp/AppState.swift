//
//  AppState.swift
//  MovieApp
//
//  Created by M_Sugawara on 2020/09/22.
//  Copyright © 2020 M_Sugawara. All rights reserved.
//

import SwiftUI

final class AppState: ObservableObject {
    @Published var isLoggedIn: Bool = false

    init(isLoggedIn: Bool) {
        self.isLoggedIn = isLoggedIn
    }

    static var `default`: AppState {
        return AppState(isLoggedIn: false)
    }
}
