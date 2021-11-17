//
//  Model.swift
//  insertCell_VS_reloadData
//
//  Created by Ahn on 2021/11/17.
//

import Foundation

struct Model{
    static var modelList:[String]?
    static var count:Int{
        get{
            guard let count = Model.modelList?.count else {
                return 0
            }
            return count
        }
    }
}
