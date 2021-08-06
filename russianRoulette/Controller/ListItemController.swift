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
    
    func loadJson(fileName: String) -> ListItem? {
        let decoder = JSONDecoder()
        guard
            let url = Bundle.main.url(forResource: fileName, withExtension: "json"),
            let data = try? Data(contentsOf: url),
            let person = try? decoder.decode(ListItem.self, from: data)
        else {
            return nil
        }
        
        return person
    }
}


