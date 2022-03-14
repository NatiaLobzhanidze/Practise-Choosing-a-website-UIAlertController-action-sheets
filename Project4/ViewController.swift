//
//  ViewController.swift
//  Project4
//
//  Created by Natia's Mac on 14/03/2022.
//

import WebKit
import UIKit

class ViewController: UIViewController, WKNavigationDelegate{
    var webView: WKWebView!
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "open", style: .plain, target: self, action: #selector(tappedBtn))
        let url = URL(string: "https://www.hackingwithswift.com")!
        webView.load(URLRequest(url:url))
        webView.allowsBackForwardNavigationGestures = true
    }
    @objc func tappedBtn(){
        let ac = UIAlertController(title: "Open page ", message: nil, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "apple.com ", style: .default, handler: openPage))
        ac.addAction(UIAlertAction(title: "w3schools.com", style: .destructive, handler: openPage))
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        ac.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(ac, animated: true)
    }
    
    func openPage(action: UIAlertAction){
        guard let actionTitle = action.title else { return }
        guard let url = URL(string: "https://" + actionTitle) else { return }
        webView.load(URLRequest(url: url))
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
    }
}

