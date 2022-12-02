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
    
    
    func setNavBarBackButtonTitle(view: UIViewController, title: String = ""){
        view.navigationItem.backBarButtonItem = UIBarButtonItem(title: title, style: .plain, target: nil, action: nil)
    }
    
    func setNavBarTitle(view: UIViewController, title: String){
        view.title = title
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
