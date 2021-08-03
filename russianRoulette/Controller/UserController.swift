//
//  UserController.swift
//  russianRoulette
//
//  Created by Alexandre Cardoso on 29/07/21.
//

import UIKit

class UserController {
    
    // MARK: - Variable
    
    private var users = [User]()
    private var canSelectUser: Bool = false
    private var selectedUserIndex: Int = 0
    
    private let imageNames = [Images.imageOne, Images.imageTwo, Images.imageThree, Images.imageFour, Images.imageFive]
    
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
    
    func getSelectedUserIndex() -> Int {
        return selectedUserIndex
    }
    
    func sortUserToPay() {
        selectedUserIndex = Int.random(in: 0...users.count)
        print(selectedUserIndex)
    }
}
