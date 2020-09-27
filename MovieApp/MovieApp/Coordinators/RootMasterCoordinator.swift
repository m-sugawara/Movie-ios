//
//  RootMasterCoordinator.swift
//  MovieApp
//
//  Created by M_Sugawara on 2020/09/22.
//  Copyright © 2020 M_Sugawara. All rights reserved.
//

import SwiftUI

protocol MasterCoordinator: Coordinator {}

final class RootMasterCoordinator: MasterCoordinator {
    private weak var window: UIWindow?
    private weak var appState: AppState?

    init(window: UIWindow?, appState: AppState?) {
        self.window = window
        self.appState = appState
    }

    func start() {
        let rootView = RootFactory.make(withAppState: appState!)
        let rootViewController = UIHostingController(rootView: rootView)
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
    }
}
