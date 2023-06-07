//
//  RMCharacterService.swift
//  RickAndMorty
//
//  Created by Elfre Valdes on 6/6/23.
//

import Foundation

struct RMCharacterService {
    func fetchCharacterList() {
        RMNetwork.service.execute(.characterListReq,
                                  expecting: RMGetAllCharectersRespose.self) { result in
            switch result {
            case .success(let model):
                // Accessing data
                print("Total: " + String(model.info.count))
                print("Page result count: " + String(model.results.count))
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}
