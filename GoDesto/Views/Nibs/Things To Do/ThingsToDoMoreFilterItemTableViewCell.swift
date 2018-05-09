//
//  ThingsToDoMoreFilterItemTableViewCell.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 13/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit
protocol ThingsToDoMoreFilterItemDelegate:NSObjectProtocol {
    func actionCallBackSetSubOption(section:Int)
}
class ThingsToDoMoreFilterItemTableViewCell: UITableViewCell {
    @IBOutlet weak var tblViewHeight:NSLayoutConstraint!
    @IBOutlet weak var tblDays:UITableView!
    @IBOutlet weak var lblTitle:UILabel!
    @IBOutlet weak var btnIcon:UIButton!
    
    
    var subOptionList:[ToDoFilterSuboptionViewModel]?
    var subOption:ToDoFilterSuboptionViewModel?
    var delegate:ThingsToDoMoreFilterItemDelegate?
    var option:ToDoFilterOptionViewModel?
    var section:Int = 0
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(option:ToDoFilterSuboptionViewModel)  {
        self.subOption = option
        self.lblTitle.text = option.title
        if(option.isSelected){
            self.btnIcon.setImage(UIImage(named:"IconCheckBox"), for: .normal)
        }else{
            self.btnIcon.setImage(UIImage(named:"IconUncheck"), for: .normal)
        }
        if(self.subOption!.isDayLater){
            self.tblViewHeight.constant = 40
        }else if(self.subOption!.isLaterWeek){
            if(self.subOption!.isDaySelected()){
                self.tblViewHeight.constant = 370
            }else{
                self.tblViewHeight.constant = 330
            }
        }else{
            self.tblViewHeight.constant = 0
        }
        self.tblDays.reloadData()
    }

    @IBAction func actonSelectItem(_ sender:UIButton){
       
        self.option!.setSubOptions(subOption: self.subOption!)
        if(self.subOption!.isSelected){
            self.subOption?.isSelected = false
        }else{
            self.subOption?.isSelected = true
        }
        self.configure(option: self.subOption!)
        
        if(self.subOption!.isDayLater){
            self.subOption?.setHeight()
        }
        if(self.subOption!.isLaterWeek){
            self.subOption?.setHeight()
        }
       
        
        if let del = self.delegate{
            del.actionCallBackSetSubOption(section:self.section)
        }
        
       // self.tblDays.reloadData()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension ThingsToDoMoreFilterItemTableViewCell:UITableViewDelegate,UITableViewDataSource,ThingsToDoFiltersOptionsDelegate,ThingsToDoFiltersDaysDelegate{
    func actionCallBackShowMoreFilters(index: Int, itemIndex: Int) {
        
    }
    
   
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if let _ = self.subOption{
            return 1
        }else{
            return 0
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(self.subOption!.isDayLater){
            if(self.subOption!.isSelected){
                return 1
            }
        }else if(self.subOption!.isLaterWeek){
            if(self.subOption!.isSelected){
                return self.subOption!.daysList.count
            }
        }
        return 0
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(self.subOption!.isDayLater){
            return 40
        }else{
            let day = self.subOption!.daysList[indexPath.row]
            return CGFloat(day.height)
        }

    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(self.subOption!.isDayLater){
             let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifier.ThingsToDoBookingTimeTableViewCell, for: indexPath) as! ThingsToDoBookingTimeTableViewCell
            cell.configure(time: self.subOption!.timeDetail)
            return cell
        }else if(self.subOption!.isLaterWeek){
             let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifier.ThingsToDoFiltersDaysTableViewCell, for: indexPath) as! ThingsToDoFiltersDaysTableViewCell
            cell.delegate = self
            cell.subOption = self.subOption!
          
            cell.configure(day: self.subOption!.daysList[indexPath.row])
            return cell
        }
       
       // cell.configure(option: self.optionList![indexPath.row])
        return UITableViewCell()

    }
    func actionCallBackSetDays(){
        self.subOption!.setHeight()
        if let del = self.delegate{
            del.actionCallBackSetSubOption(section:self.section)
        }
        
    }
    

}


