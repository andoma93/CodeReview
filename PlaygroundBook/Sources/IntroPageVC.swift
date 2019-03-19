//
//  IntroPageVC.swift
//  Book_Sources
//
//  Created by Mario Monaco on 19/03/2019.
//

import Foundation
import UIKit
import PlaygroundSupport

public class IntroPageVC: UIViewController, PlaygroundLiveViewMessageHandler, PlaygroundLiveViewSafeAreaContainer {
    
    @IBOutlet weak var labelMessage: UILabel!
    private var message : String!
    
    /*
     public func liveViewMessageConnectionOpened() {
     // Implement this method to be notified when the live view message connection is opened.
     // The connection will be opened when the process running Contents.swift starts running and listening for messages.
     }
     */
    
    /*
     public func liveViewMessageConnectionClosed() {
     // Implement this method to be notified when the live view message connection is closed.
     // The connection will be closed when the process running Contents.swift exits and is no longer listening for messages.
     // This happens when the user's code naturally finishes running, if the user presses Stop, or if there is a crash.
     }
     */
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.labelMessage.text = message
    }
    
    class func instantiate(message: String) -> IntroPageVC{
        let vc = UIStoryboard(name: "LiveView", bundle: nil).instantiateViewController(withIdentifier: "introPageVCIdentifier") as! IntroPageVC
        vc.message = message
        return vc
    }
    
    public func receive(_ message: PlaygroundValue) {
        // Implement this method to receive messages sent from the process running Contents.swift.
        // This method is *required* by the PlaygroundLiveViewMessageHandler protocol.
        // Use this method to decode any messages sent as PlaygroundValue values and respond accordingly.
    }
}
