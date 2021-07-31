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
        setupUI()
    }
    
    
    // MARK: - Private Functions

    private func setupButton() {
        // TODO: Regra para habilitar e desabilitar
    }

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
        
        cell.setupCell(image: user.imageName , name: user.name )
        
        return cell
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
}
