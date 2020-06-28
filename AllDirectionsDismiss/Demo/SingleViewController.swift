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

    var allDirectionsDismiss: AllDirectionsDismiss?
    var dismissData: ViewController.DismissData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Single"
        
        allDirectionsDismiss = AllDirectionsDismiss(viewController: self)
        //set allow dismiss direction
        allDirectionsDismiss?.allowDismissDirection = dismissData!.allowDismissDirection
        // set percent to dismiss
        allDirectionsDismiss?.dismissPercent = dismissData!.percent
        // set velocity to dismiss
        allDirectionsDismiss?.dismissVelocity = dismissData!.velocity
        // set alpha to background view alpha
        allDirectionsDismiss?.backgroundAlpha = dismissData!.backgroundAlpha
        // set alpha to background view color
        allDirectionsDismiss?.backgroundColor = dismissData!.backgroundColor
    }

    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
