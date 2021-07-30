//
//  UserCell.swift
//  russianRoulette
//
//  Created by Guilherme Strutzki on 29/07/21.
//

import UIKit

class UserCell: UITableViewCell {

    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    static let identifier = "UserCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setupCell(image: String, name: String) {
        nameLabel.text = name
        avatarImage.image = UIImage(named: image)
    }

}
