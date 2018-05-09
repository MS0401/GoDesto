//
//  FilterHotelSearchTableViewCell.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 21/03/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit

class FilterHotelSearchTableViewCell: BaseTableViewCell {
    @IBOutlet weak var txtSearch:IQDropDownTextField?
    @IBOutlet weak var lblTitle:UILabel?

    var search:FilterHotelSearchViewModel?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.lblTitle?.text = "Sort by"
        self.addToolBarToPickerView(textField: self.txtSearch!)
        self.txtSearch?.itemList = DropDownList.ListSortByPrice
    }

    func  configure(search:FilterHotelSearchViewModel)  {
        self.search = search
        self.txtSearch?.text = search.answer
    }
    override func hideKeyboard() {
        self.endEditing(true)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension FilterHotelSearchTableViewCell:UITextFieldDelegate,IQDropDownTextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func textField(_ textField: IQDropDownTextField!, didSelectItem item: String!) {
        print(item)
        self.search?.answer = item
        self.search?.isAnswered = true
    }
}
