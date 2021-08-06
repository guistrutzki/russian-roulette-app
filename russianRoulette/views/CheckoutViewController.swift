//
//  CheckoutViewController.swift
//  russianRoulette
//
//  Created by Bruna Drago on 05/08/21.
//

import UIKit

class CheckoutViewController: UIViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var totalLabel: UILabel!
    @IBOutlet var payButton: UIButton!
    
    // MARK: - Variable
    
    private let controller = ListItemController()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    
    @IBAction func payButtonTapped(_ sender: Any) {
    }
    
    // MARK: - Private Functions
    
    private func setupUI() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(UINib(nibName: ItemOrderCell.identifier, bundle: nil), forCellReuseIdentifier: ItemOrderCell.identifier)
        self.tableView.backgroundColor = UIColor.black
        
        let footerView = UIView()
        footerView.backgroundColor = .black
        self.tableView.tableFooterView = footerView
    }
    
    private func getItemOrderCell() -> UITableViewCell {
        let identifier = ItemOrderCell.identifier
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier)
                    as? ItemOrderCell else { return UITableViewCell() }
        
       // cell.setup(items: )
    
        return cell
    }
    
}

// MARK: - TableViewDelegate  and DataSource extension

extension CheckoutViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return getItemOrderCell()
    }
    
}
