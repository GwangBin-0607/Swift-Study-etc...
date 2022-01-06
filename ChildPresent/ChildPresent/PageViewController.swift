//
//  PageViewController.swift
//  ChildPresent
//
//  Created by Ahn on 2022/01/06.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    let ChildViewCon = ChildViewController()
    let viewCon = ViewController()
    lazy var vcs = [ChildViewCon,viewCon]
     init(transitionStyle: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation){
        super.init(transitionStyle: transitionStyle, navigationOrientation: navigationOrientation, options: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.dataSource = self
        self.setViewControllers([self.vcs[0]], direction: .forward, animated: true, completion: nil)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension PageViewController{
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = vcs.firstIndex(of: viewController)
             else { return nil }

         if index < 1 {
             return nil
         } else {
             return vcs[index - 1]
         }
     }

     public func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
         guard let index = vcs.firstIndex(of: viewController)
             else { return nil }

         if index + 1 >= vcs.count {
             return nil
         } else {
             return vcs[index + 1]
         }
     }
}
