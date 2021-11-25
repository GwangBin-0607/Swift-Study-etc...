//
//  SplitViewController.swift
//  PopoverAndSplit
//
//  Created by Ahn on 2021/11/25.
//

import UIKit

class SplitViewController: UISplitViewController {

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
        

        // Do any additional setup after loading the view.
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
