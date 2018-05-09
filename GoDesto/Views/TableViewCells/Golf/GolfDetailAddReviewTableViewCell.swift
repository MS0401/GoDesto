//
//  GolfDetailAddReviewTableViewCell.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 03/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit
protocol GolfDetailAddReviewDelegate:NSObjectProtocol {
    func  actionCallBackAddReview()
}
class GolfDetailAddReviewTableViewCell: BaseTableViewCell {

    @IBOutlet weak var btnAddReview:UIButton?
    
    var delegate:GolfDetailAddReviewDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.btnAddReview?.layer.cornerRadius = 5
    }

    
    @IBAction func actionAddReview(_ sender:UIButton){
        if let del = self.delegate{
            del.actionCallBackAddReview()
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
