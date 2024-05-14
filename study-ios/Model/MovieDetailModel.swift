//
//  MovieDetailModel.swift
//  study-ios
//
//  Created by Linhtn1 on 14/5/24.
//

struct MovieDetailReponse: Codable {
    let adult : Bool?
    let backdrop_path : String?
    let budget : Int?
    let genres : [Genres]?
    let homepage : String?
    let id : Int?
    let imdb_id : String?
    let overview : String?
    let poster_path : String?
    let release_date : String?
    let runtime : Int?
    let title : String?
    let vote_average : Double?
}

struct Genres : Codable {
    let id : Int?
    let name : String?
}

