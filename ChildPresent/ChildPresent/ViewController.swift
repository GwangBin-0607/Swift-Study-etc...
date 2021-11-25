//
//  ViewController.swift
//  ChildPresent
//
//  Created by Ahn on 2021/09/28.
//

import UIKit

class ViewController: UIViewController {

    let childView = UIView()
    let child = ChildViewController()
    var childViewCon:UINavigationController!
    let presentedViewCon = PresentedViewController()
    var animator:Animator?
    let presentBtn = UIButton()
    let consoleBtn = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        childViewCon = UINavigationController(rootViewController: child)
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
        
        
        self.animator = Animator()
        
        // Do any additional setup after loading the view.
    }
    @objc func consoleLog(){
        print("console")
        
    }
    @objc func presentAction(){
        print("action")
        //self.presentedViewCon.modalPresentationStyle = .fullScreen
       
        /*self.presentedViewCon.modalPresentationStyle = .custom
        self.presentedViewCon.transitioningDelegate = self
        self.present(presentedViewCon, animated: true, completion: nil)*/
        child.navigationController!.pushViewController(presentedViewCon, animated: true)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear===ViewController")
    }
    override func viewDidAppear(_ animated: Bool) {
        print("viewdidAppear===ViewController")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisAppear===ViewController")
    }
    override func viewDidDisappear(_ animated: Bool) {
        print("viewdidDisAppear===ViewController")
    }
    
}
extension ViewController:UIViewControllerTransitioningDelegate{
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        print("present")
        self.animator?.isPresent = true
        /*let testBProperty = testB()
        let testAProperty = testA()
        testBProperty.delegate = testAProperty*/
        return self.animator
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        print("dismiss")
        self.animator?.isPresent = false
        return self.animator
        
    }
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        print("method Call")
        let custom = CustomPresent(presentedViewController: presented, presenting: presenting)
        return custom
    }
    
            
}
class CustomPresent:UIPresentationController{
    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
        self.containerView?.backgroundColor = .blue
    }
    override func presentationTransitionWillBegin() {
        print("begin")
        let dimmingView = UIView()
        dimmingView.frame = CGRect(x: 10, y: 10, width: 20, height: 20)
        dimmingView.backgroundColor = .red
        dimmingView.alpha = 0.0
        self.containerView?.addSubview(dimmingView)
        
        let transitionCoordinator = self.presentingViewController.transitionCoordinator
        transitionCoordinator?.animate(alongsideTransition: {
            (context) in
            context.containerView.backgroundColor = .systemGreen
            dimmingView.alpha = 1.0
        }, completion: nil)
        
    }
    override func presentationTransitionDidEnd(_ completed: Bool) {
        print("end")
    }
    override func dismissalTransitionWillBegin() {
        print("dismiss-Begin")
    }
    override func dismissalTransitionDidEnd(_ completed: Bool) {
        print("dismiss-End")
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


