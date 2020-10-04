//
//  MovieView.swift
//  MovieApp
//
//  Created by M_Sugawara on 2020/08/16.
//  Copyright © 2020 M_Sugawara. All rights reserved.
//

import SwiftUI

struct MovieView: View {

    let movie: Movie

    var body: some View {
        contentView
    }

    private var contentView: some View {
        HStack {
            image
                .aspectRatio(contentMode: .fit)
                .frame(width: 200)
            VStack(alignment: .leading, spacing: 4) {
                Text(movie.title)
                Text("SubTitle")
            }.frame(width: 200)
        }
    }

    private var image: some View {
        AsyncImage(url: URL(string: movie.fullPath!)!) {
            ActivityIndicator(isAnimating: .constant(true), style: .large)

        }
    }

}

#if DEBUG
struct MovieView_Previews: PreviewProvider {
    static var previews: some View {
        MovieView(movie: Movie.mock)
    }
}
#endif
