//
//  ThirdViewController.swift
//  Terminate-DeInit
//
//  Created by Ahn on 2021/12/20.
//

import UIKit

class ThirdViewController: UIViewController {

    let btn = UIButton()
    init(){
        super.init(nibName: nil, bundle: nil)
        print("Third Init")
    }
    override func loadView() {
        super.loadView()
        
        let subView = UIView()
        subView.frame = self.view.frame
        
        subView.addSubview(btn)
        btn.frame = CGRect(x: 150, y: 150, width: 150, height: 150)
        btn.backgroundColor = .yellow
        btn.addTarget(self, action: #selector(Action), for: .touchUpInside)
        self.view = subView
    }
    @objc func Action(){
        self.dismiss(animated: true, completion: nil)
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
        print("ThirdViewController DEINIT")
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
