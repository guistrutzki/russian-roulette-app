//
//  ListItem.swift
//  russianRoulette
//
//  Created by Bruna Drago on 05/08/21.
//

import Foundation

struct ListItem: Decodable {
    
    let totalValue: Double
    let productList: [Items]
}

struct Items: Decodable {
    
    let productID: String
    let productType: String
    let date: Date
    let name: String
    let price: Double
    let quantity: Int
}

