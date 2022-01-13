//
//  ViewController.swift
//  ExpandingTableViewCell
//
//  Created by Ahn on 2022/01/13.
//

import UIKit

class ViewController: UIViewController {

    var list:[(String,Bool)] = []
    let tblView = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(tblView)
        tblView.translatesAutoresizingMaskIntoConstraints = false
        tblView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        tblView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tblView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        tblView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tblView.delegate = self
        tblView.dataSource = self
        tblView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCellPage")
        for i in 0..<100{
            list.append((String(i),false))
        }
        // Do any additional setup after loading the view.
    }
    var select:Int?
    


}
extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellPage", for: indexPath) as? TableViewCell
        
        return cell ?? UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as? TableViewCell
        cell?.heightAction?.constant = 80
//        UIView.animate(withDuration: 1.00, delay: 0.0, usingSpringWithDamping: 0.75, initialSpringVelocity: 0.75, options: .curveEaseInOut, animations: {
//            cell?.layoutIfNeeded()
//        }, completion: nil)

        
        
    }
    
    
}
class TableViewCell:UITableViewCell{
    let title = UILabel()
    let contents = UILabel()
    let secondContents = UILabel()
    var heightAction:NSLayoutConstraint?
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.contentView.backgroundColor = .blue
        self.contentView.addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10.0).isActive = true
        title.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10.0).isActive = true
        title.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10.0).isActive = true
       
//       title.contentMode = .bottomLeft
        title.numberOfLines = 0
        title.backgroundColor = .yellow
        title.text = "awidwaodnioandioandoaindoiandoiandioadnoindoiawndioawndioandioandoi"
//        title.heightAnchor.constraint(greaterThanOrEqualToConstant: title.intrinsicContentSize.height).isActive = true
       print(title.intrinsicContentSize)
        
        self.contentView.addSubview(contents)
        contents.translatesAutoresizingMaskIntoConstraints = false
        contents.topAnchor.constraint(equalTo: self.title.bottomAnchor, constant: 10.0).isActive = true
        contents.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10.0).isActive = true
        contents.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10.0).isActive = true
        contents.numberOfLines = 0
//        contents.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor,constant: -10.0).isActive = true
//        contents.contentMode = .topLeft //이거 씨발
        contents.backgroundColor = .red
        contents.text = "Not Select -- Not Select -- Not Select -- Not Select"
        
        self.contentView.addSubview(secondContents)
        secondContents.translatesAutoresizingMaskIntoConstraints = false
        secondContents.topAnchor.constraint(equalTo: self.contents.bottomAnchor, constant: 10.0).isActive = true
        secondContents.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10.0).isActive = true
        secondContents.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10.0).isActive = true
        secondContents.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor,constant: -10.0).isActive = true
        heightAction = secondContents.heightAnchor.constraint(equalToConstant: 42)
        heightAction?.isActive = true
        secondContents.backgroundColor = .red
        secondContents.contentMode = .topLeft
        secondContents.numberOfLines = 0
        secondContents.text = "Not Select -- Not Select -- Not Select -- Not Select\nawdnaowdnaiodnaidonao"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

