import Foundation
import UIKit

public class ClassType{
    let name:String!
    public init(Name:String) {
        self.name = Name
    }
  
    public class SubClassType{ //inner Class
        public init() {
            
        }
    }
    public func out(){
        print(self.name)
    }
}

