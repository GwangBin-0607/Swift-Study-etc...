//
//  SecondViewController.swift
//  ChildPresent
//
//  Created by Ahn on 2021/12/08.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white//StoryBoard가 없으면 해줘야함

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear===SecondViewController")
    }
    override func viewDidAppear(_ animated: Bool) {
        print("viewdidAppear===SecondViewController")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisAppear===SecondViewController")
    }
    override func viewDidDisappear(_ animated: Bool) {
        print("viewdidDisAppear===SecondViewController")
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
