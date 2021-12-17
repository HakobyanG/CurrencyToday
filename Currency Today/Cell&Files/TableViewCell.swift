//
//  TableViewCell.swift
//  Currency Today
//
//  Created by Garnik on 12/13/21.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var courseLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    func comonInit(_ image: String, title: String, name: String, course: String) {
        logoImage.image = UIImage(named: image)
        titleLabel.text = title
        nameLabel.text = name
        courseLabel.text = course
    }
}
