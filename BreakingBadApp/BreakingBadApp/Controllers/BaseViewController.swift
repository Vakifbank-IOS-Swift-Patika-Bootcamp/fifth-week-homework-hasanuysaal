//
//  ActivityIndicatorViewController.swift
//  BreakingBadApp
//
//  Created by Hasan Uysal on 25.11.2022.
//

import UIKit
import MaterialActivityIndicator
import SwiftAlertView

class BaseViewController: UIViewController {

    let indicator = MaterialActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupActivityIndıcatorView()
    }
    
    private func setupActivityIndıcatorView(){
        view.addSubview(indicator)
        setupActivityIndıcatorViewConstraints()
    }
    
    private func setupActivityIndıcatorViewConstraints(){
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        indicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func showAlert(message: String, completion: @escaping () -> Void){
        SwiftAlertView.show(title: "Alert", message: message, buttonTitles: ["OK"]).onButtonClicked { _, _ in
            completion()
        }
    }

}
