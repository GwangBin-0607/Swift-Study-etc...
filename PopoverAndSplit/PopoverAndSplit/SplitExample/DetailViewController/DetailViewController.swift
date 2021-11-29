//
//  DetailViewController.swift
//  PopoverAndSplit
//
//  Created by Ahn on 2021/11/29.
//

import UIKit

class DetailViewController: UIViewController {
    override func loadView(){
        super.loadView()
        print("loadView -- DetailViewController")
        let subview = UIView()
        subview.backgroundColor = .systemYellow
        
        self.view = subview
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
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
