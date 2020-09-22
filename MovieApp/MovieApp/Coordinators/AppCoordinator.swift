//
//  AppCoordinator.swift
//  MovieApp
//
//  Created by M_Sugawara on 2020/09/22.
//  Copyright © 2020 M_Sugawara. All rights reserved.
//

import UIKit

final class AppCoordinator: Coordinator {
    private weak var window: UIWindow?
    private weak var appState: AppState?

    init(window: UIWindow, appState: AppState?) {
        self.window = window
        self.appState = appState
    }

    func start() {
        let coordinator = RootMasterCoordinator(window: window, appState: appState)
        coordinate(to: coordinator)
    }
}
