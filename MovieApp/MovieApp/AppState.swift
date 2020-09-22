//
//  AppState.swift
//  MovieApp
//
//  Created by M_Sugawara on 2020/09/22.
//  Copyright © 2020 M_Sugawara. All rights reserved.
//

import SwiftUI

class AppState: ObservableObject {
    @Published var isLoggedIn: Bool = false
}
