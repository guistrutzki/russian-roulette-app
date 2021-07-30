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
    var tap: UITapGestureRecognizer = UITapGestureRecognizer()
	
	
	// MARK: - Life Cycle
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.setupTextField()
		self.setupButton()
		self.setupTableView()
		self.setupTabBar()
        self.setupKeyboardObserver()
        self.setupGestureRecognizer()
	}
	
	
	// MARK: - Function
	private func setupTextField() {
		self.nameTextField.delegate = self
		self.nameTextField.placeholder = "Digite seu nome"
		self.nameTextField.autocorrectionType = .no
		self.nameTextField.autocapitalizationType = .words
	}
    
    private func setupGestureRecognizer() {
        tap = UITapGestureRecognizer(target: self, action: #selector(self.dissmissKeyboard))
    }
    
    private func setupKeyboardObserver() {
        NotificationCenter
            .default
            .addObserver(
                self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification , object:nil
            )

        NotificationCenter
            .default
            .addObserver(
                self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification , object:nil
            )
    }
    
	private func setupButton() {
		let enableButton = controller.enableButton()
		self.sortButton.isEnabled = enableButton.0
		self.sortButton.alpha = CGFloat(enableButton.1)
	}
	
	private func setupTableView() {
		self.tableView.dataSource = self
		self.tableView.delegate = self
		self.tableView.register(UINib(nibName: "UserCell", bundle: nil), forCellReuseIdentifier: UserCell.identifier)
		self.tableView.register(UINib(nibName: "RouletteCell", bundle: nil), forCellReuseIdentifier: RouletteCell.identifier)
		self.tableView.backgroundColor = UIColor.black
		
		let footerView = UIView()
		footerView.backgroundColor = .black
		self.tableView.tableFooterView = footerView
	}
	
	private func setupTabBar() {
		tabBarController?.tabBar.barTintColor = .black
	}
    
    // MARK: - Objc func
    @objc func dissmissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        view.addGestureRecognizer(tap)
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        view.removeGestureRecognizer(tap)
    }
	
	
	// MARK: - IBAction
	@IBAction func didPressedSort(_ sender: Any) {
		controller.selectedSortName()
		sortButton.isEnabled = false
		sortButton.alpha = 0.5
	}
	
}


// MARK: - Extension UITextField
extension ViewController: UITextFieldDelegate {
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		nameTextField.resignFirstResponder()
		guard let nameUser = textField.text else { return true }
		self.nameTextField.text = nil
		controller.addUser(nameUser)
		setupButton()
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
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if controller.isEmpty() { return }
		
		if sortButton.isEnabled {
			let alertController = UIAlertController(title: "Atenção!", message: "Clique no botão Sortear primeiro.", preferredStyle: .alert)
			let actionOK = UIAlertAction(title: "OK", style: .default)
			
			alertController.addAction(actionOK)
			present(alertController, animated: true)
		} else {
			let message = controller.didSortedName(index: indexPath.row)
			let alertController = UIAlertController(title: "Quem vai pagar a conta??", message: message, preferredStyle: .alert)
			let actionOK = UIAlertAction(title: "OK", style: .default) { _ in
				self.controller.removeAll()
				self.tableView.reloadData()
			}
			
			alertController.addAction(actionOK)
			present(alertController, animated: true)
		}
		
	}
	
}
