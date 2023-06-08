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
                print("Example image url: " + String(model.results.first?.image ?? "No image"))
                print("Page result count: " + String(model.results.count))
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
    
    func fetchImage(characterImageUrl: URL?, completion: @escaping (Result<Data, Error>) -> Void) {
        // TODO: [06/15/2023] Fix me by now We need to cash image so we do not have to load images again and again
        guard let url = characterImageUrl else {
            completion(.failure(URLError(.badURL)))
            return
        }
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? URLError(.badServerResponse)))
                return
            }
            completion(.success(data))
        }
        task.resume()
    }
}
