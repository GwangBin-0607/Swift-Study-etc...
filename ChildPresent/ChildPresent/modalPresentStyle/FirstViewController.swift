//
//  FirstViewController.swift
//  ChildPresent
//
//  Created by Ahn on 2021/12/08.
//

import UIKit

class FirstViewController: UIViewController {
    let btn = UIButton()
    override func loadView() {
        super.loadView()
        let subview = UIView()
        subview.backgroundColor = .white
        subview.addSubview(btn)
        btn.backgroundColor = .systemYellow
        btn.frame = CGRect(x: 200, y: 200, width: 200, height: 200)
        btn.addTarget(self, action: #selector(PresentAction), for: .touchUpInside)
        
        self.view = subview
    }
    @objc func PresentAction(){
        self.present(second, animated: true, completion: nil)
        //Presenting ViewController(FirstViewController)에 대해서 Life Cycle 적용이 안됨
    }

    let second = SecondViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        /*self.view.addSubview(btn)
        btn.backgroundColor = .systemYellow
        btn.frame = CGRect(x: 200, y: 200, width: 200, height: 200)
        btn.addTarget(self, action: #selector(PresentAction), for: .touchUpInside)*/
        

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear===FirstViewController")
    }
    override func viewDidAppear(_ animated: Bool) {
        print("viewdidAppear===FirstViewController")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisAppear===FirstViewController")
    }
    override func viewDidDisappear(_ animated: Bool) {
        print("viewdidDisAppear===FirstViewController")
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
