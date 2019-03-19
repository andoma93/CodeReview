//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  Provides supporting functions for setting up a live view.
//

import UIKit
import PlaygroundSupport

public func showAlert(_ message: String){
    let alertController = UIAlertController(title: "Message", message: message, preferredStyle: .actionSheet)
    alertController.addAction(UIAlertAction(title: "Ok", style: .default))
    let viewController = PlaygroundPage.current.liveView as? UIViewController
    viewController?.present(alertController, animated: true, completion: nil)
}
/// Instantiates a new instance of a live view.
///
/// By default, this loads an instance of `LiveViewController` from `LiveView.storyboard`.
public func instantiateWelcome() -> PlaygroundLiveViewable {
    let storyboard = UIStoryboard(name: "LiveView", bundle: nil)
    guard let viewController = storyboard.instantiateInitialViewController() else {
        fatalError("LiveView.storyboard does not have an initial scene; please set one or update this function")
    }
    guard let liveViewController = viewController as? LiveViewController else {
        fatalError("LiveView.storyboard's initial scene is not a LiveViewController; please either update the storyboard or this function")
    }
    return liveViewController
}

public func instantiateIntro() -> PlaygroundLiveViewable {
    let storyboard = UIStoryboard(name: "LiveView", bundle: nil)
    let viewController = storyboard.instantiateViewController(withIdentifier: "introIdentifier")
    guard let liveViewController = viewController as? IntroVC else {
        fatalError("LiveView.storyboard's initial scene is not a LiveViewController; please either update the storyboard or this function")
    }
    return liveViewController
}

public func instantiateHelloWorld() -> PlaygroundLiveViewable {
    let storyboard = UIStoryboard(name: "Exercises", bundle: nil)
    let viewController = storyboard.instantiateViewController(withIdentifier: "helloWorldIdentifier")
    guard let liveViewController = viewController as? HelloWorldVC else {
        fatalError("LiveView.storyboard's initial scene is not a HelloWorldVC; please either update the storyboard or this function")
    }
    return liveViewController
}

