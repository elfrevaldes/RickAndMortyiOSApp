//
//  RMEpisodeViewController.swift
//  RickAndMorty
//
//  Created by Elfre Valdes on 5/31/23.
//

import UIKit
/// Controller to show and seach for Episodes
final class RMEpisodeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
