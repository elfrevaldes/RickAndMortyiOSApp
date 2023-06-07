//
//  CharacterListView.swift
//  RickAndMorty
//
//  Created by Elfre Valdes on 6/6/23.
//

import UIKit


/// View that handles a list of characters
final class RMCharacterListView: UIView {
    
    private let viewModel = RMCharacterListViewViewModel()
    private let service = RMCharacterService()
    
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    private func addConstraints() {
        NSLayoutConstraint.activate([
            spinner.widthAnchor.constraint(equalToConstant: 100),
            spinner.heightAnchor.constraint(equalToConstant: 100),
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func setUpCollectionView() {
        collectionView.dataSource = viewModel
        // Setting the columns to 2
        collectionView.delegate = viewModel
        
        // Pretending to get data
        DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: {
            self.spinner.stopAnimating()
            
            // Making the collection visible
            self.collectionView.isHidden = false
            // Making a transition to visible
            UIView.animate(withDuration: 0.4) {
                self.collectionView.alpha = 1
            }
        })
    }
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        // setting the direction of the view
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isHidden = true
        collectionView.alpha = 0
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(
            CharacterCollectionViewCell.self,
            forCellWithReuseIdentifier: CharacterCollectionViewCell.identifier)
        return collectionView
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemBlue
        
        addSubviews(collectionView, spinner)
        
        
        addConstraints()
        setUpCollectionView()
        // initialize the spinner
        spinner.startAnimating()
        service.fetchCharacterList()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
}
