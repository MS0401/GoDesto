//
//  FilterPriceRangeTableViewCell.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 21/03/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit

class FilterPriceRangeTableViewCell: BaseTableViewCell,RangeSeekSliderDelegate {

    @IBOutlet weak var lblTitle:UILabel?
    @IBOutlet weak var lblStartPrice:UILabel?
    @IBOutlet weak var lblEndPrice:UILabel?
    @IBOutlet weak var viewSlider:RangeSeekSlider?
    
    var price:FilterPriceViewModel?
    override func awakeFromNib() {
        super.awakeFromNib()

        self.viewSlider!.handleColor = APPLICATION_THEME_COLOR
        self.viewSlider?.handleDiameter = 10
        self.viewSlider!.selectedHandleDiameterMultiplier = 1.1
        self.viewSlider?.delegate = self
        self.lblTitle?.text = "Search by price"
    }
    
    func configureview(price:FilterPriceViewModel)  {
        self.price = price
       
        let minValue = Double(price.min)!
        let maxValue = Double(price.max)!
        
        self.viewSlider!.minValue = CGFloat(minValue)
        self.viewSlider!.maxValue = CGFloat(maxValue)
     
        self.viewSlider?.minDistance = 5
        self.viewSlider?.maxDistance = CGFloat(maxValue)
        let rate = Global.shared.splashInfo!.exchangeInfo.rate
        let convertRateInDouble = Double(rate)
       
        if(price.isChanged) {
            let minvalue = CGFloat(Double(price.minInAED)!)
            let maxvalue = CGFloat(Double(price.maxInAED)!)
            self.viewSlider!.selectedMinValue = CGFloat(minvalue * CGFloat(convertRateInDouble!))
           self.viewSlider!.selectedMaxValue = CGFloat(maxvalue * CGFloat(convertRateInDouble!))
            
            self.lblStartPrice?.text = "\(Int(CGFloat(minvalue * CGFloat(convertRateInDouble!))))"
            self.lblEndPrice?.text = "\(Int(CGFloat(maxvalue * CGFloat(convertRateInDouble!))))"
        } else {
            self.viewSlider!.selectedMaxValue = CGFloat(maxValue)
            self.viewSlider!.selectedMinValue = CGFloat(minValue)
            
            self.lblStartPrice?.text = price.min
            self.lblEndPrice?.text = price.max
        }
        
        
    }

    func rangeSeekSlider(_ slider: RangeSeekSlider, didChange minValue: CGFloat, maxValue: CGFloat){
      
       let rate = Global.shared.splashInfo!.exchangeInfo.rate
        
        self.lblStartPrice?.text = "\(Int(minValue))"
        self.lblEndPrice?.text = "\(Int(maxValue))"
        let convertRateInDouble = Double(rate)
        self.price?.minInAED = "\(minValue / CGFloat(convertRateInDouble!))"
         self.price?.maxInAED = "\(maxValue / CGFloat(convertRateInDouble!))"
        self.price?.isChanged = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
