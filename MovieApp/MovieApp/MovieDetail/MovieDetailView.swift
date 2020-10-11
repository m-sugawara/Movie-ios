//
//  MovieDetailView.swift
//  MovieApp
//
//  Created by M_Sugawara on 2020/10/11.
//  Copyright © 2020 M_Sugawara. All rights reserved.
//

import SwiftUI

struct MovieDetailView: View {

    let movie: Movie

    var body: some View {
        VStack {
            CircleImage(url: URL(string: movie.fullPath!)!)

            VStack(alignment: .leading) {
                Text(movie.title)
                    .font(.title)
                HStack(alignment: .top) {
                    Text("Description")
                        .font(.subheadline)
                    Spacer()
                    Text("date")
                        .font(.subheadline)
                }
            }.padding()

            Spacer()
        }
    }

    private var image: some View {
        AsyncImage(url: URL(string: movie.fullPath!)!) {
            ActivityIndicator(isAnimating: .constant(true), style: .large)

        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movie: Movie.mock)
    }
}
