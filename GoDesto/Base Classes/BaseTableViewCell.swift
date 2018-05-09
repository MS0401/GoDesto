//
//  BaseTableViewCell.swift
//  AlKadi
//
//  Created by Khurram Bilal Nawaz on 22/07/2016.
//  Copyright © 2016 Khurram Bilal Nawaz. All rights reserved.
//

import Foundation
import UIKit

public class BaseTableViewCell : UITableViewCell {
    
    func setBorderColor(view:UIView,color:UIColor, width: CGFloat? = 1) {
        
        view.layer.borderWidth = width!
        view.layer.borderColor = color.cgColor
    }
    
    //MARK:-setToolbarOnPickerView
    func addToolBarToPickerView(textField:UITextField)
    {
        var buttonDone = UIBarButtonItem()
        let toolbar = UIToolbar()
        toolbar.barStyle = UIBarStyle.default
        toolbar.sizeToFit()
        let buttonflexible = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        //buttonDone = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonSystemItem.Done, target:self, action:#selector(BaseViewController.doneClicked(_:)))
        
        
        let button =  UIButton(type: .custom)
        button.addTarget(self, action: #selector(BaseViewController.doneClicked(_:)), for: .touchUpInside)
        //button.frame = CGRectMake(0, 0, 53, 31)
        button.setTitle("Done", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        //  button.setTitleColor(UIColor(netHex: 0xAE2540), for: .normal)
        button.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 16)
        button.contentMode = UIViewContentMode.right
        button.frame = CGRect(x:0, y:0, width:60, height:40)
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 5, 0)
        
        buttonDone = UIBarButtonItem(customView: button)
        
        
        toolbar.setItems(Array.init(arrayLiteral: buttonflexible,buttonDone), animated: true)
        textField.inputAccessoryView = toolbar
        
    }
    @IBAction func doneClicked(_ sender:AnyObject)
    {
        self.hideKeyboard()
    }
    func hideKeyboard() {
        self.endEditing(true)
    }
    //Mark:-SetImageWithUrl
    func setImageWithUrl(imageView:UIImageView,url:String, placeholder:String? = ""){
        
        if let imageurl =  NSURL.init(string: url){
            imageView.setIndicatorStyle(UIActivityIndicatorViewStyle.gray)
            imageView.setShowActivityIndicator(true)
            
            imageView.sd_setImage(with: imageurl as URL!, placeholderImage: UIImage(named:placeholder!))
            
//            imageView.sd_setImage(with: imageurl as URL!, completed: { (image, error, type, url) in
//                imageView.setShowActivityIndicator(false)
//                if ((error) != nil) {
//                    if let pCircle = profileCircle{
//                        if (pCircle == true) {
//                            imageView.image = UIImage(named: "DaleelDetailLogo")
//                        }
//                    }
//                }
//            })
            
           
        }
    }
    
    func heightForView(text:String, font:UIFont, width:CGFloat) -> CGFloat{
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.text = text
        label.sizeToFit()
        
        return label.frame.height
    }
    func setPlaceholderTextColor(textfield:UITextField,text:String) {
        
        textfield.attributedPlaceholder = NSAttributedString(string: text,
                                                             attributes: [NSAttributedStringKey.foregroundColor: UIColor.groupTableViewBackground])
        
       }
    
   
}
