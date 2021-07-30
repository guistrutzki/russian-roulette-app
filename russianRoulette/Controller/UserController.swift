//
//  UserController.swift
//  russianRoulette
//
//  Created by Alexandre Cardoso on 29/07/21.
//

import Foundation

class UserController {
	
	private var users = [User]()
	private let imageNames = ["Image-1", "Image-2", "Image-3", "Image-4", "Image-5"]
	private var selectedName: Int = 0
	
	var count: Int {
		if users.isEmpty {
			return 1
		} else {
			return users.count
		}
	}
	
	
	func addUser(_ name: String) {
		guard let imageName = imageNames.randomElement() else { return }
		users.append(User(name: name, imageName: imageName))
	}
	
	func getUser(index: Int) -> User {
		return users[index]
	}
	
	func isEmpty() -> Bool {
		return users.isEmpty
	}
	
	func enableButton() -> (Bool, Float) {
		if users.isEmpty || users.count == 1 {
			return (false, 0.5)
		} else {
			return (true, 1.0)
		}
	}
	
	func selectedSortName() {
		selectedName = Int.random(in: 0...users.count)
	}
	
	func didSortedName(index: Int) -> String {
		if selectedName == index {
			return "Você foi o SORTEADO!!"
		}
		return "Ufa, não foi você..."
	}
	
	func removeAll() {
		users.removeAll()
	}
	
}
