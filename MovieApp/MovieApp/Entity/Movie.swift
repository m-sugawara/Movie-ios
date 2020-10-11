//
//  Movie.swift
//  MovieApp
//
//  Created by M_Sugawara on 2020/09/28.
//  Copyright © 2020 M_Sugawara. All rights reserved.
//

import SwiftUI

struct Movie: Codable {
    var id: Int
    let title: String
    let video: Bool
    let posterPath: String?

    // TODO: Need to fix later
    // Ref: https://developers.themoviedb.org/3/getting-started/images
    var fullPath: String? {
        if let posterPath = posterPath {
            return "https://image.tmdb.org/t/p/w500" + posterPath
        }
        return nil
    }

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case video
        case posterPath = "poster_path"
    }
}

extension Movie: Hashable {}

extension Movie: Identifiable {}

#if DEBUG
extension Movie {
    static var mock: Movie {
        return Movie(id: 1,
                     title: "mock",
                     video: true,
                     posterPath: "mock")
    }
}
#endif
