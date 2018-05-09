//
//  CellContentScrollView.swift
//  AlKadi
//
//  Created by Khurram Bilal Nawaz on 28/01/2017.
//  Copyright © 2017 Khurram Bilal Nawaz. All rights reserved.
//

import Foundation

//class CellContentScrollView: UIScrollView {
//    
//    // MARK: - UIView override
//    
//    override func hitTest(point: CGPoint, withEvent event: UIEvent?) -> UIView? {
//        if (self.zooming){
//            return self
//        }else{
//        let hitTargetView = super.hitTest(point, withEvent: event)
//        return hitTargetView as? UIControl ?? (hitTargetView == self ? nil : superview)
//        }
//        
//    }
//    
//    override func didMoveToSuperview() {
//        superview?.addGestureRecognizer(panGestureRecognizer)
//    }
//}
