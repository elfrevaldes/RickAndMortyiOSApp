//
//  GetAllCharactersReponse.swift
//  RickAndMorty
//
//  Created by Elfre Valdes on 6/6/23.
//

import Foundation

struct RMGetAllCharectersRespose: Codable {
    struct Info: Codable {
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
    }
    let info: Info
    let results: [RMCharacter]
}
