//
//  DragDismissAnimationController.swift
//  AllDirectionsDismiss
//
//  Created by kohei saito on 2020/06/14.
//  Copyright © 2020 kohei. All rights reserved.
//

import UIKit

class DragDismissAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    
    enum Direction {
        case up
        case down
        case right
        case left
    }
    
    init(direction: Direction, backgroundAlpha: CGFloat, backgroundColor: UIColor) {
        self.direction = direction
        self.backgroundAlpha = backgroundAlpha
        self.backgroundColor = backgroundColor
    }
    
    private let direction: Direction
    private let backgroundAlpha: CGFloat
    private let backgroundColor: UIColor
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.7
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard
            let fromViewController = transitionContext.viewController(forKey: .from),
            let toViewController = transitionContext.viewController(forKey: .to),
            
            let fromView = transitionContext.view(forKey: .from),
            let toView = transitionContext.view(forKey: .to)
        else {
            return
        }
        
        let containerFrame = transitionContext.containerView.frame
        var fromViewFinalFrame = transitionContext.finalFrame(for: fromViewController)
        let toViewFinalFrame = transitionContext.finalFrame(for: toViewController)
        switch direction {
        case .up:
            fromViewFinalFrame.origin.y = -containerFrame.height
        case .down:
            fromViewFinalFrame.origin.y = containerFrame.height
        case .right:
            fromViewFinalFrame.origin.x = containerFrame.width
        case .left:
            fromViewFinalFrame.origin.x = -containerFrame.width
        }
        
        toView.frame = toViewFinalFrame
        
        transitionContext.containerView.insertSubview(toView, belowSubview: fromView)
        
        let backgroundView: UIView = UIView()
        backgroundView.frame = transitionContext.containerView.bounds
        backgroundView.backgroundColor = backgroundColor
        backgroundView.alpha = backgroundAlpha
        transitionContext.containerView.insertSubview(backgroundView, belowSubview: fromView)
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext),
                       delay: 0.0,
                       options: transitionContext.isInteractive ? .curveLinear : .curveEaseOut,
                       animations: {
                        fromView.frame = fromViewFinalFrame
                        backgroundView.alpha = 0
        }, completion: {_ in
            let completed = transitionContext.transitionWasCancelled == false
            if completed {
                toView.removeFromSuperview()
            }
            backgroundView.removeFromSuperview()
            transitionContext.completeTransition(completed)
        })
    }
}

