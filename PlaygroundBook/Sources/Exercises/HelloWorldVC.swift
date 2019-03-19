//
//  HelloWorldVC.swift
//  Book_Sources
//
//  Created by Mario Monaco on 19/03/2019.
//

import Foundation
import UIKit
import PlaygroundSupport

class HelloWorldVC : UIViewController, PlaygroundLiveViewMessageHandler, PlaygroundLiveViewSafeAreaContainer {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    public func receive(_ message: PlaygroundValue) {
        print(message)
    }
    
}
