//
//  Movie.swift
//  MovieApp
//
//  Created by M_Sugawara on 2020/09/28.
//  Copyright © 2020 M_Sugawara. All rights reserved.
//

import Foundation

struct Movie: Codable {
    let id: Int
    let title: String
    let video: Bool
    let posterPath: String?

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case video
        case posterPath = "poster_path"
    }
}
