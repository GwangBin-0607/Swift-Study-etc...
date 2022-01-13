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
        print(cell?.title.contentHuggingPriority(for: .vertical))
        print(cell?.contents.contentHuggingPriority(for: .vertical))
        print(cell?.secondContents.contentHuggingPriority(for: .vertical))
        
        return cell ?? UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cell = tableView.cellForRow(at: indexPath) as? TableViewCell
//        if list[indexPath.row].1{
//            cell?.secondContents.numberOfLines = 0
//        }else{
//            cell?.secondContents.numberOfLines = 1
//        }// - 3Case
        return UITableView.automaticDimension
       
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as? TableViewCell
        list[indexPath.row].1 = true
//        cell?.secondContents.text = "Not Select -- Not Select -- Not Select -- Not Select\nawdnaowdnaiodnaidonao\nsadnaodnaiodnaodnasoidnaoidnaodaojdoiasdjoiadjaodjasiodjaoidjaodjaodjaoidjasoidjaojdaoidjaoidjaosdjas"// - 1 Case
//        cell?.heightAction?.constant = 80
//        guard let cells = tableView.indexPathsForVisibleRows else{
//            return
//        }
//        UIView.animate(withDuration: 0.75, delay: 0.0, usingSpringWithDamping: 0.55, initialSpringVelocity: 0.55, options: .curveEaseInOut, animations: {
//            tableView.performBatchUpdates({
//            }, completion: nil)
//        }, completion: nil)// - 1 Case
        
        
        UIView.animate(withDuration: 0.75, delay: 0.0, usingSpringWithDamping: 0.55, initialSpringVelocity: 0.55, options: .curveEaseInOut, animations: {
            tableView.performBatchUpdates({
                cell?.secondContents.text = "Not Select -- Not Select -- Not Select -- Not Select\nawdnaowdnaiodnaidonao\nsadnaodnaiodnaodnasoidnaoidnaodaojdoiasdjoiadjaodjasiodjaoidjaodjaodjaoidjasoidjaojdaoidjaoidjaosdjas"
            }, completion: nil)
        }, completion: nil)// - 2 Case
        
        
//        UIView.animate(withDuration: 0.75, delay: 0.0, usingSpringWithDamping: 0.55, initialSpringVelocity: 0.55, options: .curveEaseInOut, animations: {
//            tableView.performBatchUpdates({
//            }, completion: nil)
//        }, completion: nil)// - 3 Case
        
        
    }
    
    
}
class testLabel:UILabel{
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        print("draw")
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        print("Layout")
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
class TableViewCell:UITableViewCell{
    let title = testLabel()
    let contents = UILabel()
    let secondContents = UILabel()
//    var heightAction:NSLayoutConstraint?
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        self.contentMode = .topLeft
        self.selectionStyle = .none
        self.contentView.backgroundColor = .blue
        self.contentView.addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10.0).isActive = true
        title.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10.0).isActive = true
        title.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10.0).isActive = true
       
       title.contentMode = .bottomLeft
        title.numberOfLines = 0
        title.backgroundColor = .yellow
        title.text = "awidwaodnioandioandoaindoiandoiandioadnoindoiawndioawndioandioandoi"
//        title.heightAnchor.constraint(greaterThanOrEqualToConstant: title.intrinsicContentSize.height).isActive = true
       print(title.intrinsicContentSize)
        
//        title.setContentHuggingPriority(UILayoutPriority(500), for: .vertical)
//        contents.setContentHuggingPriority(UILayoutPriority(550), for: .vertical)
//        secondContents.setContentHuggingPriority(UILayoutPriority(900), for: .vertical)
        title.setContentCompressionResistancePriority(UILayoutPriority(650), for: .vertical)
        contents.setContentCompressionResistancePriority(UILayoutPriority(650), for: .vertical)
        secondContents.setContentCompressionResistancePriority(UILayoutPriority(500), for: .vertical)
        
        
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
//        heightAction = secondContents.heightAnchor.constraint(equalToConstant: 42)
//        heightAction?.isActive = true
        secondContents.backgroundColor = .red
        secondContents.contentMode = .topLeft //Very Important
        secondContents.numberOfLines = 0 // - 1,2 Case
//        secondContents.numberOfLines = 1 // - 3 Case
        secondContents.text = "Not Select -- Not Select -- Not Select -- Not Select\nawdnaowdnaiodnaidonao"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

