//
//  AddReviewPopupViewController.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 03/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit
import Cosmos

protocol AddReviewPopupDelegate:NSObjectProtocol {
    func actionCallBcakAddReview(text:String,rating:Double)
    func actionCallBackClosePopup()
}
class AddReviewPopupViewController: BaseViewController {
    
    @IBOutlet weak var viewBackground:UIView?
    @IBOutlet weak var viewRating:CosmosView?
    @IBOutlet weak var viewRatingBackground:UIView?
    @IBOutlet weak var btnReview:UIButton?
    @IBOutlet weak var btnCancel:UIButton?
    @IBOutlet weak var txtComments:UITextField?
    @IBOutlet weak var lblName:UILabel?
    @IBOutlet weak var imgUser:UIImageView?

    var delegate:AddReviewPopupDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()

        self.viewBackground?.layer.cornerRadius = 5
        self.viewRatingBackground?.layer.cornerRadius = 5
        self.btnReview?.layer.cornerRadius = 5
        self.btnCancel?.layer.cornerRadius = 5
        self.txtComments?.layer.cornerRadius = 5
        self.viewRatingBackground?.layer.borderWidth = 0.5
        self.viewRatingBackground?.layer.borderColor = UIColor.lightGray.cgColor
        self.txtComments?.layer.borderWidth = 0.5
        self.txtComments?.layer.borderColor = UIColor.lightGray.cgColor
        self.btnCancel?.layer.borderWidth = 0.5
        self.btnCancel?.layer.borderColor = UIColor.darkGray.cgColor
        self.addTapGesture()
        self.imgUser?.layer.cornerRadius = 23
        self.imgUser?.clipsToBounds = true
        
        self.txtComments?.layer.sublayerTransform = CATransform3DMakeTranslation(8, 0, 0)
        
        self.viewRating?.rating = 1.0
        self.imgUser?.image = UIImage(named:"ProfilePlaceholder")
        if let login = Global.shared.login{
            self.lblName?.text = login.firstName
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func actionAddReview(_ sender:UIButton)
    {
        if let del = self.delegate{
            del.actionCallBcakAddReview(text: self.txtComments!.text!,rating: self.viewRating!.rating)
        }
    }
    @IBAction func actionClosePopup(_ sender:UIButton){
        if let del = self.delegate{
            del.actionCallBackClosePopup()
        }
        
    }
}
extension AddReviewPopupViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
