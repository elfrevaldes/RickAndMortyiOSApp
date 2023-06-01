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
        
        let request = RMRequest(
            endPoint: .character,
            //pathComponents: ["1"],
            queryParams: [
                URLQueryItem(name: "name", value: "rick")
                URLQueryItem(name: "status", value: "alive")
            ]
        )
        print(request.url)
        
        RMService.shared.execute(request, expecting: RMCharacter.self) {result in
            switch result {
            case .success(RMCharacter):
                // Do something with the result
            case .failure(Error):
                // Handle the error case
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
