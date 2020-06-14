//
//  SingleViewController.swift
//  Demo
//
//  Created by kohei saito on 2020/06/14.
//  Copyright © 2020 kohei. All rights reserved.
//

import UIKit
import AllDirectionsDismiss

class SingleViewController: UIViewController {

    var fourDirection: AllDirectionsDismiss?
    var dismissData: ViewController.DismissData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Single"
        
        fourDirection = AllDirectionsDismiss(viewController: self)
        // set percent to dismiss
        fourDirection?.dismissPercent = dismissData!.percent
        // set velocity to dismiss
        fourDirection?.dismissVelocity = dismissData!.velocity
        // set alpha to background view alpha
        fourDirection?.backgroundAlpha = dismissData!.backgroundAlpha
        // set alpha to background view color
        fourDirection?.backgroundColor = dismissData!.backgroundColor
    }

    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
