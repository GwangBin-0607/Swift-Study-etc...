//
//  SplitViewController.swift
//  PopoverAndSplit
//
//  Created by Ahn on 2021/11/25.
//

import UIKit

class SplitViewController: UISplitViewController {
   
   
    /*override var viewControllers: [UIViewController]{
        get{
            print(firstViewConroller)
            print(secondViewController)
            return [firstViewConroller,secondViewController]
        }set{
            
        }
    }*/
    override init(style: UISplitViewController.Style) {
        super.init(style: style)
        print("init Style -- SplitViewController")
    }
    init() {
        super.init(nibName: nil, bundle: nil)
        print("init -- SplitViewController")
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        print("\(coder)====SplitViewController")
    }
    deinit {
        print("deinit--SplitViewController")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(timerAction), userInfo: nil, repeats: false)
        

        // Do any additional setup after loading the view.
    }
    @objc func timerAction(){
        print("timer Action")
        self.view.layoutIfNeeded()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
class TestClassA{
    var name:Int?{
        get{
            return 150
        }set{
            
        }
    }
    var closure:(()->Void)?
    weak var friend:TestClassA?
    var image:UIImageView = {
        let mainImageView = UIImageView()
        mainImageView.tag = 150
        return mainImageView
    }()
    init(){
        
    }
}
class TestClassB:TestClassA{
    override var name: Int?{
        get{
            return 200
        }set{
            
        }
    }
}
