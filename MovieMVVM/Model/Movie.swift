//
//  Movie.swift
//  MovieMVVM
//
//  Created by Hmoo Myat Theingi on 23/01/2024.
//

import Foundation

struct Movie: Codable {
    let title: String
    let posterPath: String
    let overview: String?
    let releasedDate: String?
    
    enum CodingKeys: String, CodingKey {
        case title
        case posterPath = "poster_path"
        case overview
        case releasedDate = "release_date"
    }
}
