//
//  ViewController.swift
//  CircleMenu
//
//  Created by Pavel Chehov on 08/11/2018.
//

import UIKit
import EGOCircleMenu

class ViewController: UIViewController, CircleMenuDelegate {
    
    var icons = [String]()
    let submenuIds = [2,3]
    let showItemSegueId = "showItem"
    var selectedItemId: Int?
    
    @IBOutlet weak var idLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        icons.append(contentsOf: ["icImage", "icPanorama", "icVideo",
                                  "icPhoto","icTimelapse","icMacro", "icPortrait", "icSeries", "icTimer",
                                  "icSixteenToNine", "icOneToOne", "icHDR"])
        
        let circleMenu = CircleMenu()
        circleMenu.attach(to: self)
        circleMenu.delegate = self
        circleMenu.circleMenuItems = createCircleMenuItems(count: 9)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    func menuItemSelected(id: Int) {
        idLabel.text = "id: \(id)"
        selectedItemId = id
        guard id != 100, !submenuIds.contains(id) else {
            return
        }
        performSegue(withIdentifier: showItemSegueId, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == showItemSegueId, let selectedItemId = selectedItemId else {
            return
        }
        let viewController = segue.destination as! MenuItemViewController
        viewController.imageSource = icons[selectedItemId]
    }
    
    private func createCircleMenuItems(count: Int) -> [CircleMenuItemModel] {
        var menuModels = [CircleMenuItemModel]()
        for i in 0..<count {
            let menuModel = CircleMenuItemModel(id: i, imageSource: UIImage.init(named: icons[i]))
            if submenuIds.contains(i){
                for j in  9..<12 {
                    let submenuModel = CircleMenuItemModel(id: j, imageSource: UIImage.init(named: icons[j]))
                    menuModel.children!.append(submenuModel)
                }
            }
            menuModels.append(menuModel)
        }
        return menuModels
    }
}
