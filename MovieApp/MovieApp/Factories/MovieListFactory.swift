//
//  MovieListFactory.swift
//  MovieApp
//
//  Created by M_Sugawara on 2020/09/28.
//  Copyright © 2020 M_Sugawara. All rights reserved.
//

import SwiftUI

enum MovieListFactory {
    static func make() -> some View {
        let presenter = MovieListPresenter()
        let view = MovieListView(presenter: presenter)
        return view
    }
}
