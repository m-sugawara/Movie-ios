//
//  ContentView.swift
//  MovieApp
//
//  Created by M_Sugawara on 2020/08/16.
//  Copyright © 2020 M_Sugawara. All rights reserved.
//

import SwiftUI

struct VideoView: View {

    var movieURL: URL

    var body: some View {
        VideoViewController(movieURL: movieURL)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        VideoView(movieURL: URL(string: "")!)
    }
}
