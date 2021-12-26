struct S
{
    var a:Int,
        b:Int
    
    mutating
    func withASetToZero(_ body:() -> ())
    {
        self.a = 0
        body()
    }
    
    mutating
    func foo()
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
