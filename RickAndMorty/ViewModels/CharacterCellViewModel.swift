//
//  CharacterCollectionViewCellViewModel.swift
//  RickAndMorty
//
//  Created by Elfre Valdes on 6/7/23.
//

import Foundation

struct CharacterCellViewModel {
    public let characterName: String
    public let characterImageUrl: URL?
    private let characterStatus: RMCharacterStatus
    
    init(
        characterName: String,
        characterStatus: RMCharacterStatus,
        characterImageUrl: URL?
    ) {
        self.characterName = characterName
        self.characterStatus = characterStatus
        self.characterImageUrl = characterImageUrl
    }
    
    public var characterStatusText: String {
        return characterStatus.rawValue
    }
}
