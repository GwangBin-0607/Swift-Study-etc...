//
//  ViewController.swift
//  test
//
//  Created by Ahn on 2021/11/24.
//

import UIKit

class ViewController: UIViewController {
   
    let subView = UIView()
    let subViewTwo = UIView()
    let subViewThree = UIView()
    override func loadView() {
        super.loadView()
        let subview = UIView()
        subview.addSubview(subView)
        subView.frame = CGRect(x: 50, y: 50, width: 120, height: 120)
        subView.layer.cornerRadius = 60
        subView.backgroundColor = .red
        subview.addSubview(subViewTwo)
        subViewTwo.frame = CGRect(x: 50, y: 250, width: 120, height: 120)
        subViewTwo.layer.cornerRadius = 60
        subViewTwo.backgroundColor = .yellow
        subview.addSubview(subViewThree)
        subViewThree.frame = CGRect(x: 50, y: 450, width: 120, height: 120)
        subViewThree.layer.cornerRadius = 60
        subViewThree.backgroundColor = .green
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAction))
//        subView.addGestureRecognizer(tapGesture)
//        subViewTwo.addGestureRecognizer(tapGesture)
//        실행시에 subView의 Gesture은 없어진다 subViewTwo로 Gesture가 등록된다 -> Gesture은 Reference Type.
        subView.addGestureRecognizer(tapGesture)
        let secondTapGesture = UITapGestureRecognizer(target: self, action: #selector(secondTapAction))
        subViewTwo.addGestureRecognizer(secondTapGesture)
        let thirdTapGesture = UITapGestureRecognizer(target: self, action: #selector(thirdTapAction))
        subViewThree.addGestureRecognizer(thirdTapGesture)
        
        
        subview.backgroundColor = .white
        
        self.view = subview
    }
    //이미 뷰에 포함되어있는 서브뷰를 다른 뷰에 포함시키는건 가능할까? -> Yes
//    @objc func thirdTapAction(senderaa:String)//Error
    @objc func thirdTapAction(senderaa:UITapGestureRecognizer){
        subView.addSubview(subViewThree)
        subViewThree.frame = CGRect(x: 0, y: 0, width: subView.frame.width/2, height: subView.frame.height/2)
    }
    //.allowUserInteraction은 무엇을 하는것일까
//    @objc func secondTapAction(senderaa:Any){
//        print("Second Tap")
//        //.allowUserInteraction -> 해당 뷰가 Animation중에도 상호작용 가능하게 한다.즉 해당 뷰가 animation중에도 제스쳐가 인식돼서 Second Tap이 호출된다.
//        //1번이 끝나기 전에 2번이 눌리면 1번이 끝나기 전에 2번이 호출되어서 실행된다.
//        if subViewTwo.frame.width == 120{
//            //1
//            UIView.animate(withDuration: 10.3, delay: 0.0, options: .allowUserInteraction, animations: {
//                self.subViewTwo.transform = CGAffineTransform(scaleX: 1.5, y: 1.5).translatedBy(x: 50, y: 50)
//            }, completion: nil)
//        }else{
//            //2
//            UIView.animate(withDuration: 10.3, delay: 0.0, options: .allowUserInteraction, animations: {
//                self.subViewTwo.transform = .identity
//            }, completion: nil)
//        }
//
//
//    }
    //한개의 뷰가 애니메이션 중이면 다른 뷰는 애니메이션이 가능할까? -> YES
    @objc func secondTapAction(senderaa:Any){
        print("Second Tap")
        if subViewTwo.frame.width == 120{
            //1
            UIView.animate(withDuration: 4.3, delay: 0.0, options: .curveEaseInOut, animations: {
                self.subViewTwo.transform = CGAffineTransform(scaleX: 1.5, y: 1.5).translatedBy(x: 50, y: 50)
            }, completion: nil)
        }else{
            //2
            UIView.animate(withDuration: 4.3, delay: 0.0, options: .curveEaseInOut, animations: {
                self.subViewTwo.transform = .identity
            }, completion: nil)
        }
        
        
    }

    @objc func tapAction(senderaa:Any){
        print("first Tap")
//        print(senderaa)
//        print(subView.gestureRecognizers)
//        print(subViewTwo.gestureRecognizers)
        if subView.frame.width == 120{
            UIView.animate(withDuration: 4.3, delay: 0.0, options: .curveEaseInOut, animations: {
                self.subView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5).translatedBy(x: 50, y: 50)
            }, completion: nil)
        }else{
            UIView.animate(withDuration: 4.3, delay: 0.0, options: .curveEaseInOut, animations: {
                self.subView.transform = .identity
            }, completion: nil)
        }
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewdid")
        
        // Do any additional setup after loading the view.
    }


}

