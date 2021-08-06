//
//  UserController.swift
//  russianRoulette
//
//  Created by Alexandre Cardoso on 29/07/21.
//

import UIKit

protocol UserControllerDelegate: AnyObject {
	func showSortedUser(name: String)
	func removeNotSortedUser(indexPath: IndexPath)
}

class UserController {
	
	// MARK: - Variable
	
	private var users = [User]()
	private var canSelectUser: Bool = false
	private var sortedUser: User?
	
	private let imageNames = [Images.imageOne, Images.imageTwo, Images.imageThree, Images.imageFour, Images.imageFive]
	
	weak var delegate: UserControllerDelegate?
	
	var count: Int {
		if users.isEmpty {
			return 1
		} else {
			return users.count
		}
	}
	
	// MARK: - Public Functions
	
	func addUser(_ name: String) {
		if name.isEmpty { return }
		
		guard let imageName = imageNames.randomElement() else { return }
		users.append(User(name: name, imageName: imageName ?? UIImage()))
	}
	
	func getUser(index: Int) -> User {
		return users[index]
	}
	
	func isEmpty() -> Bool {
		return users.isEmpty
	}
	
	func isButtonEnabled() -> Bool {
		users.count >= 2 ? true : false
	}
	
	func setCanSelectuser(_ newState: Bool) {
		canSelectUser = newState
	}
	
	func getCanSelectUser() -> Bool {
		return canSelectUser
	}
	
	func sortUserToPay() {
		self.sortedUser = self.users.randomElement()
		print(sortedUser?.name ?? "")
	}
	
	func checkUserSorted(indexPath: IndexPath) {
		if canSelectUser {
			if self.sortedUser === self.users[indexPath.row] {
				self.delegate?.showSortedUser(name: users[indexPath.row].name)
			} else {
				self.users.remove(at: indexPath.row)
				self.delegate?.removeNotSortedUser(indexPath: indexPath)
			}
		}
	}
	
	func removeAllUsers() {
		users.removeAll()
	}
	
}
