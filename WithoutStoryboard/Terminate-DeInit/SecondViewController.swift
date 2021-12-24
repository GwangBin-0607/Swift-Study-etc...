//
//  SecondViewController.swift
//  Terminate-DeInit
//
//  Created by Ahn on 2021/12/20.
//

import UIKit

class SecondViewController: UIViewController {
    init(){
        super.init(nibName: nil, bundle: nil)
        print("Second Init")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemMint
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false, block: {_ in
            let uvc = ThirdViewController()
      
            //uvc.transitioningDelegate = self
            uvc.modalTransitionStyle = .crossDissolve
            uvc.modalPresentationStyle = .custom
        self.present(uvc, animated: true, completion: nil)
        })

        // Do any additional setup after loading the view.
    }
    deinit{
        print("Second DEINIT")
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
/*extension SecondViewController:UIViewControllerTransitioningDelegate{
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        print("Present!")
        let CustomPresnt = CustomPresentController(presentedViewController: presented, presenting: presenting)
        print(CustomPresnt.shouldRemovePresentersView)
        return CustomPresnt
    }
}
class CustomPresentController:UIPresentationController{
    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
    }
    override var shouldRemovePresentersView:Bool {
       // print("Should")
        return true
    }
    
}*/
