//
//  RMCharacterViewController.swift
//  RickAndMorty
//
//  Created by Elfre Valdes on 5/31/23.
//

import UIKit

/// Controller to show and seach for Characters
final class RMCharacterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
    init(title: String) {
        super.init(nibName: nil, bundle: nil)
        self.title = title
        view.backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
