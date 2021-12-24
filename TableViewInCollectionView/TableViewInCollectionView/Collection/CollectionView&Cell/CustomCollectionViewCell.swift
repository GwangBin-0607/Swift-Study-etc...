//
//  CustomCollectionViewCell.swift
//  TableViewInCollectionView
//
//  Created by Ahn on 2021/12/24.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    let tblview = UITableView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        tblview.backgroundColor = .systemBlue
        //tblview.contentInsetAdjustmentBehavior = .never
        self.contentView.addSubview(tblview)
        tblview.translatesAutoresizingMaskIntoConstraints = false
        tblview.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
        tblview.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        tblview.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
        tblview.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
        tblview.register(CustomTableViewCell.self, forCellReuseIdentifier: "CustomTableViewCellPage")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
