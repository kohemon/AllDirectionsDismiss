//
//  DragInteractionController.swift
//  AllDirectionsDismiss
//
//  Created by kohei saito on 2020/06/14.
//  Copyright © 2020 kohei. All rights reserved.
//

import UIKit

class DragInteractionController: UIPercentDrivenInteractiveTransition {
    
    var shouldFinish: Bool {
        get {
            return percentComplete >= dimissPercent
        }
    }
    
    var dimissPercent: CGFloat = AllDirectionsDismiss.Defaults.dismissPercent
    
    override func update(_ percentComplete: CGFloat) {
        var percent = abs(percentComplete)
        percent = fmax(percent, 0)
        percent = fmin(percent, 1)
        
        super.update(percent)
    }
}
