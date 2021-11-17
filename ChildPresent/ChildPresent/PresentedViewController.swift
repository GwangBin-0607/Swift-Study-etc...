//
//  PresentedViewController.swift
//  ChildPresent
//
//  Created by Ahn on 2021/09/28.
//

import UIKit

class PresentedViewController: UIViewController {
    let consoleBtn = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemTeal
        self.view.addSubview(consoleBtn)
        consoleBtn.frame = CGRect(x: 100, y: 100.0, width: 60.0, height: 60.0)
        consoleBtn.backgroundColor = .systemPink
        consoleBtn.addTarget(self, action: #selector(consoleLog), for: .touchUpInside)
        // Do any additional setup after loading the view.
    }
    
    @objc func consoleLog(){
        print("console")
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("viewdidAppear===PresentedViewController")
    }
    override func viewDidDisappear(_ animated: Bool) {
        print("viewdidDisAppear===PresentedViewController")
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
class A{
    init(h:String){
        
    }
}
class B:A{
    override init(h: String) {
        super.init(h: h)
    }
    init(b:String) {
        super.init(h: b)
       
    }
}
class C:UIViewController{
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
class D:UITableViewController{
  
    override init(style: UITableView.Style) {
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
class E:B{
    override init(h: String) {
        super.init(b: h)
    }
}
