//
//  UIView+Shake.swift
//  UIView+Shake
//
//  Created by admin on 2016/10/14.
//  Copyright © 2016年 Ding. All rights reserved.
//

import UIKit

public enum ShakeDirection: Int {
    case vertical, horizontal
}

public extension UIView {
    public func shake(_ times: UInt = 10,
                      offset: CGFloat = 5,
                      speed: TimeInterval = 0.03,
                      direction: ShakeDirection = .horizontal,
                      completion: (()->())? = nil) {
        p_shake(times, currentTimes: 0, flag: 1, offset: offset, speed: speed, direction: direction, completion: completion)
    }
    
    private func p_shake(_ times: UInt,
                         currentTimes: UInt,
                         flag: Int,
                         offset: CGFloat,
                         speed: TimeInterval,
                         direction: ShakeDirection,
                         completion: (()->())?) {
        
        UIView.animate(withDuration: speed, animations: {
            self.transform = direction == .horizontal ? CGAffineTransform(translationX: offset * CGFloat(flag), y: 0) : CGAffineTransform(translationX: 0, y: offset * CGFloat(flag))
        }) { finished in
            if currentTimes >= times {
                UIView.animate(withDuration: speed, animations: {
                    self.transform = CGAffineTransform.identity
                    }, completion: { finished in
                        completion?()
                })
                return
            }
            self.p_shake(times - 1, currentTimes: currentTimes + 1, flag: flag * (-1), offset: offset, speed: speed, direction: direction, completion: completion)
        }
    }
}
