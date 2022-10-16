//
//  PopGestureRecognizer.swift
//  AllDirectionsDismiss
//
//  Created by kohei saito on 2020/06/14.
//  Copyright © 2020 kohei. All rights reserved.
//

import UIKit

class PopGestureRecognizer: UIPanGestureRecognizer {
    
    override init(target: Any?, action: Selector?) {
        super.init(target: target, action: action)
        delegate = self
    }
}

extension PopGestureRecognizer: UIGestureRecognizerDelegate {
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        let pan = gestureRecognizer as! UIPanGestureRecognizer
        let panTranslation = pan.translation(in: pan.view)
        return abs(panTranslation.x) > abs(panTranslation.y)
    }
}
