//
//  ViewController.swift
//  PopoverAndSplit
//
//  Created by Ahn on 2021/11/25.
//

import UIKit

class ViewController: UIViewController {
    init() {
        super.init(nibName: nil, bundle: nil)
        print("init -- ViewController")
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        print("viewcontroller Bundle")
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        print("\(coder)====ViewController")
        //fatalError("init(coder:) has not been implemented")
    }
    deinit {
        print("deinit -- ViewController")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        // Do any additional setup after loading the view.
    }


}

