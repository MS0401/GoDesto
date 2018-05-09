//
//  GolfDetailReviewItemTableViewCell.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 03/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit

class GolfDetailReviewItemTableViewCell: BaseTableViewCell {
    
    @IBOutlet weak var lblName:UILabel?
    @IBOutlet weak var lblDetail:UILabel?
    @IBOutlet weak var lblDate:UILabel?
    @IBOutlet weak var imgUser:UIImageView?
    
    var review:ThingReviewViewModel?
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.imgUser?.layer.cornerRadius = 23
        self.imgUser?.clipsToBounds = true
        // Initialization code
    }
    
    func configureView(review:ThingReviewViewModel)  {
        self.lblName?.attributedText = Utilities.getMultipleTextColor(text1: review.name, text2: "  \(review.rated)  \(review.timeAdded)")
        self.lblDetail?.text = review.reviewDetail
        self.setImageWithUrl(imageView: self.imgUser!, url: review.imageUrl,placeholder: "ProfilePlaceholder")
        //self.lblDate?.text = review.rated
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
