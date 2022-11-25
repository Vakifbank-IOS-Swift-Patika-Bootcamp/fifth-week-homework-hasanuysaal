//
//  ActivityIndicatorViewController.swift
//  BreakingBadApp
//
//  Created by Hasan Uysal on 25.11.2022.
//

import UIKit
import MaterialActivityIndicator

class ActivityIndicatorViewController: UIViewController {

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

}
