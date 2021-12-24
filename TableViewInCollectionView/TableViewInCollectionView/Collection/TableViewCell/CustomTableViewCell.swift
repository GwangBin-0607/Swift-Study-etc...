//
//  CustomTableViewCell.swift
//  TableViewInCollectionView
//
//  Created by Ahn on 2021/12/24.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    let customLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(customLabel)
        customLabel.translatesAutoresizingMaskIntoConstraints = false
        customLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10.0).isActive = true
        customLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        customLabel.font = UIFont.boldSystemFont(ofSize: 14.0)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
