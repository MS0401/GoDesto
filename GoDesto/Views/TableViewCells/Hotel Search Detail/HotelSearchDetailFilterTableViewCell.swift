//
//  HotelSearchDetailFilterTableViewCell.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 03/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit
protocol HotelSearchDetailFilterDelegate:NSObjectProtocol {
    func actionCallBackSetFilter(cell:HotelSearchDetailFilterTableViewCell,filter:DetailFilter)
}
class HotelSearchDetailFilterTableViewCell: BaseTableViewCell {
    
    @IBOutlet weak var btnAll:UIButton?
    @IBOutlet weak var btnRefund:UIButton?
    @IBOutlet weak var btnBreakfast:UIButton?
//    @IBOutlet weak var txtRefundable:IQDropDownTextField?
//    @IBOutlet weak var txtBreakfast:IQDropDownTextField?
    
    var selecedTextfield:UITextField = UITextField()
    var delegate:HotelSearchDetailFilterDelegate?
    
    var filterOption:[FilterOptionViewModel]?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.btnAll?.layer.cornerRadius  = 5
        self.btnRefund?.layer.cornerRadius  = 5
        self.btnBreakfast?.layer.cornerRadius  = 5
        
    }

    
    func  configureView(options:[FilterOptionViewModel])  {
        self.filterOption = options
        
        if(options[0].isSelected){
            self.btnAll?.backgroundColor = APPLICATION_THEME_COLOR
            self.btnBreakfast?.backgroundColor = ORANGE_COLOR
            self.btnRefund?.backgroundColor = ORANGE_COLOR
        }else if(options[1].isSelected){
            self.btnAll?.backgroundColor = ORANGE_COLOR
            self.btnRefund?.backgroundColor = APPLICATION_THEME_COLOR
        }else if(options[2].isSelected){
            self.btnAll?.backgroundColor = ORANGE_COLOR
            self.btnBreakfast?.backgroundColor = APPLICATION_THEME_COLOR
        }
    }
    @IBAction func actionSetFilter(_ sender:UIButton){
        if(sender == self.btnAll!){
            self.btnAll?.backgroundColor = APPLICATION_THEME_COLOR
            self.btnBreakfast?.backgroundColor = ORANGE_COLOR
            self.btnRefund?.backgroundColor = ORANGE_COLOR
            self.filterOption![0].isSelected = true
            self.filterOption![1].isSelected = false
            self.filterOption![2].isSelected = false
            if let del = self.delegate{
                del.actionCallBackSetFilter(cell: self,filter: DetailFilter.All)
            }
        }else if(sender == self.btnRefund!){
            self.btnAll?.backgroundColor = ORANGE_COLOR
            self.btnRefund?.backgroundColor = APPLICATION_THEME_COLOR
            self.filterOption![0].isSelected = false
            self.filterOption![1].isSelected = true
            if let del = self.delegate{
                del.actionCallBackSetFilter(cell: self,filter: DetailFilter.NonRefundable)
            }
        }else{
            self.btnAll?.backgroundColor = ORANGE_COLOR
            self.btnBreakfast?.backgroundColor = APPLICATION_THEME_COLOR
            self.filterOption![0].isSelected = false
            self.filterOption![2].isSelected = true
            if let del = self.delegate{
                del.actionCallBackSetFilter(cell: self,filter: DetailFilter.Breakfast)
            }
        }
        self.configureView(options: self.filterOption!)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
extension HotelSearchDetailFilterTableViewCell:IQDropDownTextFieldDelegate{
    func textField(_ textField: IQDropDownTextField!, didSelectItem item: String!) {
        self.selecedTextfield = textField
        
        print(textField.text!)
    }
}
