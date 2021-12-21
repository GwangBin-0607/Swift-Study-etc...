import UIKit
import Foundation

var greeting = "Hello, playground"

var property:[PropertyCodable]?
let url = URL(string: "http://localhost:80/tokenList")
let request = URLRequest(url: url!)

URLSession.shared.dataTask(with: request, completionHandler: {
    (data,response,err) in
    guard let data = data else{
        return
    }
    let decode = JSONDecoder()
    do {
        property = try decode.decode([PropertyCodable].self, from: data)
    }catch{
        print(error)
    }
    print( property)
}).resume()
