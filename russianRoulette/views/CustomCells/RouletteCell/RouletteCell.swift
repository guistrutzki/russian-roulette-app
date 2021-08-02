//
//  RouletteCell.swift
//  russianRoulette
//
//  Created by Guilherme Strutzki on 29/07/21.
//

import UIKit

class RouletteCell: UITableViewCell {
    
    static let identifier = Constants.rouletteCell

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.selectionStyle = .none
    }
}
