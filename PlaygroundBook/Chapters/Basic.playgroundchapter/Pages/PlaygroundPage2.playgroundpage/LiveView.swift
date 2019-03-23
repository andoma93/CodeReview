//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  Instantiates a live view and passes it to the PlaygroundSupport framework.
//

import UIKit
import PlaygroundSupport

// Instantiate a new instance of the live view from the book's auxiliary sources and pass it to PlaygroundSupport.
PlaygroundPage.current.liveView = instantiateAnimation(label: "Try removing comments to delivery a good code", gifName: "pcCoding", color: UIColor.white, textColor: UIColor.lightGray)
