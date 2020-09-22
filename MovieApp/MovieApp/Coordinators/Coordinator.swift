//
//  Coordinator.swift
//  MovieApp
//
//  Created by M_Sugawara on 2020/09/22.
//  Copyright © 2020 M_Sugawara. All rights reserved.
//

import Foundation

protocol Coordinator {
    func start()
}

extension Coordinator {
    func coordinate(to coordinator: Coordinator) {
        coordinator.start()
    }
}
