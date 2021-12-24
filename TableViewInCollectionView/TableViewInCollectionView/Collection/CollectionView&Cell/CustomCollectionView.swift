//
//  CustomCollectionView.swift
//  TableViewInCollectionView
//
//  Created by Ahn on 2021/12/24.
//

import UIKit

class CustomCollectionView: UICollectionView {
    let name:String!
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        name = "@@"
        super.init(frame: frame, collectionViewLayout: layout)
        //name = "@@"
        self.backgroundColor = .systemYellow
        self.isPagingEnabled = true
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
