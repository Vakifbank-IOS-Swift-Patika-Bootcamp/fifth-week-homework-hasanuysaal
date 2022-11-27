//
//  ImdbWebViewViewController.swift
//  BreakingBadApp
//
//  Created by Hasan Uysal on 22.11.2022.
//

import UIKit
import WebKit

final class ImdbWebViewViewController: UIViewController {
    
    @IBOutlet private weak var webView: WKWebView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        openPage()
        addRightBarRefreshButton()
        
    }
    
    private func addRightBarRefreshButton(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(webView.reload))
    }
    
    private func openPage(){
        webView.navigationDelegate = self
        webView.load(URLRequest(url: Client.Endpoints.imdb.url))
    }
    
}

extension ImdbWebViewViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        navigationItem.title = webView.title
    }
}
