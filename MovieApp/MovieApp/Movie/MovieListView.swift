//
//  MovieListView.swift
//  MovieApp
//
//  Created by M_Sugawara on 2020/09/28.
//  Copyright © 2020 M_Sugawara. All rights reserved.
//

import SwiftUI

struct MovieListView: View {

    @ObservedObject var presenter: MovieListPresenter

    var body: some View {
        content
            .onAppear(perform: presenter.loadPopularMovies)
    }

    private var content: some View {
        ZStack {
            if presenter.isLoading {
                Text("Welcome")
            } else {
                listContents
            }
        }
    }

    private var listContents: some View {
        ScrollView {
            VStack {
                ForEach(presenter.movieList, id: \.self) { movie in
                    MovieView(movie: movie)
                }
            }
        }
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView(presenter: MovieListPresenter())
    }
}
