//
//  AlertViewController.swift
//  russianRoulette
//
//  Created by Bruna Drago on 31/07/21.
//

import UIKit

class AlertViewController: UIViewController {
    
    @IBOutlet var titleLabel: UILabel!
    
    @IBOutlet var messageLabel: UILabel!
    
    @IBOutlet var okButton: UIButton!
    
    @IBOutlet var alertImage: UIImageView!
    
    @IBOutlet var alertView: UIView!
    
    var alertTitle = String()
    
    var alertMessage = String()
    
    var buttonTitle = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAlert()
    }
    
    @IBAction func OKButtonPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    func setupAlert() {
        titleLabel.text = alertTitle
        messageLabel.text = alertMessage
        okButton.setTitle(buttonTitle, for: .normal)
    }
}
