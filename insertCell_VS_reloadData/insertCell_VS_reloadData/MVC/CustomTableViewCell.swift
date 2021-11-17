//
//  CustomTableViewCell.swift
//  insertCell_VS_reloadData
//
//  Created by Ahn on 2021/11/17.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    let nameLabel = UILabel()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        print("init")
        self.contentView.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        nameLabel.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        nameLabel.font = UIFont.boldSystemFont(ofSize: 14.0)
        nameLabel.textColor = .systemPink
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setNameLabel(data:String?){
        self.nameLabel.text = data
    }
    
    /*override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }*/

}
