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
	
	
	// MARK: - Life cycle
	override func viewDidLoad() {
		super.viewDidLoad()
		setupUI()
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
	
	private func getItemOrderCell() -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: ItemOrderCell.identifier)
					as? ItemOrderCell else { return UITableViewCell() }
		return cell
	}
	
	
	// MARK: - IBAction
	@IBAction func payButtonTapped(_ sender: Any) {
		dismiss(animated: true)
	}
	
}


// MARK: - Extension UITableView
extension CheckoutViewController: UITableViewDelegate, UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 3
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		return getItemOrderCell()
	}
	
}
