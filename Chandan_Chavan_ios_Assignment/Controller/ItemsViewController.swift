//
//  ItemsViewController.swift
//  Chandan_Chavan_ios_Assignment
//
//  Created by Rushikesh Nikam on 22/01/19.
//  Copyright © 2019 chandan chavan. All rights reserved.
//

import UIKit

class ItemsViewController: UIViewController {
    @IBOutlet weak var menuBarView: MenuTabsView!
    var pageController: UIPageViewController!
    var currentIndex: Int = 0
    var tabs = ["All","Category A","Category B"]
    override func viewDidLoad() {
        super.viewDidLoad()
 
        
        
        menuBarView.dataArray = tabs
        menuBarView.isSizeToFitCellsNeeded = true
        //menuBarView.collView.backgroundColor = UIColor.init(white: 0.97, alpha: 0.97)
        
        presentPageVCOnView()
        
        menuBarView.menuDelegate = self as! MenuBarDelegate
        pageController.delegate = self
        pageController.dataSource = self
        
        //For Intial Display
        menuBarView.collView.selectItem(at: IndexPath.init(item: 0, section: 0), animated: true, scrollPosition: .centeredVertically)
        pageController.setViewControllers([viewController(At: 0)!], direction: .forward, animated: true, completion: nil)
    }
    func presentPageVCOnView() {
        
        self.pageController = storyboard?.instantiateViewController(withIdentifier: "PageControllerVC") as! PageControllerVC
        self.pageController.view.frame = CGRect.init(x: 0, y: menuBarView.frame.maxY+50, width: self.view.frame.width, height: self.view.frame.height - menuBarView.frame.maxY)
        self.addChild(self.pageController)
        self.view.addSubview(self.pageController.view)
        self.pageController.didMove(toParent: self)
        
    }
    
    //Present ViewController At The Given Index
    
    func viewController(At index: Int) -> UIViewController? {
        
        if((self.menuBarView.dataArray.count == 0) || (index >= self.menuBarView.dataArray.count)) {
            return nil
        }
        
        let contentVC = storyboard?.instantiateViewController(withIdentifier: "ContentVC") as! ContentVC
        contentVC.strTitle = tabs[index]
        contentVC.pageIndex = index
        currentIndex = index
        return contentVC
        
    }
    
 
    
}


extension ItemsViewController: MenuBarDelegate {
    
    func menuBarDidSelectItemAt(menu: MenuTabsView, index: Int) {
        
        // If selected Index is other than Selected one, by comparing with current index, page controller goes either forward or backward.
        
        if index != currentIndex {
            
            if index > currentIndex {
                self.pageController.setViewControllers([viewController(At: index)!], direction: .forward, animated: true, completion: nil)
            }else {
                self.pageController.setViewControllers([viewController(At: index)!], direction: .reverse, animated: true, completion: nil)
            }
            
            menuBarView.collView.scrollToItem(at: IndexPath.init(item: index, section: 0), at: .centeredHorizontally, animated: true)
            
        }
        
    }
    
}


extension ItemsViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        var index = (viewController as! ContentVC).pageIndex
        
        if (index == 0) || (index == NSNotFound) {
            return nil
        }
        
        index -= 1
        return self.viewController(At: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        var index = (viewController as! ContentVC).pageIndex
        
        if (index == tabs.count) || (index == NSNotFound) {
            return nil
        }
        
        index += 1
        return self.viewController(At: index)
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        if finished {
            if completed {
                let cvc = pageViewController.viewControllers!.first as! ContentVC
                let newIndex = cvc.pageIndex
                menuBarView.collView.selectItem(at: IndexPath.init(item: newIndex, section: 0), animated: true, scrollPosition: .centeredVertically)
                menuBarView.collView.scrollToItem(at: IndexPath.init(item: newIndex, section: 0), at: .centeredHorizontally, animated: true)
            }
        }
        
    }
    
}



