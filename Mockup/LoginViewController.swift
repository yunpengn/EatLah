//
//  LoginViewController.swift
//  Mockup
//
//  Created by Yunpeng Niu on 16/03/18.
//  Copyright © 2018 Yunpeng Niu. All rights reserved.
//

import UIKit
import WebKit

class LoginViewController: UIViewController {
    @IBOutlet weak var webview: WKWebView!
    let key = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = URL(string: "https://ivle.nus.edu.sg/api/login/?apikey=\(key)") {
            webview.load(URLRequest(url: url))
        }
    }
}
