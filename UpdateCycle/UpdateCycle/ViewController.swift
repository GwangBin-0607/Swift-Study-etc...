//
//  ViewController.swift
//  UpdateCycle
//
//  Created by Ahn on 2021/11/19.
//

import UIKit

class ViewController: UIViewController {
    let subview = UIScrollView()
    let categoryView = UIView()
    let categoryListView = UIView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(subview)
        subview.backgroundColor = .systemYellow
        subview.translatesAutoresizingMaskIntoConstraints = false
        subview.frameLayoutGuide.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        subview.frameLayoutGuide.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        subview.frameLayoutGuide.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        subview.frameLayoutGuide.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        subview.contentSize = CGSize(width: 800, height: 800)
        
        subview.addSubview(categoryView)
        categoryView.backgroundColor = .systemPink
        categoryView.translatesAutoresizingMaskIntoConstraints = false
        /*categoryView.centerYAnchor.constraint(equalTo: subview.contentLayoutGuide.centerYAnchor).isActive = true
        categoryView.centerXAnchor.constraint(equalTo: subview.contentLayoutGuide.centerXAnchor).isActive = true*/
        categoryView.topAnchor.constraint(equalTo: subview.contentLayoutGuide.topAnchor).isActive = true
        categoryView.leadingAnchor.constraint(equalTo: subview.contentLayoutGuide.leadingAnchor).isActive = true
        categoryView.trailingAnchor.constraint(equalTo: subview.contentLayoutGuide.trailingAnchor).isActive = true
        categoryView.bottomAnchor.constraint(equalTo: subview.contentLayoutGuide.bottomAnchor).isActive = true
        categoryView.widthAnchor.constraint(equalToConstant: 300.0).isActive = true
        categoryView.heightAnchor.constraint(equalToConstant: 300.0).isActive = true
        
        subview.addSubview(categoryListView)
        categoryListView.backgroundColor = .systemBlue
        categoryListView.translatesAutoresizingMaskIntoConstraints = false
        categoryListView.centerYAnchor.constraint(equalTo: subview.contentLayoutGuide.centerYAnchor).isActive = true
        categoryListView.centerXAnchor.constraint(equalTo: subview.contentLayoutGuide.centerXAnchor).isActive = true
        categoryListView.widthAnchor.constraint(equalToConstant: 100.0).isActive = true
        categoryListView.heightAnchor.constraint(equalToConstant: 100.0).isActive = true
        
        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }


}

