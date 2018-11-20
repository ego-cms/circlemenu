//
//  MenuItemViewController.swift
//  CircleMenu
//
//  Created by Pavel Chehov on 19/11/2018.
//

import UIKit

class MenuItemViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var imageSource: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage.init(named: imageSource)
        imageView.tintColor = UIColor.black
        navigationController?.isNavigationBarHidden = false
    }
}
