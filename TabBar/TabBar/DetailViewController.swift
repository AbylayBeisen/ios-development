//
//  DetailViewController.swift
//  TabBar
//
//  Created by Abylai  on 05.12.2025.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var objectImage: UIImageView!
    @IBOutlet weak var reviewLabel: UILabel!
    
    
    var favObject: FavItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let favObject = favObject {
            titleLabel.text = favObject.title
            subtitleLabel.text = favObject.subtitle
            objectImage.image = favObject.image
            reviewLabel.text = favObject.review
        }
    }
}
