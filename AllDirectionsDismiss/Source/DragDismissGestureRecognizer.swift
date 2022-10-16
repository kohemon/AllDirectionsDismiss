//
//  DragDismissGestureRecognizer.swift
//  AllDirectionsDismiss
//
//  Created by kohei saito on 2020/06/14.
//  Copyright © 2020 kohei. All rights reserved.
//

import UIKit

public class DragDismissGestureRecognizer: UIPanGestureRecognizer {
    override init(target: Any?, action: Selector?) {
        super.init(target: target, action: action)
        delegate = self
    }
}

extension DragDismissGestureRecognizer: UIGestureRecognizerDelegate {
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        let pan = gestureRecognizer as! UIPanGestureRecognizer
        let panTranslation = pan.translation(in: pan.view)
        return abs(panTranslation.x) < abs(panTranslation.y)
    }

    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return otherGestureRecognizer.view is UIScrollView
    }
}
