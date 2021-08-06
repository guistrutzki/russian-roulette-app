//
//  Alert.swift
//  russianRoulette
//
//  Created by Alexandre Cardoso on 05/08/21.
//

import UIKit
import PopupDialog

class Alert {
	
	private var controller: UIViewController
	
	init(viewController:UIViewController) {
		self.controller = viewController
	}
	
	func showAlert(title: String, message: String, completion: @escaping() -> Void) {
		let image = UIImage(named: "Image")
		let popup = PopupDialog(title: title, message: message, image: image)
		popup.view.backgroundColor = .black
		
		let buttonOne = DefaultButton(title: "OK") {
			completion()
		}
		buttonOne.backgroundColor = UIColor(cgColor: CGColor(red: 75/255.0, green: 162/255.0, blue: 218/255.0, alpha: 1))
		buttonOne.titleColor = .white
		popup.addButtons([buttonOne])
		
		self.controller.present(popup, animated: true)
	}
	
}
