//
//  ImdbWebViewViewController.swift
//  BreakingBadApp
//
//  Created by Hasan Uysal on 22.11.2022.
//

import UIKit
import WebKit

class ImdbWebViewViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!

    var url: URL!
    var str = "https://www.imdb.com/title/tt0903747/"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStringToUrl(str: str)
        openPage()
        addRightBarRefreshButton()
        
    }
    
    private func addRightBarRefreshButton(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(webView.reload))
    }
    
    
    private func setStringToUrl(str: String){
        if let url = URL(string: str) {
            self.url = url
        }
    }
    
    private func openPage(){
        webView.navigationDelegate = self
        webView.load(URLRequest(url: self.url))
    }

}

extension ImdbWebViewViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        navigationItem.title = webView.title
    }
}
