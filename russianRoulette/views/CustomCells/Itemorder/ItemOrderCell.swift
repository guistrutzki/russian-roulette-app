//
//  ItemOrderCell.swift
//  russianRoulette
//
//  Created by Bruna Drago on 05/08/21.
//

import UIKit

class ItemOrderCell: UITableViewCell {
    
    static let identifier = "ItemOrderCell"
    
    @IBOutlet var itemNameLabel: UILabel!
    
    
    @IBOutlet var itemPriceLabel: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
