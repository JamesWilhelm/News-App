

import UIKit
import WebKit

class DetailViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    var articleUrl: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.navigationDelegate = self

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        //check for url
        if articleUrl != nil {
            //create url object
            let url = URL(string: articleUrl!)
            
            guard url != nil else{
                return
            }
            
            //create url request obj
            let request = URLRequest(url: url!)
            
            //start spinner
            spinner.alpha = 1
            spinner.startAnimating()
            
            //load in webview
            webView.load(request)
        }
        
    }

}

extension DetailViewController: WKNavigationDelegate{
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        //stop the spinner and hide it
        
        spinner.stopAnimating()
        spinner.alpha = 0
    }
}
