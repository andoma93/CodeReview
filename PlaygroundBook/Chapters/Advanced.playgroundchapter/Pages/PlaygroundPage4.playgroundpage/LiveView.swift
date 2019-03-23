//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  Instantiates a live view and passes it to the PlaygroundSupport framework.
//

import UIKit
import PlaygroundSupport

// Instantiate a new instance of the live view from the book's auxiliary sources and pass it to PlaygroundSupport.
PlaygroundPage.current.liveView = instantiateAnimation(label: "Always write your delegate's methods in extensions", gifName: "apple", color: UIColor.white, textColor: UIColor.lightGray)
