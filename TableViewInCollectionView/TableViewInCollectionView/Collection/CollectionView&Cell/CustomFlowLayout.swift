//
//  CustomFlowLayout.swift
//  TableViewInCollectionView
//
//  Created by Ahn on 2021/12/24.
//

import UIKit

class CustomFlowLayout: UICollectionViewFlowLayout {
    
    override init() {
        super.init()
        self.scrollDirection = .horizontal
        
        
    }
    override func prepare() {
        super.prepare()
        guard let colview = collectionView else{
            return
        }
        minimumLineSpacing = .zero
        minimumInteritemSpacing = .zero
        itemSize = CGSize(width: colview.frame.width, height: colview.frame.height)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
/*class test{
    init() {
        
    }
    init?(test:String) {
        
    }
}
class testTwo:test{
    override init() {
        super.init()
    }
}*/
