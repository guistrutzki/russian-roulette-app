//
//  AlertViewController.swift
//  russianRoulette
//
//  Created by Bruna Drago on 31/07/21.
//

import UIKit

protocol AlertViewControllerDelegate: AnyObject {
    func actionButtonTapped()
}

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
    
    weak var delegate: AlertViewControllerDelegate?
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAlert()
        setupUI()
    }
    
    @IBAction func OKButtonPressed(_ sender: UIButton) {
        delegate?.actionButtonTapped()
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
