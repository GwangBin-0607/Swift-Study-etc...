//
//  ViewController.swift
//  insertCell_VS_reloadData
//
//  Created by Ahn on 2021/11/17.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   /* func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        print(indexPaths)
        //indexPaths.last
        guard let count = Model.modelList?.count else{
            print("model Error")
            return
        }
        
        if indexPaths.contains(IndexPath(row: count-5, section: 0)){
            print("update!")
        }
        /*let num:Int? = 0
        let number:Int = 100
        let hi=number - num*///int?와 int는 연산이 되지 않는다
        //indexPaths.last?.row < count - 5//Int? Int 는 부등식이 성립하지 않고 등호나 부등호만 성립한다.
    
    }*/
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
       
        if indexPath.row > (Model.count-5){
            addData()
            
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return Model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCellPage", for: indexPath) as? CustomTableViewCell
        print("===========\(indexPath.row)==============")
        cell?.setNameLabel(data: Model.modelList?[indexPath.row])
        return cell ?? UITableViewCell()
    }
    
    var data:Bool = true
    let tblview = UITableView()
    override func loadView() {
        super.loadView()
        let subView = UIView()
        subView.backgroundColor = .white
        subView.addSubview(tblview)
        tblview.translatesAutoresizingMaskIntoConstraints = false
        tblview.topAnchor.constraint(equalTo: subView.topAnchor).isActive = true
        tblview.leadingAnchor.constraint(equalTo: subView.leadingAnchor).isActive = true
        tblview.trailingAnchor.constraint(equalTo: subView.trailingAnchor).isActive = true
        tblview.bottomAnchor.constraint(equalTo: subView.bottomAnchor).isActive = true
        
        self.view = subView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tblview.estimatedRowHeight = .zero
        //tblview.prefetchDataSource = self
        tblview.delegate = self
        tblview.dataSource = self
        tblview.register(CustomTableViewCell.self, forCellReuseIdentifier: "CustomTableViewCellPage")
        insertData()
        // Do any additional setup after loading the view.
    }
    func insertData(){
        sleep(UInt32(3.0))
        for i in 0..<30{
            Model.modelList == nil ? Model.modelList = [String(i)] : Model.modelList?.append(String(i))
        }
        print(Model.modelList)
        self.tblview.reloadData()
    }


}
extension ViewController{
    
    func addData(){
        
        if data == true{
            print("Start Update!!!!")
            data = false
            Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(requestData), userInfo: nil, repeats: false)
        }
    }
    @objc func requestData(){
        let count = Model.count
        
        
        // case 1
         /*var resultIndex:[IndexPath]?
         for i in count..<count+30{
            Model.modelList?.append(String(i))
            resultIndex == nil ? resultIndex = [IndexPath(row: i, section: 0)] : resultIndex?.append(IndexPath(row: i, section: 0))
            
        }
        guard let index = resultIndex else{
            return
        }
        self.tblview.insertRows(at: index, with: .none)*/
        // case 1 "보이는 곳 중에 insert되는 row만 CellForRow에 호출된다."
        
        
        //case2
        for i in count..<count+30{
            Model.modelList?.append(String(i))
            
        }
        self.tblview.reloadData()
        //case 2 "Developer 문서 처럼 보이는 곳의 CellForRow가 호출된다."
        
        print(Model.modelList)
        
        print("Update!!!!!")
        data = true
        
    }// result : case 1 CellForRow 1번 ,case 2 20번 그러나 Cpu는 동등하다.
}


