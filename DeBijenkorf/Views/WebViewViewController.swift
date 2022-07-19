//
//  WebViewViewController.swift
//  DeBijenkorf
//
//  Created by Amitav Singh on 13/07/2022.
//

import UIKit
import WebKit

class WebViewViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    var viewModel: WebViewViewModel?

    
    static func initWith(viewModel: WebViewViewModel) -> WebViewViewController {
        let storyboard = UIStoryboard(name: StoryBoards.Main, bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier:"WebViewViewController")
            as? WebViewViewController
        {
            vc.viewModel = viewModel
            return vc
        }
        return WebViewViewController()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.webView.load(URLRequest(url: URL(string: viewModel!.urlLink)!))
    }

}
