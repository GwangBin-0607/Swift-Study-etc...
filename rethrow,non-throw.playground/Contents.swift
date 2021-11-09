import Foundation
///rethrow

//https://gwangyonglee.tistory.com/53
enum MyError: Error {
    case cannotDivide
}

func divideNumber(first: Float, second: Float) throws -> Float {
    if second == 0 {
        throw MyError.cannotDivide
    }
    return first/second
}

func calculateFunction(function: (Float, Float) throws -> Float) rethrows {
    print(try function(2, 0))
}

do {
    try calculateFunction(function: divideNumber)
} catch let error as MyError {
    switch error {
    case .cannotDivide:
         print("0으로 나누었다.")
    }
}


///Decoder
class testDecoder:Decoder{
    var codingPath: [CodingKey] = []
    
    var userInfo: [CodingUserInfoKey : Any] = [:]
    
    func container<Key>(keyedBy type: Key.Type) throws -> KeyedDecodingContainer<Key> where Key : CodingKey {
        <#code#>
    }
    
    func unkeyedContainer() throws -> UnkeyedDecodingContainer {
        <#code#>
    }
    
    func singleValueContainer() throws -> SingleValueDecodingContainer {
        <#code#>
    }
    
    
}
struct Human:Codable{
    
    var name:String?
    var height:Float?
    init(from decoder: Decoder) throws {
           let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try? values.decode(String.self, forKey: .name)
        height = try? values.decode(Float.self, forKey: .height)
       }
}
/*let jsonDecode = JSONDecoder()
let data = Data()

let jsonData = try? jsonDecode.decode(Human.self, from: data)*/
let decoder = testDecoder()
try Human(from: decoder)


