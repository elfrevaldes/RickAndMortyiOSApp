//
//  RMEpisode.swift
//  RickAndMorty
//
//  Created by Elfre Valdes on 5/31/23.
//

import Foundation

struct RMEpisode: Codable/*, RMEpisodeDataRender */ {
    let id: Int
    let name: String
    let airDate: String
    let episode: String
    let characters: [String]
    let url: String
    let created: String
}
