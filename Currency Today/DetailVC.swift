//
//  DetailVC.swift
//  Currency Today
//
//  Created by Garnik on 12/13/21.
//

import UIKit

class DetailVC: UIViewController {

    @IBOutlet weak var detailImage: UIImageView!
    var imageName: String!
    override func viewDidLoad() {
        super.viewDidLoad()

        detailImage.image = UIImage(named: self.imageName)
        // Do any additional setup after loading the view.
    }

    func commonInit(_ imageName: String, title: String) {
        self.imageName = imageName
        self.title = title
    }
}
