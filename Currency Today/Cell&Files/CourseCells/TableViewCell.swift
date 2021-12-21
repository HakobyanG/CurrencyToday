//
//  TableViewCell.swift
//  Currency Today
//
//  Created by Garnik on 12/13/21.
//

import UIKit

class TableViewCell: UITableViewCell {

    static let identifier = "TableViewCell"
    
    private let iconContainer: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.masksToBounds = true
        view.backgroundColor = .white
        return view
    }()
    private let title: UILabel = {
        let title = UILabel()
        title.numberOfLines = 1
        title.textColor = .systemTeal
        return title
    }()
    private let iconImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.tintColor = .white
        return image
    }()
    private let currencyTitle: UILabel = {
        let title = UILabel()
        title.numberOfLines = 1
        title.textColor = .systemGray
        return title
    }()
    private let courseLabel: UILabel = {
        let courseLabel = UILabel()
        courseLabel.numberOfLines = 1
        courseLabel.textColor = .systemTeal
        return courseLabel
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(iconContainer)
        iconContainer.addSubview(iconImage)
        contentView.addSubview(title)
        contentView.addSubview(currencyTitle)
        contentView.addSubview(courseLabel)
        contentView.clipsToBounds = true
        accessoryType = .disclosureIndicator
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        let size: CGFloat = contentView.frame.size.height - 10
        iconContainer.frame = CGRect(x: 15,
                                     y: 6,
                                     width: size,
                                     height: size)
        let imageSize: CGFloat = size/1.5
        iconImage.frame = CGRect(x: (size - imageSize)/2,
                                 y: (size - imageSize)/2,
                                 width: imageSize,
                                 height: imageSize)
        title.frame = CGRect(x: 25 + iconContainer.frame.size.width,
                             y: -10,
                             width: contentView.frame.size.width - 20 - iconContainer.frame.size.width,
                             height: contentView.frame.size.height)
        currencyTitle.frame = CGRect(x: 25 + iconContainer.frame.size.width,
                                     y: 10,
                                     width: contentView.frame.size.width - 20 - iconContainer.frame.size.width,
                                     height: contentView.frame.size.height)
        courseLabel.frame = CGRect(x: contentView.frame.size.width - 40,
                                   y: 0,
                                   width: contentView.frame.size.width - 100 - iconContainer.frame.size.width,
                                   height: contentView.frame.size.height)
    }
    public func configure(with modal: CourseOption) {
        iconContainer.backgroundColor = modal.backgroundColor
        iconImage.image = modal.backgroundImage
        title.text = modal.name
        currencyTitle.text = modal.currency
        courseLabel.text = modal.course
    }
}
