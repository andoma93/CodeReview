//
//  IntroVC.swift
//  Book_Sources
//
//  Created by Mario Monaco on 19/03/2019.
//

import Foundation
import UIKit
import PlaygroundSupport

@objc(Book_Sources_IntroVC)
public class IntroVC: UIPageViewController, PlaygroundLiveViewMessageHandler, PlaygroundLiveViewSafeAreaContainer {
    
    private var currentIndex: Int = 0
    
    fileprivate lazy var pages: [UIViewController] = {
        return [
            IntroPageVC.instantiate(message: "What is Code Review?\nCode Review is a software quality assurance activity in which one or several humans check a program mainly by viewing and reading parts of its source code, and they do so after implementation or as an interruption of implementation. (Wikipedia)\nCode reviews are usually performed to reach a combination of goals:", nameImage: "bookCode"),
            IntroPageVC.instantiate(message: "Finding defects", nameImage: "findBug"),
            IntroPageVC.instantiate(message: "Better code quality", nameImage: "codeQuality"),
            IntroPageVC.instantiate(message: "Learning/Knowledge transfer", nameImage: "knowledgeTransfer"),
            IntroPageVC.instantiate(message: "Increase sense of mutual responsibility", nameImage: "mutualResponsibility"),
            IntroPageVC.instantiate(message: "Complying to QA guidelines", nameImage: "qualityAssurance")
        ]
    }()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.delegate = self
        if let firstVC = pages.first{
            setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
        let pageControl = UIPageControl.appearance()
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        pageControl.currentPageIndicatorTintColor = UIColor.darkGray
        self.view.backgroundColor = .white
    }
    
    
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
    
    public func receive(_ message: PlaygroundValue) {
        // Implement this method to receive messages sent from the process running Contents.swift.
        // This method is *required* by the PlaygroundLiveViewMessageHandler protocol.
        // Use this method to decode any messages sent as PlaygroundValue values and respond accordingly.
    }
}

extension IntroVC : UIPageViewControllerDelegate{}

extension IntroVC : UIPageViewControllerDataSource{
    
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = pages.index(of: viewController) else { return nil }
        let previousIndex = viewControllerIndex - 1
        guard previousIndex >= 0 else { return nil }
        guard pages.count > previousIndex else { return nil }
        return pages[previousIndex]
    }
    
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?{
        guard let viewControllerIndex = pages.index(of: viewController) else { return nil }
        let nextIndex = viewControllerIndex + 1
        guard nextIndex < pages.count else { return nil }
        guard pages.count > nextIndex else { return nil }
        return pages[nextIndex]
    }
    
    public func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return self.pages.count
    }
    
    public func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return self.currentIndex
    }
    
}
