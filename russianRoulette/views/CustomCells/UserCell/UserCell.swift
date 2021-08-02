//
//  UserCell.swift
//  russianRoulette
//
//  Created by Guilherme Strutzki on 29/07/21.
//

import UIKit

class UserCell: UITableViewCell {
	
    // MARK: - IBOutlet
    
	@IBOutlet weak var avatarImage: UIImageView!
	@IBOutlet weak var nameLabel: UILabel!
	
    static let identifier = Constants.userCell
	
    // MARK: - Functions
    
	func setupCell(image: UIImage, name: String) {
		self.avatarImage.image = image
		self.nameLabel.text = name
	}
}
