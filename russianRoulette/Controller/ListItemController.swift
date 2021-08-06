//
//  ListItemController.swift
//  russianRoulette
//
//  Created by Bruna Drago on 05/08/21.
//

import UIKit

class ListItemController {
    
    
    // MARK: - Variable
    
    private var listItem = [ListItem]()
    
    private let foodImages = [Images.imageFood]
    
    // MARK: - Functions
    
    func loadItems() -> ListItem? {
       // let items = loadJson(fileName: "Account")
        let items = loadJson(fileName: "Account")
        print("====ITEM:\(items)")
        return items 
    }
    
    // MARK: - Private Functions
    
   private func loadJson(fileName: String) -> ListItem? {
        let decoder = JSONDecoder()
        guard
            let url = Bundle.main.url(forResource: fileName, withExtension: "json"),
            let data = try? Data(contentsOf: url),
            let items = try? decoder.decode(ListItem.self, from: data)
        else {
            return nil
        }
        
        return items
    }
    
    private func loadJson(filename fileName: String) -> ListItem? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(ListItem.self, from: data)
                return jsonData
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
}


