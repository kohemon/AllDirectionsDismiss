//
//  UIPanGestureRecognizer+Extension.swift
//  AllDirectionsDismiss
//
//  Created by kohei saito on 2020/06/14.
//  Copyright © 2020 kohei. All rights reserved.
//

import UIKit

public enum PanDirection: Int {
    case up, down, left, right
    public var isVertical: Bool { return [.up, .down].contains(self) }
    public var isHorizontal: Bool { return !isVertical }
}

extension UIPanGestureRecognizer {
    
    var direction: PanDirection? {
        let velocity = self.velocity(in: view)
        let isVertical = abs(velocity.y) > abs(velocity.x)
        switch (isVertical, velocity.x, velocity.y) {
        case (true, _, let y) where y < 0:
            return .up
        case (true, _, let y) where y > 0:
            return .down
        case (false, let x, _) where x > 0:
            return .right
        case (false, let x, _) where x < 0:
            return .left
        default:
            return nil
        }
    }
    
}
