//
//  ViewController.swift
//  PopoverAndSplit
//
//  Created by Ahn on 2021/11/25.
//

import UIKit

class ViewController: UIViewController {
    
    let imageViewProperty = returnImageView()
    override func loadView() {
        super.loadView()
        print("loadView -- ViewController")
    }
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
        self.view.addSubview(imageViewProperty)
        imageViewProperty.frame = CGRect(x: 100, y: 100, width: 150, height: 150)
        imageViewProperty.backgroundColor = .red
        Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(imageChange), userInfo: nil, repeats: false)
        // Do any additional setup after loading the view.
    }
    @objc func imageChange(){
        print("timer")
        imageViewProperty.image = UIImage(named: "as")
    }
    var check:Bool?{
        didSet{
            check = true
        }
    }

}
class returnImageView:UIImageView{
    var reimageChange:UIImage?
    override var image: UIImage?{
        get{
            print(reimageChange)
            return reimageChange ?? UIImage(named: "BMW_로고")
        }
        set{
            print("set!")
            print(newValue)
                reimageChange = newValue
        }
    }
   
}

