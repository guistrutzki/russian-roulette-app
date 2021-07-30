//
//  ViewController.swift
//  russianRoulette
//
//  Created by Guilherme Strutzki on 29/07/21.
//

import UIKit

class ViewController: UIViewController {
	
	// MARK: - IBOutlet
	@IBOutlet weak var nameTextField: UITextField!
	@IBOutlet weak var sortButton: UIButton!
	@IBOutlet weak var tableView: UITableView!
	
	// MARK: - Variable
	private let controller = UserController()
	
	
	// MARK: - Life Cycle
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.setupTextField()
		self.setupButton()
		self.setupTableView()
	}
	
	
	// MARK: - Function
	func setupTextField() {
		self.nameTextField.delegate = self
		self.nameTextField.placeholder = "Digite seu nome"
		self.nameTextField.autocorrectionType = .no
		self.nameTextField.autocapitalizationType = .words
	}
	
	func setupButton() {
//		self.sortButton.isEnabled = false
	}
	
	func setupTableView() {
		self.tableView.dataSource = self
		self.tableView.delegate = self
		self.tableView.register(UINib(nibName: "UserCell", bundle: nil), forCellReuseIdentifier: UserCell.identifier)
		self.tableView.register(UINib(nibName: "RouletteCell", bundle: nil), forCellReuseIdentifier: RouletteCell.identifier)
		self.tableView.backgroundColor = UIColor.black
		
		let footerView = UIView()
		footerView.backgroundColor = .black
		self.tableView.tableFooterView = footerView
	}
	
	
	// MARK: - IBAction
	@IBAction func didPressedSort(_ sender: Any) {
		print("did pressed")
	}
	
}


// MARK: - Extension UITextField
extension ViewController: UITextFieldDelegate {
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		nameTextField.resignFirstResponder()
		guard let nameUser = textField.text else { return true }
		self.nameTextField.text = nil
		controller.addUser(nameUser)
		tableView.reloadData()
		
		return true
	}
	
}


// MARK: - Extension UITableView
extension ViewController: UITableViewDelegate, UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return controller.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		if controller.isEmpty() {
			guard let cell = tableView.dequeueReusableCell(withIdentifier: RouletteCell.identifier, for: indexPath) as? RouletteCell
			else { return UITableViewCell() }
			return cell
		}
		
		guard let cell = tableView.dequeueReusableCell(withIdentifier: UserCell.identifier, for: indexPath) as? UserCell
		else { return UITableViewCell() }
		let user = controller.getUser(index: indexPath.row)
		
		cell.setupCell(image: user.imageName, name: user.name)
		return cell
	}
	
}
