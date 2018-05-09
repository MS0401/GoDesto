//
//  FilterTagsItemCollectionViewCell.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 06/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit
protocol FilterTagsItemDelegate:NSObjectProtocol {
    func actionCallBackDeleteItem(index:Int)
}
class FilterTagsItemCollectionViewCell: BaseCollectionViewCell {
    
    @IBOutlet weak var lblTitle:UILabel?
    
    var index:Int = 0
    var delegate:FilterTagsItemDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureView(title:String,index:Int)  {
        self.lblTitle?.text = title
        self.index = index
    }
    @IBAction func actionDelete(_ sender:UIButton){
        if let del = self.delegate{
            del.actionCallBackDeleteItem(index: self.index)
        }
    }
}
