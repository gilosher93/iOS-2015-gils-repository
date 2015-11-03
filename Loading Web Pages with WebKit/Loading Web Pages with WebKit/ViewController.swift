//
//  ViewController.swift
//  Loading Web Pages with WebKit
//
//  Created by גיל אושר on 2.11.2015.
//  Copyright © 2015 gil osher. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController , WKNavigationDelegate{
    
    var webView: WKWebView?;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let preferences = WKPreferences();
        preferences.javaScriptEnabled = false;
        
        let configuration = WKWebViewConfiguration();
        configuration.preferences = preferences;
        
        webView = WKWebView(frame: view.bounds, configuration: configuration);
        if let theWebView = webView{
            let url = NSURL(string: "http://www.google.co.il");
            let urlRequest = NSURLRequest(URL: url!);
            theWebView.loadRequest(urlRequest);
            theWebView.navigationDelegate = self;
            view.addSubview(theWebView);
            
        }
    }
    
    /* Start the network activity indicator when the web view is loading */
    func webView(webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true;
    }
    
    /* Stop the network activity indicator when the loading is finished */
    func webView(webView: WKWebView, didFinishNavigation navigation: WKNavigation!) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true;
    }
    
    func webView(webView: WKWebView, decidePolicyForNavigationAction navigationAction: WKNavigationAction, decisionHandler: (WKNavigationActionPolicy) -> Void) {
        if navigationAction.navigationType == WKNavigationType.LinkActivated{
            decisionHandler(.Cancel);
            let alertController = UIAlertController(title: "Action NOT Allowed!", message: "links are not allowed", preferredStyle: .Alert);
            alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil));
            presentViewController(alertController, animated: true, completion: nil);
            return;
        }
        decisionHandler(.Allow);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

