//
//  ChildViewController.swift
//  ChildPresent
//
//  Created by Ahn on 2021/09/28.
//

import UIKit

class ChildViewController: UIViewController {

    let lineView = UIView()
    var animator:UIViewControllerAnimatedTransitioning?
    override func loadView() {
        super.loadView()
        let subview = UIView()
        subview.backgroundColor = .systemYellow
        
        subview.addSubview(lineView)
        lineView.backgroundColor = .systemOrange
        lineView.translatesAutoresizingMaskIntoConstraints = false
        lineView.centerYAnchor.constraint(equalTo: subview.centerYAnchor).isActive = true
        lineView.leadingAnchor.constraint(equalTo: subview.leadingAnchor).isActive = true
        lineView.trailingAnchor.constraint(equalTo: subview.trailingAnchor).isActive = true
        NSLayoutConstraint(item: lineView, attribute: .height, relatedBy: .equal, toItem: subview, attribute: .height, multiplier: 0.15, constant: 0.0).isActive = true
        let tapTest = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        lineView.addGestureRecognizer(tapTest)
        
        self.view = subview
    }
    @objc func tapAction(){
        print("child Tap!!")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       

        // Do any additional setup after loading the view.
    }
    override func didMove(toParent parent: UIViewController?) {
        super.didMove(toParent: parent)
        print(parent)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear===ChildViewController")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewdidDisAppear===ChildViewController")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisAppear===ChildViewController")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewdidAppear===ChildViewController")
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
