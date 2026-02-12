//
//  Film.swift
//  movie_app
//
//  Created by Pubudu Mihiranga on 2026-02-12.
//

import Foundation

struct Film: Codable, Identifiable, Hashable {
    let id: String
    let title: String
    let image: String
    let movieBanner: String
    let description: String
    let director: String
    let producer: String
    let releaseDate: String
    let runningTime: String
    let score: String
    let people: [String]
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case image
        case movieBanner = "movie_banner"
        case description
        case director
        case producer
        case releaseDate = "release_date"
        case runningTime = "running_time"
        case score = "rt_score"
        case people
    }
    
    static var example: Self {
        return Film(
            id: "2baf70d1-42bb-4437-b551-e5fed5a87abe",
            title: "Castle in the Sky",
            image: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/npOnzAbLh6VOIu3naU5QaEcTepo.jpg",
            movieBanner: "https://image.tmdb.org/t/p/w533_and_h300_bestv2/3cyjYtLWCBE1uvWINHFsFnE8LUK.jpg",
            description: "The orphan Sheeta inherited a mysterious crystal that links her to the mythical sky-kingdom of Laputa. With the help of resourceful Pazu and a rollicking band of sky pirates, she makes her way to the ruins of the once-great civilization. Sheeta and Pazu must outwit the evil Muska, who plans to use Laputa's science to make himself ruler of the world.",
            director: "Hayao Miyazaki",
            producer: "Isao Takahata",
            releaseDate: "1986",
            runningTime: "124",
            score: "95",
            people: []
        )
    }
}
