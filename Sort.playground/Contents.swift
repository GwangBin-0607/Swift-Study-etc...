//: A UIKit based Playground for presenting user interface
  
import UIKit

print("sort")
let array = ["asd","asdw","rtrede","awdjiawd"]
let resultArray = array.sorted(by: {$0>$1})
let dic = ["22":45,"222":56,"2222":456,"22322":456]
let resultDic = dic.sorted(by: {$0.key<$1.key})
print(dic)
print(resultDic)
print(resultArray)
//func af(by:(String,String) throws -> Bool){
//
//}
//af(by: <#T##(String, String) throws -> Bool#>)
