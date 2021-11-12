//
//  ViewController.swift
//  ChildPresent
//
//  Created by Ahn on 2021/09/28.
//

import UIKit

class ViewController: UIViewController {

    let childView = UIView()
    let childViewCon = ChildViewController()
    let presentedViewCon = PresentedViewController()
    var animator:UIViewControllerAnimatedTransitioning?
    let presentBtn = UIButton()
    let consoleBtn = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(childView)
        childView.frame = CGRect(x: 0.0, y: 0.0, width: 200, height: 300)
        childView.backgroundColor = .systemBlue
        self.addChild(childViewCon)
        childViewCon.didMove(toParent: self)
        childViewCon.view.frame = childView.frame
        childView.addSubview(childViewCon.view)
        
        self.view.addSubview(presentBtn)
        presentBtn.frame = CGRect(x: 250, y: 20.0, width: 60.0, height: 60.0)
        presentBtn.backgroundColor = .systemPink
        presentBtn.addTarget(self, action: #selector(presentAction), for: .touchUpInside)
        
        self.view.addSubview(consoleBtn)
        consoleBtn.frame = CGRect(x: 250, y: 520.0, width: 60.0, height: 60.0)
        consoleBtn.backgroundColor = .systemPink
        consoleBtn.addTarget(self, action: #selector(consoleLog), for: .touchUpInside)
        
        // Do any additional setup after loading the view.
    }
    @objc func consoleLog(){
        print("console")
    }
    @objc func presentAction(){
        print("action")
        //self.presentedViewCon.modalPresentationStyle = .fullScreen
       
        self.presentedViewCon.modalPresentationStyle = .custom
        self.presentedViewCon.transitioningDelegate = self
        self.present(presentedViewCon, animated: true, completion: nil)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewdidAppear===ViewController")
    }
}
extension ViewController:UIViewControllerTransitioningDelegate{
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        print("present")
        self.animator = Animator()
        /*let testBProperty = testB()
        let testAProperty = testA()
        testBProperty.delegate = testAProperty*/
        return self.animator
    }
}
/*class testA:UIView{
    
}
class testB:testA{
    
}
protocol testAProtocol:UIView {
    
}
class testB:testAProtocol{
    
}*/
/*protocol delegateTest:NSObject {
    
}
class testA:NSObject,delegateTest{
    
}
class testB{
    weak var delegate:delegateTest?
}*/


