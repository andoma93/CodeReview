//
//  UIAnimationWebview.swift
//  Book_Sources
//
//  Created by Mario Monaco on 22/03/2019.
//

import Foundation
import UIKit
import WebKit

class UIAnimationWebView : UIViewController{
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var label: UILabel!
    
    var gifName = "coding"
    var labelValue = ""
    var backgroundColor : UIColor?
    var textColor : UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = Bundle.main.url(forResource: gifName, withExtension: "gif")!
        let data = try! Data(contentsOf: url)
        webView.load(data, mimeType: "image/gif", characterEncodingName: "UTF-8", baseURL: NSURL() as URL)
        webView.contentMode = UIView.ContentMode.scaleAspectFit
        webView.scrollView.isScrollEnabled = false
        webView.isUserInteractionEnabled = false
        label.text = labelValue
        if let backColor = self.backgroundColor{
            self.view.backgroundColor = backColor
            self.webView.backgroundColor = backColor
        }
        if let textColor = self.textColor{
            self.label.textColor = textColor
        }
    }
    
    func config(label: String, gifName: String, backgroundColor: UIColor? = nil, textColor: UIColor? = nil){
        self.labelValue = label
        self.gifName = gifName
        self.backgroundColor = backgroundColor
        self.textColor = textColor
    }
    
}
