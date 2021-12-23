//
//  animator.swift
//  ChildPresent
//
//  Created by Ahn on 2021/11/09.
//

import UIKit
//issue
class Animator: NSObject, UIViewControllerAnimatedTransitioning {
    var firstViewCon:UIViewController!
    var presentViewCon:ViewController!
    var isPresent:Bool!
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 2.0
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
       
        if isPresent{
            firstViewCon = transitionContext.viewController(forKey: .to)
            //print(transitionContext.viewController(forKey: .from))
            let containerView = transitionContext.containerView
            guard let presentedViewCon = transitionContext.viewController(forKey: .from) as? ViewController,
            let presentedView = transitionContext.view(forKey: .to)
          else{
            print("error")
            return
          }
            presentViewCon = presentedViewCon
            print(containerView.subviews)
            print(containerView.superview)
            print(containerView.superview?.superview)
            //print("animate")
            //print(containerView)
            //print(containerView.superview)
            containerView.translatesAutoresizingMaskIntoConstraints = false
            containerView.topAnchor.constraint(equalTo: presentedViewCon.child.view.topAnchor).isActive = true
            containerView.leadingAnchor.constraint(equalTo: presentedViewCon.child.view.leadingAnchor).isActive = true
            containerView.trailingAnchor.constraint(equalTo: presentedViewCon.child.view.trailingAnchor).isActive = true
            containerView.bottomAnchor.constraint(equalTo: presentedViewCon.child.view.bottomAnchor).isActive = true
            //containerView.backgroundColor = .systemPink
            
            containerView.addSubview(presentedView)
            presentedView.alpha = 0.0
            //print(presentedView.superview)
            presentedView.translatesAutoresizingMaskIntoConstraints = false
            presentedView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
            presentedView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
            presentedView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
            presentedView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
            UIView.animate(withDuration: 2.0, animations: {
                presentedView.alpha = 1.0
            },completion: {
                (finish) in
                if finish{
                    transitionContext.completeTransition(true)
                }
            })
        }else{
            firstViewCon = transitionContext.viewController(forKey: .from)
            guard let presentedViewCon = transitionContext.viewController(forKey: .to) as? ViewController,
            let presentedView = transitionContext.view(forKey: .from)
          else{
            print("error")
            return
          }
            //print(firstViewCon.view.frame) // Reference Type 이기 때문에 참조된 값의 프레임을 갖고 온다 따라서 Present시에 잡혔던 프레임 값이 그대로 갖고온다.->참조카운트는 한번더봐야겠음 ㅋ
            presentViewCon = presentedViewCon
            UIView.animate(withDuration: 2.0, animations: {
                presentedView.alpha = 0.0
            },completion: {
                (finish) in
                if finish{
                    transitionContext.completeTransition(true)
                }
            })
        }
        
        
        
        
    }
   
    

}

//해결
//class Animator: NSObject, UIViewControllerAnimatedTransitioning {
//    var firstViewCon:UIViewController!
//    var presentViewCon:ViewController!
//    var isPresent:Bool!
//    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
//        return 2.0
//    }
//
//    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
//
//        if isPresent{
//            firstViewCon = transitionContext.viewController(forKey: .to)
//            //print(transitionContext.viewController(forKey: .from))
//            let containerView = transitionContext.containerView
//            guard let presentedViewCon = transitionContext.viewController(forKey: .from) as? ViewController,
//            let presentedView = transitionContext.view(forKey: .to)
//          else{
//            print("error")
//            return
//          }
//            presentViewCon = presentedViewCon
//
//            //print("animate")
//            //print(containerView)
//            //print(containerView.superview)
//            containerView.translatesAutoresizingMaskIntoConstraints = false
//            containerView.topAnchor.constraint(equalTo: presentedViewCon.child.view.topAnchor).isActive = true
//            containerView.leadingAnchor.constraint(equalTo: presentedViewCon.child.view.leadingAnchor).isActive = true
//            containerView.trailingAnchor.constraint(equalTo: presentedViewCon.child.view.trailingAnchor).isActive = true
//            containerView.bottomAnchor.constraint(equalTo: presentedViewCon.child.view.bottomAnchor).isActive = true
//            //containerView.backgroundColor = .systemPink
//
//            firstViewCon.beginAppearanceTransition(true, animated: true)
//            presentViewCon.child.beginAppearanceTransition(false, animated: true)
//            containerView.addSubview(presentedView)
//            presentedView.alpha = 0.0
//            //print(presentedView.superview)
//            presentedView.translatesAutoresizingMaskIntoConstraints = false
//            presentedView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
//            presentedView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
//            presentedView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
//            presentedView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
//            UIView.animate(withDuration: 2.0, animations: {
//                presentedView.alpha = 1.0
//            },completion: {
//                (finish) in
//                if finish{
//                    transitionContext.completeTransition(true)
//                }
//            })
//        }else{
//            firstViewCon = transitionContext.viewController(forKey: .from)
//            guard let presentedViewCon = transitionContext.viewController(forKey: .to) as? ViewController,
//            let presentedView = transitionContext.view(forKey: .from)
//          else{
//            print("error")
//            return
//          }
//            //print(firstViewCon.view.frame) // Reference Type 이기 때문에 참조된 값의 프레임을 갖고 온다 따라서 Present시에 잡혔던 프레임 값이 그대로 갖고온다.->참조카운트는 한번더봐야겠음 ㅋ
//            presentViewCon = presentedViewCon
//            firstViewCon.beginAppearanceTransition(false, animated: true)
//            presentViewCon.child.beginAppearanceTransition(true, animated: true)
//            UIView.animate(withDuration: 2.0, animations: {
//                presentedView.alpha = 0.0
//            },completion: {
//                (finish) in
//                if finish{
//                    transitionContext.completeTransition(true)
//                }
//            })
//        }
//
//
//
//
//    }
//    func animationEnded(_ transitionCompleted: Bool) {
//
//        if transitionCompleted{
//            print("end!!")
//            firstViewCon.endAppearanceTransition()//!!!!!!!!!애는 없어도 되네? apple 공식문서에 ChildView에만 알려주라고 했다...
//            presentViewCon.child.endAppearanceTransition()
//        }
//
//    }
//
//
//}
