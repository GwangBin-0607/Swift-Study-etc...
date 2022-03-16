//
//  ViewController.swift
//  ChildPresent
//
//  Created by Ahn on 2021/09/28.
//

import UIKit

class ViewController: UIViewController, UIPopoverPresentationControllerDelegate {
    
    
    let childView = UIView()
    let child = ChildViewController()
    //var childViewCon:UINavigationController!
    let presentedViewCon = PresentedViewController()
    var animator:Animator?
    let presentBtn = UIButton()
    let consoleBtn = UIButton()
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = .white
        print("loadView===ViewController")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad===ViewController")
#if DEBUG
        //전처리문 -> 컴파일 이전에 미리 처리되는 문장.
        //Preprocessor
        print("im DEBUG")
#endif
#if release
        print("im release")
#endif
        
#if os(iOS)
        print("im iOS")
#endif
        //childViewCon = UINavigationController(rootViewController: child)
        self.view.addSubview(childView)
        childView.frame = CGRect(x: 0.0, y: 0.0, width: 200, height: 300)
        childView.backgroundColor = .systemBlue
        
        /*self.addChild(childViewCon)
         childViewCon.didMove(toParent: self)
         childViewCon.view.frame = childView.frame
         childView.addSubview(childViewCon.view)*/
        //child.preferredContentSize = CGSize(width: 500, height: 500)
        
        self.addChild(child)
        child.didMove(toParent: self)
        child.view.frame = childView.frame
        childView.addSubview(child.view)
        
        
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
    /*func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
     return .none
     //아이폰에  사용하려면 이 메서드 필요
     }*/
    
    @objc func consoleLog(){
        print("console")
        
        /* self.presentedViewCon.modalPresentationStyle = .popover
         guard let vc = self.presentedViewCon.popoverPresentationController else{
         return
         }
         print(self.presentedViewCon.popoverPresentationController)
         self.presentedViewCon.preferredContentSize = CGSize(width: 30, height: 30)
         vc.delegate = self
         
         vc.sourceView?.backgroundColor = .red
         vc.sourceView = self.childView
         vc.sourceRect = childView.bounds
         vc.permittedArrowDirections = .up
         self.present(presentedViewCon, animated: true, completion: nil)*/
    }
    @objc func presentAction(){
        print("action")
        //self.presentedViewCon.modalPresentationStyle = .fullScreen
        
        
        self.presentedViewCon.modalPresentationStyle = .custom
        self.presentedViewCon.transitioningDelegate = self
        self.present(presentedViewCon, animated: true, completion: nil)
        
        
        //child.navigationController!.pushViewController(presentedViewCon, animated: true)
    }
    override func viewDidLayoutSubviews() {
        print("viewDidLayoutSubviews===ViewController")
        print(self.child.view.frame)
        print(self.child.preferredContentSize)
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

/*class popCustom:UIPopoverPresentationController{
 override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
 super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
 }
 }*/
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
     let hi = UIPopoverPresentationController(presentedViewController: presented, presenting: presenting)
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


