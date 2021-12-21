import Foundation

public struct PropertyCodable:Codable{
    let token:String
    let push:Int
    let toy:Int
    let industrial:Int
    let food:Int
    let oversea:Int
    let chemical:Int
    let car:Int
    let cosmetic:Int
    //let medicine:Int?
    
    let nickname:String?
    
    //optional ? -> 맞는 키값이 없으면 nil로 값이 생성된다.
    //! 또는 Not optional은 값이 없으면 오류가 발생한다.
}
