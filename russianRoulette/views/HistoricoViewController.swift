//
//  HistoricoViewController.swift
//  russianRoulette
//
//  Created by Alexandre Cardoso on 09/08/21.
//

import UIKit

class HistoricoViewController: UIViewController {
	
	// MARK: - IBOutlet
	@IBOutlet weak var myTableView: UITableView!
	
	
	// MARK: - Variable
	private let controller = HistoricoController()
	
	
	// MARK: - Life cycle
	override func viewDidLoad() {
		super.viewDidLoad()
		
		controller.delegate = self
		setupTableView()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		loadHistoric()
	}
	
	
	// MARK: - Function
	private func setupTableView() {
		myTableView.dataSource = self
		myTableView.register(UINib(nibName: ItemOrderCell.identifier, bundle: nil),
									forCellReuseIdentifier: ItemOrderCell.identifier)
		self.myTableView.backgroundColor = UIColor.black
		
		let footerView = UIView()
		footerView.backgroundColor = .black
		self.myTableView.tableFooterView = footerView
	}
	
	private func loadHistoric() {
		controller.loadHistoric()
	}
	
}


// MARK: - Extension UITableView
extension HistoricoViewController: UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return controller.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: ItemOrderCell.identifier, for: indexPath) as? ItemOrderCell,
				let itemHistoric = controller.getItemHistoric(indexPath: indexPath) else { return UITableViewCell() }
		
		cell.setupCell(image: Images.imageOne, itemDescription: itemHistoric.name, price: itemHistoric.price.convertCurrentString())
		
		return cell
	}
	
}


// MARK: - Extension HistoricController
extension HistoricoViewController: HistoricoControllerDelegate {
	
	func successLoad() {
		DispatchQueue.main.async {
			self.myTableView.reloadData()
		}
	}
	
}
