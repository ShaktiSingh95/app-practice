//
//  CelebsViewController.swift
//  ContainerViewSlideMenu
//
//  Created by Shakti Pratap Singh on 29/07/16.
//  Copyright © 2016 Shakti Pratap Singh. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift
class CelebsViewController: SlideMenuController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addRightBarButtonWithImage(UIImage(named: Constants.imageIdentifiers.rightOptionMenuButtonImage)!)
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    override func awakeFromNib(){
        
        if let controller = self.storyboard?.instantiateViewControllerWithIdentifier(Constants.viewControllerIdentifiers.celebsMainVc) {
            self.mainViewController = controller
        }
        if let controller = self.storyboard?.instantiateViewControllerWithIdentifier(Constants.viewControllerIdentifiers.rightSliderVc) {
            self.rightViewController = controller
        }
        super.awakeFromNib()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}
