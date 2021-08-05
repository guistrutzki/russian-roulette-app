//
//  User.swift
//  russianRoulette
//
//  Created by Alexandre Cardoso on 29/07/21.
//

import UIKit

class User: NSObject {
	let name: String
	let imageName: UIImage
	
	init(name: String, imageName: UIImage) {
		 self.name = name
		 self.imageName = imageName
	}
}
