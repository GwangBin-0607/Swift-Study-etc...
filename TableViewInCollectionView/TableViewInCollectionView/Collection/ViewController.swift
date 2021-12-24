//
//  ViewController.swift
//  TableViewInCollectionView
//
//  Created by Ahn on 2021/12/24.
//

import UIKit

class ViewController: UIViewController {
    let collectionViewLayout = CustomFlowLayout()
    lazy var collectionView = CustomCollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
    var model = CollectionModelServer()
    override func loadView() {
        super.loadView()
        let newView = UIView()
        newView.frame = self.view.frame
        newView.backgroundColor = .white
        newView.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: newView.topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: newView.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: newView.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: newView.bottomAnchor).isActive = true
        print(collectionView.name)
        
        self.view = newView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "CustomCollectionViewCellPage")
        collectionView.delegate = self
        collectionView.dataSource = self
        model.requestData({
            self.collectionView.reloadData()
            //print(self.model) -> Access Error // Memory Safety
        })
        print(model)
        // Do any additional setup after loading the view.
    }
    


}
extension ViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        print("CollectionView WillDisPlay-----\(indexPath.item)")
        let cell = cell as? CustomCollectionViewCell
        cell?.tblview.tag = indexPath.row
        if cell?.tblview.delegate == nil{
            cell?.tblview.delegate = self
        }
        if cell?.tblview.dataSource == nil{
            cell?.tblview.dataSource = self
        }
        cell?.tblview.reloadData()
        cell?.tblview.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: false)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("CollectionView CellForItemAt-----\(indexPath.item)")
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionViewCellPage", for: indexPath) as? CustomCollectionViewCell
        
        switch indexPath.row{
        case 0:
            cell?.tblview.backgroundColor = .red
        case 1:
            cell?.tblview.backgroundColor = .orange
        case 2:
            cell?.tblview.backgroundColor = .yellow
        case 3:
            cell?.tblview.backgroundColor = .green
        default:
            break
        }
        return cell ?? UICollectionViewCell()
    }
    
    
    
}
extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("\(tableView.tag)-----NUMBER----ROW")
        switch section{
        case 0:
            return model.firstCollectionModel?.count ?? 0
        case 1:
            return model.secondCollectionModel?.count ?? 0
        case 2:
            return model.thirdCollectionModel?.count ?? 0
        case 3:
            return model.fourthCollectionModel?.count ?? 0
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        withUnsafePointer(to: tableView, {
//            (pa) in
//            print(pa)
//        })
//        let t = tableView
//        withUnsafePointer(to: t, {
//            (pa) in
//            print(pa)
//        })//->Stack 주소
//        print(t)//->Stack에 들어있는값 = Heap주소
        print("\(tableView.tag)-----CELLFOR----ROW : \(indexPath.row)")
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCellPage", for: indexPath) as? CustomTableViewCell
        cell?.customLabel.text = String(indexPath.row)
        
        return cell ?? UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    
}

