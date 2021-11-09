import Foundation

enum TestError : Error {
     case outOfRange                      // 1
     case invalidInput(testNum : Int)     // 2
}
func printNumber(_ number: Int) throws -> Int {    // 1
   var text = 222
  
   guard number > 100 else {
    //return 0
       throw TestError.outOfRange                // 2
   }
    print(text)
   return text
}
let resultNumber = try? printNumber(-20) //-> 에러나면 nil,종료 x -> 에러가 있을 수 있다 있으면 nil로 반환하겠다
print(resultNumber)
print("FirstCase")
//let resultNumber = try printNumber(-20) 
//print(resultNumber)//-> 에러나면 강제 종료
//let resultNumberOne = try printNumber(-20) //
//let resultNumberTwo = try! printNumber(-20) //
//let resultNumberThree = try? printNumber(-20) //

do {
   let resultNumber = try printNumber(120)
    print(resultNumber)
} catch {
   print("123")
   print(error)
} // -> 에러 나면 에러 출력,강제종료 x
print("SecondCase")

class testA{
    var testNumber:Int!
    
}
class testB:testA{
    
    
}
let testAValue = testA()
let testBValue = testB()
let test = testAValue as? testB
