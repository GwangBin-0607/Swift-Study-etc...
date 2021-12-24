//
//  CollectionModelServer.swift
//  TableViewInCollectionView
//
//  Created by Ahn on 2021/12/24.
//

import Foundation

struct CollectionModelServer{
    var firstCollectionModel:[CollectionModel]?
    var secondCollectionModel:[CollectionModel]?
    var thirdCollectionModel:[CollectionModel]?
    var fourthCollectionModel:[CollectionModel]?
    
    init() {
        
    }
    
    mutating func requestData(_ completion:@escaping ()->Void){
        firstCollectionModel = [CollectionModel(number: "1"),CollectionModel(number: "1"),CollectionModel(number: "1"),CollectionModel(number: "1"),CollectionModel(number: "1"),CollectionModel(number: "1"),CollectionModel(number: "1"),CollectionModel(number: "1"),CollectionModel(number: "1"),CollectionModel(number: "1"),CollectionModel(number: "1")]
        secondCollectionModel = [CollectionModel(number: "2"),CollectionModel(number: "2"),CollectionModel(number: "2"),CollectionModel(number: "2"),CollectionModel(number: "2"),CollectionModel(number: "2"),CollectionModel(number: "2"),CollectionModel(number: "2"),CollectionModel(number: "2"),CollectionModel(number: "2")]
        thirdCollectionModel = [CollectionModel(number: "3"),CollectionModel(number: "3"),CollectionModel(number: "3"),CollectionModel(number: "3"),CollectionModel(number: "3"),CollectionModel(number: "3"),CollectionModel(number: "3"),CollectionModel(number: "3"),CollectionModel(number: "3"),CollectionModel(number: "3")]
        fourthCollectionModel = [CollectionModel(number: "4"),CollectionModel(number: "4"),CollectionModel(number: "4"),CollectionModel(number: "4"),CollectionModel(number: "4"),CollectionModel(number: "4"),CollectionModel(number: "4"),CollectionModel(number: "4"),CollectionModel(number: "4"),CollectionModel(number: "4")]
        completion()
    }
}
