//
//  ItemOrderCell.swift
//  russianRoulette
//
//  Created by Bruna Drago on 05/08/21.
//

import UIKit

class ItemOrderCell: UITableViewCell {
	
	// MARK: - IBOutlet
	@IBOutlet var itemNameLabel: UILabel!
	@IBOutlet var itemPriceLabel: UILabel!
	@IBOutlet weak var itemQuantityLabel: UILabel!
	@IBOutlet weak var itemFoodImageView: UIImageView!
	
	
	// MARK: - Variable
	static let identifier = "ItemOrderCell"
	
	
	// MARK: - Life cycle
	override func awakeFromNib() {
		super.awakeFromNib()
	}
	
	
	// MARK: - Function
	func setupCell(item: ItemOrder, priceString: String, imageName: String) {
		itemNameLabel.text = item.name
		itemQuantityLabel.text = "\(item.quantity)"
		itemPriceLabel.text = priceString
		itemFoodImageView.image = UIImage(named: imageName)
	}
	
	func setupCell(image: UIImage?, itemDescription: String, price: String) {
		itemFoodImageView.image = image
		itemNameLabel.text = itemDescription
		itemPriceLabel.text = price
	}
	
}
