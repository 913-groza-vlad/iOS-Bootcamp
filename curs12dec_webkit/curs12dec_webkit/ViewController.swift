//
//  ViewController.swift
//  curs12dec_webkit
//
//  Created by Vlad Groza on 12.12.2023.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak private var webView: WKWebView!
    
    @IBOutlet weak var urlTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.navigationDelegate = self
        
        let url = URL(string: "https://google.com")!
        let request = URLRequest(url: url)
        
        webView.load(request)
    }


    @IBAction private func onBackPressed(_ sender: Any) {
        webView.goBack()
    }
    
    @IBAction private func onForwardPressed(_ sender: Any) {
        webView.goForward()
    }
    
    @IBAction private func onGoPressed(_ sender: Any) {
        DispatchQueue.main.async {
            if let url = URL(string: self.urlTextField.text!) {
                let urlRequest = URLRequest(url: url)
                self.webView.load(urlRequest)
            }
            else {
                let alert = UIAlertController(title: "URL invalid", message: "", preferredStyle: .alert)
                let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
                alert.addAction(cancelAction)
                self.present(alert, animated: true)
            }
        }
    }
    
    private func showSuccessfullyPayment() {
        let alert = UIAlertController(title: "Success", message: "Successful payment", preferredStyle: .alert)
        let cancelButton = UIAlertAction(title: "Ok", style: .cancel)
        alert.addAction(cancelButton)
        present(alert, animated: true)
    }
    
    private func showError(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let cancelButton = UIAlertAction(title: "Ok", style: .cancel)
        alert.addAction(cancelButton)
        present(alert, animated: true)
    }
}

extension ViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if let urlString = navigationAction.request.url?.absoluteString {
            if urlString.contains("success") {
                self.showSuccessfullyPayment()
                decisionHandler(.cancel)
            }
            else if urlString.contains("error") {
                let urlComponents = URLComponents(string: urlString)
                if let queryItem = urlComponents?.queryItems?.first(where: { queryItem in
                    queryItem.name == "message"
                }) {
                    self.showError(message: queryItem.value ?? "")
                }
                decisionHandler(.cancel)
            }
            else {
                decisionHandler(.allow)
            }
        }
        else {
            decisionHandler(.allow)
        }
    }
}

