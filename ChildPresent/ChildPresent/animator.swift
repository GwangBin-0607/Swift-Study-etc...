//
//  animator.swift
//  ChildPresent
//
//  Created by Ahn on 2021/11/09.
//

import UIKit

class Animator: NSObject, UIViewControllerAnimatedTransitioning {
    var firstViewCon:UIViewController?
    var presentViewCon:ViewController?
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 2.0
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        firstViewCon = transitionContext.viewController(forKey: .to)
        print(transitionContext.viewController(forKey: .from))
        let containerView = transitionContext.containerView
        guard let presentedViewCon = transitionContext.viewController(forKey: .from) as? ViewController,
        let presentedView = transitionContext.view(forKey: .to)
      else{
        print("error")
        return
      }
        presentViewCon = presentedViewCon
        
        print("animate")
        print(containerView)
        print(containerView.superview)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.topAnchor.constraint(equalTo: presentedViewCon.childViewCon.view.topAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: presentedViewCon.childViewCon.view.leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: presentedViewCon.childViewCon.view.trailingAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: presentedViewCon.childViewCon.view.bottomAnchor).isActive = true
        //containerView.backgroundColor = .systemPink
        
        firstViewCon?.beginAppearanceTransition(true, animated: true)
        presentViewCon?.childViewCon.beginAppearanceTransition(false, animated: true)
        containerView.addSubview(presentedView)
        presentedView.alpha = 0.0
        print(presentedView.superview)
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
        
        
        
    }
    func animationEnded(_ transitionCompleted: Bool) {
        print("end!!")
        if transitionCompleted{
            firstViewCon?.endAppearanceTransition()
            presentViewCon?.childViewCon.endAppearanceTransition()
        }
        
    }
    

}
