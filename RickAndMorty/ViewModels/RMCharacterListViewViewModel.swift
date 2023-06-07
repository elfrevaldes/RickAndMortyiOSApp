//
//  CharacterListViewViewModel.swift
//  RickAndMorty
//
//  Created by Elfre Valdes on 6/6/23.
//

import UIKit

final class RMCharacterListViewViewModel: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20 // just for now
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // deque and return a single cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .systemGreen
        return cell
    }
    /// This method specifies the high and width of our viewColection
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // adpating to the specific device
        let bounds = UIScreen.main.bounds
        
        let width = (bounds.width - 30)/2
        // let heigth = (bounds.height - 20)/2
        return CGSize(width: width, height: width * 1.5)
    }
}
