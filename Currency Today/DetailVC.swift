//
//  DetailVC.swift
//  Currency Today
//
//  Created by Garnik on 12/13/21.
//

import UIKit

class DetailVC: UIViewController {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var title1: UILabel!
    @IBOutlet weak var course: UILabel!
    @IBOutlet weak var graphikView: Graphic!
    @IBOutlet weak var detailImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func comonInit(lab: String, title: String,cours: String, image: UIImage) {
        name.text = lab
        title1.text = title
        course.text = cours
        detailImage.image = image
        
    }
}
