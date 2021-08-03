//
//  AlertService.swift
//  russianRoulette
//
//  Created by Bruna Drago on 31/07/21.
//

import UIKit

class AlertService {
    
    func alert(title: String, message: String, buttonTitle: String) -> AlertViewController {
        
        let storyboard = UIStoryboard(name: Constants.alertStoryboardId, bundle: .main)
        
        let alertVC = storyboard.instantiateViewController(withIdentifier: Constants.alertVCId) as! AlertViewController
        
        alertVC.alertTitle = title
        alertVC.alertMessage = message
        alertVC.buttonTitle = buttonTitle
        
        return alertVC
    }
}
