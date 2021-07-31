//
//  AlertViewController.swift
//  russianRoulette
//
//  Created by Bruna Drago on 31/07/21.
//

import UIKit

class AlertViewController: UIViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var messageLabel: UILabel!
    @IBOutlet var okButton: UIButton!
    @IBOutlet var alertImage: UIImageView!
    @IBOutlet var alertView: UIView!
    
    // MARK: - Variable
    
    var alertTitle = String()
    
    var alertMessage = String()
    
    var buttonTitle = String()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAlert()
        setupUI()
    }
    
    @IBAction func OKButtonPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    // MARK: - Private Functions
    
    private func setupAlert() {
        titleLabel.text = alertTitle
        messageLabel.text = alertMessage
        okButton.setTitle(buttonTitle, for: .normal)
    }
    
    private func setupUI() {
        okButton.layer.cornerRadius = 8
    }
}
