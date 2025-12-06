//
//  FavouriteTableViewCell.swift
//  TabBar
//
//  Created by Abylai  on 05.12.2025.
//

import UIKit

class FavouriteTableViewCell: UITableViewCell {
    @IBOutlet weak var favImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(favObject: FavItem) {
        titleLabel.text = favObject.title
        favImageView.image = favObject.image
        
    }
}
