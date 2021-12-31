class A{
    func test(){
        print("test A")
    }
}
class B:A{
    override func test() {
        //super.test()
        print("test B")
    }
}
let bProperty = B()
bProperty.test()




struct S
{
    var a:Int,
        b:Int
    
    mutating func withASetToZero(_ body:() -> ())
    {
        self.a = 0
        body()
    }
    
    mutating func foo()
    {
        self.withASetToZero
        {
            // error at compile time
            self.b = 1
        }
    }
}

var s:S = .init(a: 1, b: 2)

s.withASetToZero
{
    // error at run time
    s.b = 1
}
