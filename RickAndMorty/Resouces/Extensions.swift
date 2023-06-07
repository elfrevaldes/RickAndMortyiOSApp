//
//  Extensions.swift
//  RickAndMorty
//
//  Created by Elfre Valdes on 6/7/23.
//

import UIKit

/// Allows the option to pass an array of views to add them as subviews
extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach({
            addSubview($0)
        })
    }
}
