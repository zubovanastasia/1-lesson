//
//  VkApiAuthViewController.swift
//  VkApiAuthViewController
//
//  Created by Anastasiia Zubova on 19.10.2021.
//

import UIKit
import WebKit
import Firebase

class VkApiAuthViewController: UIViewController, WKNavigationDelegate {
    
    private var usersID = [Session]()
    private let ref = Database.database().reference(withPath: "usersID")
    
    @IBOutlet weak var webview: WKWebView!{
        didSet{
            webview.navigationDelegate = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
      autorizeToVkApi()
    }
    
    func autorizeToVkApi () {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "oauth.vk.com"
        urlComponents.path = "/authorize"
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: "7979623"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "scope", value: "262150"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "revoke", value: "1"),
            URLQueryItem(name: "v", value: "5.81")
        ]
        
        let request = URLRequest(url: urlComponents.url!)
        
        webview.load(request)
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        
        guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment  else {
            decisionHandler(.allow)
            return
        }
        print(url)
        
        let params = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
            }
        
        guard let token = params["access_token"],
              let userId = params["user_id"] else { return}
        
        let usersID = Session(userId: userId)
        let userContainerRef = self.ref.child(userId)
        userContainerRef.setValue(usersID.toAnyObject())
        
        print(token)
        
        Session.shared.token = token
        Session.shared.userId = userId
        
        performSegue(withIdentifier: "showTabbar", sender: nil)
        
        decisionHandler(.cancel)
    }

}

//7822904
