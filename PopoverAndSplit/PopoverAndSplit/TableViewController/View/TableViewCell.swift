//
//  TableViewCell.swift
//  PopoverAndSplit
//
//  Created by Ahn on 2021/11/25.
//

import UIKit

class TableViewCell: UITableViewCell {
    let shapeLayer=CAShapeLayer()
    let titleLabel=UILabel()
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        /*shapeLayer.frame = CGRect(x: Int(self.titleLabel.frame.minX-10.0), y: Int(titleLabel.frame.midY), width: 20, height: 20)
        shapeLayer.backgroundColor = UIColor.red.cgColor*/
        print(titleLabel.font.ascender)
        
    }
    //Layer는 Responder가 없다 -> 이벤트 처리 불가

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.layer.addSublayer(shapeLayer)
        self.contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: titleLabel, attribute: .leading, relatedBy: .equal, toItem: self.contentView, attribute: .centerX, multiplier: 0.5, constant: 0.0).isActive = true
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20.0)
        titleLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        
   
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
