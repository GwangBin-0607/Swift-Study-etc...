//
//  ViewController.swift
//  Terminate-DeInit
//
//  Created by Ahn on 2021/12/20.
//

import UIKit

class ViewController: UIViewController {

    init(){
        super.init(nibName: nil, bundle: nil)
        print("Third Init")
    }
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemCyan

        // Do any additional setup after loading the view.
    }
    deinit {
        print("dede")
    }
    

}

