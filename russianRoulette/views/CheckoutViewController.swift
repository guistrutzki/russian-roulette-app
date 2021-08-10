//
//  CheckoutViewController.swift
//  russianRoulette
//
//  Created by Bruna Drago on 05/08/21.
//

import UIKit

class CheckoutViewController: UIViewController {
	
	// MARK: - IBOutlet
	@IBOutlet weak var tableView: UITableView!
	@IBOutlet var totalLabel: UILabel!
	@IBOutlet var payButton: UIButton!
	
	// MARK: - Variable
	private let controller = CheckoutController()
	
	
	// MARK: - Life cycle
	override func viewDidLoad() {
		super.viewDidLoad()
		setupUI()
		
		controller.delegate = self
		fetchOrder()
	}
	
	
	// MARK: - Private Functions
	private func setupUI() {
		self.tableView.dataSource = self
		self.tableView.delegate = self
		self.tableView.register(UINib(nibName: ItemOrderCell.identifier, bundle: nil),
										forCellReuseIdentifier: ItemOrderCell.identifier)
		self.tableView.backgroundColor = UIColor.black

		let footerView = UIView()
		footerView.backgroundColor = .black
		self.tableView.tableFooterView = footerView
	}
	
	private func getItemOrderCell(_ indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: ItemOrderCell.identifier)
					as? ItemOrderCell,
				let itemOrder = controller.getItemOrder(indexPath: indexPath) else { return UITableViewCell() }
		
		let priceString = controller.formatValueNumericToString(value: itemOrder.price)
		let imageName = controller.getImageName(named: itemOrder.productType)
		
		cell.setupCell(item: itemOrder, priceString: priceString, imageName: imageName)
		
		return cell
	}
	
	private func fetchOrder() {
		controller.fetchOrder()
	}
	
	
	// MARK: - IBAction
	@IBAction func payButtonTapped(_ sender: Any) {
		dismiss(animated: true)
	}
	
}


// MARK: - Extension UITableView
extension CheckoutViewController: UITableViewDelegate, UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return controller.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		return getItemOrderCell(indexPath)
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
	}
	
}


// MARK: - Extension CheckoutController
extension CheckoutViewController: CheckoutControllerDelegate {
	
	func successFetch() {
		DispatchQueue.main.async {
			self.tableView.reloadData()
			self.totalLabel.text = self.controller.getTotalValue()
		}
	}
	
}
