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
	
	
	// MARK: - Variable
	static let identifier = "ItemOrderCell"
	
	
	// MARK: - Life cycle
	override func awakeFromNib() {
		super.awakeFromNib()
	}
	
	
	// MARK: - Function
	func setupCell(item: ItemOrder) {
		itemNameLabel.text = item.name
	}
	
}
