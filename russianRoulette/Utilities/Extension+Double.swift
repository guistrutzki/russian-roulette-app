//
//  Extension+Double.swift
//  russianRoulette
//
//  Created by Alexandre Cardoso on 09/08/21.
//

import Foundation

extension Double {
	
	func convertCurrentString() -> String {
		return String(format: "R$ %.2f", self)
	}
	
}
