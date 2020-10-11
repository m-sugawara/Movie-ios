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
                .frame(width: 50, height: 50)
            VStack(alignment: .leading, spacing: 4) {
                Text(movie.title)
                    .lineLimit(1)
                Text("Description")
                    .lineLimit(1)
            }
            Spacer()
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
