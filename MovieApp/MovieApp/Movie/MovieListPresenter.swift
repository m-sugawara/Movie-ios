//
//  MovieListPresenter.swift
//  MovieApp
//
//  Created by M_Sugawara on 2020/09/28.
//  Copyright © 2020 M_Sugawara. All rights reserved.
//

import Foundation

final class MovieListPresenter: ObservableObject {
    private var tmdbAPI: TMDBAPI

    @Published var isLoading: Bool = false
    @Published var movieList: [Movie] = []
    @Published var errorMessage: String?

    init() {
        tmdbAPI = TMDBAPI()
    }

    func loadPopularMovies() {
        isLoading = true
        tmdbAPI.sendRequest(.moviePopular) { [weak self] (result: Result<MoviePopular, TMDBError>) in
            DispatchQueue.main.async {
                switch result {
                case .success(let moviePopular):
                    self?.movieList = moviePopular.results
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
                self?.isLoading = false
            }
        }
    }
}
