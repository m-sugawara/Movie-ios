//
//  VideoFactory.swift
//  MovieApp
//
//  Created by M_Sugawara on 2020/09/22.
//  Copyright © 2020 M_Sugawara. All rights reserved.
//

import SwiftUI

enum VideoFactory {
    static func make() -> some View {
        let view = VideoView(movieURL: URL(string: "https://www.google.com")!)
        return view
    }
}
