//
//  CheckoutController.swift
//  russianRoulette
//
//  Created by Alexandre Cardoso on 05/08/21.
//

import Foundation

protocol CheckoutControllerDelegate: AnyObject {
	func successFetch()
}

class CheckoutController {
	
	private var order: Order?
	
	weak var delegate: CheckoutControllerDelegate?
	
	var count: Int {
		return order?.productList.count ?? 0
	}
	
	func fetchOrder() {
		guard let url = Bundle.main.url(forResource: "Account", withExtension: "json"),
				let data = try? Data(contentsOf: url) else { return }
		
		do {
			self.order = try JSONDecoder().decode(Order.self, from: data)
			self.delegate?.successFetch()
		} catch {
			print("Erro JSON")
		}
	}
	
	func getTotalValue() -> String {
		return String(format: "%.2f", order?.totalValue ?? 0.0)
	}
	
	func getItemOrder(indexPath: IndexPath) -> ItemOrder? {
		return order?.productList[indexPath.row]
	}
	
}
