//
//  ViewController.swift
//  russianRoulette
//
//  Created by Guilherme Strutzki on 29/07/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var sortButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupTextField()
        self.setupButton()
    }
    
    func setupTextField() {
        self.nameTextField.delegate = self
        self.nameTextField.placeholder = "Digite seu nome"
        self.nameTextField.autocorrectionType = .no
        self.nameTextField.autocapitalizationType = .words
    }
    
    func setupButton() {
        self.sortButton.isEnabled = false
    }
    
    func setupTableView() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.tableView
            .register(UINib(nibName: UserCell.identifier, bundle: nil), forCellReuseIdentifier: UserCell.identifier)
        self.tableView
            .register(UINib(nibName: RouletteCell.identifier, bundle: nil), forCellReuseIdentifier: RouletteCell.identifier)
        
//        TODO: Remove unused cells
//        self.tableView.tableFooterView = UIView()
    }

    @IBAction func didPressedSort(_ sender: Any) {
        print("did pressed")
    }
    
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTextField.resignFirstResponder()
        
        return true
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
