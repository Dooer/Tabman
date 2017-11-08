//
//  TabViewController.swift
//  Tabman-Example
//
//  Created by Merrick Sapsford on 04/01/2017.
//  Copyright © 2017 Merrick Sapsford. All rights reserved.
//

import UIKit
import Tabman
import Pageboy


class SamplePageProvider: TabPageProvider {
    
    var pages: [UIViewController]
    var barItems: [TabmanBar.Item]
    
    init() {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        var viewControllers = [UIViewController]()
        var items: [TabmanBar.Item] = []
        for index in 0 ..< 5 {
            let viewController = storyboard.instantiateViewController(withIdentifier: "ChildViewController") as! ChildViewController
            viewController.index = index + 1
            switch index {
            case 0:
                items.append(TabmanBar.Item(title: "Alla"))
                break
            case 1:
                items.append(TabmanBar.Item(title: "Osorterade"))
                break
            case 2:
                items.append(TabmanBar.Item(title: "Utgifter"))
                break
            case 3:
                items.append(TabmanBar.Item(title: "Utlägg"))
                break
            default:
                items.append(TabmanBar.Item(title: "Page No. \(index + 1)"))
            }
            
            viewControllers.append(viewController)
        }
        pages = viewControllers
        barItems = items
    }
    
    
}

protocol TabPageProvider {
    
    var pages: [UIViewController] { get set }
    var barItems: [TabmanBar.Item] { get set }
    
}

class TabViewController: TabmanViewController, PageboyViewControllerDataSource {
    
    var pageProvider: TabPageProvider = SamplePageProvider()
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        bar.location = .top
        bar.style = .scrollingButtonBar
        bar.appearance = DooerTabStyle.white
        bar.items = pageProvider.barItems
    }
    
    // MARK: PageboyViewControllerDataSource
    
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return pageProvider.pages.count
    }
    
    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        return pageProvider.pages[index]
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return .first
    }
    
    // MARK: PageboyViewControllerDelegate
    
    private var targetIndex: Int?
    
    override func pageboyViewController(_ pageboyViewController: PageboyViewController, willScrollToPageAt index: Int, direction: PageboyViewController.NavigationDirection, animated: Bool) {
        super.pageboyViewController(pageboyViewController, willScrollToPageAt: index, direction: direction, animated: animated)
        targetIndex = index
    }
}
