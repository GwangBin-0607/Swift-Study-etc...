//
//  CustomView.swift
//  test
//
//  Created by Ahn on 2021/12/28.
//

import UIKit

class CustomView: UIView {

    let viewId:String
    let leftView:UIView
    let rigtView:UIView
    let topView:UIView
    let bottomView:UIView
    override init(frame: CGRect) {
        viewId = "gwangbin"
        leftView = UIView()
        leftView.backgroundColor = .systemBlue
        rigtView = UIView()
        rigtView.backgroundColor = .systemRed
        topView = UIView()
        topView.backgroundColor = .systemGray
        bottomView = UIView()
        bottomView.backgroundColor = .systemPink
        super.init(frame: frame)
        self.addSubview(leftView)
        leftView.translatesAutoresizingMaskIntoConstraints = false
        leftView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        leftView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5.0).isActive = true
        NSLayoutConstraint(item: leftView, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 0.25, constant: 0.0).isActive = true
        leftView.heightAnchor.constraint(equalTo: leftView.widthAnchor).isActive = true
        
        self.addSubview(rigtView)
        rigtView.translatesAutoresizingMaskIntoConstraints = false
        rigtView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        rigtView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5.0).isActive = true
        NSLayoutConstraint(item: rigtView, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 0.25, constant: 0.0).isActive = true
        rigtView.heightAnchor.constraint(equalTo: rigtView.widthAnchor).isActive = true
        
        self.addSubview(topView)
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        topView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5.0).isActive = true
        NSLayoutConstraint(item: topView, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 0.25, constant: 0.0).isActive = true
        topView.heightAnchor.constraint(equalTo: topView.widthAnchor).isActive = true
        
        self.addSubview(bottomView)
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        bottomView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5.0).isActive = true
        NSLayoutConstraint(item: bottomView, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 0.25, constant: 0.0).isActive = true
        bottomView.heightAnchor.constraint(equalTo: bottomView.widthAnchor).isActive = true
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
