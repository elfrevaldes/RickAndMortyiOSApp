//
//  RMCharacterViewController.swift
//  RickAndMorty
//
//  Created by Elfre Valdes on 5/31/23.
//

import UIKit

/// Controller to show and seach for Characters
final class RMCharacterViewController: UIViewController {

    private let charListView = RMCharacterListView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
        
    private func setupView() {
        view.addSubview(charListView)
        NSLayoutConstraint.activate([
            charListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            charListView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            charListView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            charListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    init(title: String) {
        super.init(nibName: nil, bundle: nil)
        self.title = title
        view.backgroundColor = .systemBackground
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
