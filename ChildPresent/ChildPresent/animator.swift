//
//  animator.swift
//  ChildPresent
//
//  Created by Ahn on 2021/11/09.
//

import UIKit

class Animator: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 2.0
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        print(transitionContext.viewController(forKey: .from))
        let containerView = transitionContext.containerView
        guard let presentingViewCon = transitionContext.viewController(forKey: .from) as? ViewController,
        let presentedView = transitionContext.view(forKey: .to)
      else{
        print("error")
        return
      }
        
        print("animate")
        print(containerView)
        print(containerView.superview)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.topAnchor.constraint(equalTo: presentingViewCon.childViewCon.view.topAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: presentingViewCon.childViewCon.view.leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: presentingViewCon.childViewCon.view.trailingAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: presentingViewCon.childViewCon.view.bottomAnchor).isActive = true
        //containerView.backgroundColor = .systemPink
        
        containerView.addSubview(presentedView)
        print(presentedView.superview)
        presentedView.translatesAutoresizingMaskIntoConstraints = false
        presentedView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        presentedView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        presentedView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        presentedView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        
        transitionContext.completeTransition(true)
        
    }
    

}
