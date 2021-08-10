//
//  HistoricoController.swift
//  russianRoulette
//
//  Created by Alexandre Cardoso on 09/08/21.
//

import Foundation

protocol HistoricoControllerDelegate: AnyObject {
	func successLoad()
}

class HistoricoController {
	
	private var historic: Historic?
	
	weak var delegate: HistoricoControllerDelegate?
	
	var count: Int {
		return historic?.historyAccountList.count ?? 0
	}
	
	func loadHistoric() {
		guard let url = Bundle.main.url(forResource: "Historico", withExtension: "json"),
				let data = try? Data(contentsOf: url) else { return }
		
		do {
			self.historic = try JSONDecoder().decode(Historic.self, from: data)
			self.delegate?.successLoad()
		} catch {
			print("Erro JSON")
		}
	}
	
	func getItemHistoric(indexPath: IndexPath) -> HistoricList? {
		return historic?.historyAccountList[indexPath.row]
	}
		
}
