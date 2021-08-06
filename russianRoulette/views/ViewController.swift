//
//  ViewController.swift
//  russianRoulette
//
//  Created by Guilherme Strutzki on 29/07/21.
//

import UIKit
import Lottie

class ViewController: UIViewController {
	
	// MARK: - IBOutlet
	
	@IBOutlet weak var nameTextField: UITextField!
	@IBOutlet weak var sortButton: UIButton!
	@IBOutlet weak var tableView: UITableView!
	@IBOutlet weak var animatedViewWrapper: UIView!
	
	// MARK: - Variable
	private let controller = UserController()
	private let animationView = AnimationView()
	private let alertController = AlertService()
	//	private var alert: Alert?
	
	// MARK: - Life Cycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.controller.delegate = self
		setupUI()
		setupButton()
	}
	
	override func viewDidAppear(_ animated: Bool) {
		setupLottie()
	}
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		view.endEditing(true)
	}
	
	// MARK: - Private Functions
	
	private func setupUI() {
		self.nameTextField.delegate = self
		self.nameTextField.placeholder = Constants.placeholder
		self.nameTextField.autocorrectionType = .no
		self.nameTextField.autocapitalizationType = .words
		
		self.tableView.dataSource = self
		self.tableView.delegate = self
		self.tableView.register(UINib(nibName: UserCell.identifier, bundle: nil), forCellReuseIdentifier: UserCell.identifier)
		self.tableView.register(UINib(nibName: RouletteCell.identifier, bundle: nil), forCellReuseIdentifier: RouletteCell.identifier)
		self.tableView.backgroundColor = UIColor.black
		
		let footerView = UIView()
		footerView.backgroundColor = .black
		self.tableView.tableFooterView = footerView
		
		tabBarController?.tabBar.barTintColor = .black
	}
	
	private func setupLottie() {
		let animation = Animation.named("credit-card")
		
		animationView.animation = animation
		animationView.contentMode = .scaleAspectFit
		animatedViewWrapper.addSubview(animationView)
		
		animationView.translatesAutoresizingMaskIntoConstraints = false
		animationView.topAnchor.constraint(equalTo: animatedViewWrapper.layoutMarginsGuide.topAnchor).isActive = true
		animationView.leadingAnchor.constraint(equalTo: animatedViewWrapper.leadingAnchor).isActive = true
		
		animationView.trailingAnchor.constraint(equalTo: animatedViewWrapper.trailingAnchor).isActive = true
		animationView.setContentCompressionResistancePriority(.fittingSizeLevel, for: .horizontal)
		
		animationView.play(fromFrame: 0, toFrame: 200, loopMode: .loop)
	}
	
	private func setupButton() {
		let isEnabled = controller.isButtonEnabled()
		sortButton.isEnabled = isEnabled
		sortButton.backgroundColor = setButtonBackgroundColor(isOn: isEnabled)
	}
	
	private func setButtonBackgroundColor(isOn: Bool) -> UIColor {
		return isOn ?  .systemBlue : .systemGray2
	}
	
	private func getRouletteCell() -> UITableViewCell {
		let identifier = RouletteCell.identifier
		
		guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier)
					as? RouletteCell else { return UITableViewCell() }
		return cell
	}
	
	private func getUserCell(index: Int) -> UITableViewCell {
		let identifier = UserCell.identifier
		
		guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier)
					as? UserCell else { return UITableViewCell() }
		
		let user = controller.getUser(index: index)
		
		cell.setupCell(user: user)
		
		return cell
	}
	
	private func presentAlert(title: String, message: String, buttonTitle: String) {
		DispatchQueue.main.async {
			let alert = self.alertController.alert(title: title, message: message, buttonTitle: buttonTitle)
			self.present(alert, animated: true)
		}
	}
    
    private func proceedToAccount() {
        let storyboard = UIStoryboard(name: Constants.CheckoutVCId, bundle: .main)
        let checkoutVC = storyboard.instantiateViewController(withIdentifier: Constants.CheckoutStoryboardID) as! CheckoutViewController
        self.navigationController?.pushViewController(checkoutVC , animated: true)
    }
	
	// MARK: - IBAction
	
	@IBAction func didPressedSort(_ sender: Any) {
		controller.sortUserToPay()
		controller.setCanSelectuser(true)
	}
}

// MARK: - Extension UITextField

extension ViewController: UITextFieldDelegate {
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		nameTextField.resignFirstResponder()
		guard let nameUser = nameTextField.text else { return false }
		controller.addUser(nameUser)
		nameTextField.text?.removeAll()
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
		return controller.isEmpty() ? getRouletteCell() : getUserCell(index: indexPath.row)
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		self.controller.checkUserSorted(indexPath: indexPath)
	}
}


// MARK: - Extension UserControllerDelegate

extension ViewController: UserControllerDelegate {
	
	func removeNotSortedUser(indexPath: IndexPath) {
		self.tableView.deleteRows(at: [indexPath], with: .left)
	}
	
	func showSortedUser(name: String) {
		let title = name
		let message = Constants.alertMessage
		let buttonTitle = Constants.buttonTitle
		presentAlert(title: title, message: message, buttonTitle: buttonTitle)
	}
}

// MARK: - Extension AlertViewControllerDelegate

extension ViewController: AlertViewControllerDelegate {
    
    func actionButtonTapped() {
        proceedToAccount()
    }
}
