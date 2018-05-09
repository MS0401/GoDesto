//
//  PaddingTextField.swift
//  Bassam
//
//  Created by Khurram Bilal Nawaz on 06/07/2017.
//  Copyright © 2017 AcclivousByte. All rights reserved.
//

import Foundation
import UIKit

class PaddingTextField: UITextField {
    
    @IBInspectable var topInset: CGFloat = 0.0
    @IBInspectable var bottomInset: CGFloat = 5.0
    @IBInspectable var leftInset: CGFloat = 0.0
    @IBInspectable var rightInset: CGFloat = 0.0
    
    //let padding = UIEdgeInsets(top: 0, left: 0, bottom: 5, right: 0);
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let insets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        return UIEdgeInsetsInsetRect(bounds, insets)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        let insets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        return UIEdgeInsetsInsetRect(bounds, insets)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let insets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        return UIEdgeInsetsInsetRect(bounds, insets)
    }

}
