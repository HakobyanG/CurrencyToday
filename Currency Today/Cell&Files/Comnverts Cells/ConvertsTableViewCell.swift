//
//  ConvertsTableViewCell.swift
//  Currency Today
//
//  Created by Garnik on 12/18/21.
//

import UIKit

class ConvertsTableViewCell: UITableViewCell {

    static let identifier = "ConvertsTableViewCell"
    
    private let iconContainer: UIView = {
        let icon = UIView()
        icon.clipsToBounds = true
        icon.layer.masksToBounds = true
        icon.backgroundColor = .white
        return icon
    }()
    private let iconImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        return image
    }()
    private let title: UILabel = {
        let title = UILabel()
        title.numberOfLines = 1
        title.textColor = .systemTeal
        return title
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(iconContainer)
        iconContainer.addSubview(iconImage)
        contentView.addSubview(title)
        contentView.clipsToBounds = true
        accessoryType = .disclosureIndicator
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let size: CGFloat = contentView.frame.size.height - 10
        let imageSize: CGFloat = size/1.5
        iconContainer.frame = CGRect(x: contentView.frame.size.width - 80,
                                     y: 0,
                                     width: size,
                                     height: size)
        iconImage.frame = CGRect(x: (size - imageSize)/2,
                                 y: (size - imageSize)/2,
                                 width: imageSize,
                                 height: imageSize)
        title.frame = CGRect(x: 15,
                             y: 0,
                             width: contentView.frame.size.width - 20 - iconContainer.frame.size.width,
                             height: contentView.frame.size.height)
    }
    
    public func configure(with modal: ConvertsOption) {
        iconContainer.backgroundColor = modal.backgroundColor
        iconImage.image = modal.backgroundImage
        title.text = modal.name
    }
}
