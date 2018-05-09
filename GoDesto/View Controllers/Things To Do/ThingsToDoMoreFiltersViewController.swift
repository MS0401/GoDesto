//
//  ThingsToDoMoreFiltersViewController.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 13/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit

class ThingsToDoMoreFiltersViewController: BaseViewController,TopBarDelegate {
    
    @IBOutlet weak var lblTitle:UILabel!
    @IBOutlet weak var tblFilters:UITableView!

    var optionList:[ToDoFilterOptionViewModel]?
    var isForOptions:Bool = false
    var optionTitle:String = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        self.lblTitle.text = self.optionTitle
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let container = self.mainContainer{
            container.lblTitle.text = "Filters"
            container.lblSubTitle.text = "Refine your search"
            container.delegate = self
        }
    }
    
    func actionCallBackMoveBack() {
        self.navigationController?.popViewController(animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

extension ThingsToDoMoreFiltersViewController:UITableViewDelegate,UITableViewDataSource,ThingsToDoFiltersOptionsDelegate,ThingsToDoMoreFilterDelegate,ThingsToDoMoreFilterItemDelegate{
    func actionCallBackShowMoreFilters(index: Int, itemIndex: Int) {
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if let _ = self.optionList{
            return self.optionList!.count
        }else{
            return 0
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let option = self.optionList![section]
        if(option.isHappyHour || option.isLadiesNight){
            if(option.isSelected){
                return 3
            }
        }
        return 0//self.optionList!.count
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if(self.isForOptions){
            return 50
        }else{
            return 50
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(self.isForOptions){
            let subOption = self.optionList![indexPath.section].subOptions[indexPath.row]
            return CGFloat(subOption.height)
        }else{
            return 50
        }
        
    }
   
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifier.ThingsToDoMoreFilterTableViewCell) as! ThingsToDoMoreFilterTableViewCell
        cell.index = section
        cell.isForOptions = self.isForOptions
        cell.configure(option: self.optionList![section])
        cell.delegate = self
        return cell
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifier.ThingsToDoMoreFilterItemTableViewCell, for: indexPath) as! ThingsToDoMoreFilterItemTableViewCell
        cell.section = indexPath.section
        let option = self.optionList![indexPath.section]
        cell.option = option
        cell.configure(option:option.subOptions[indexPath.row])
        cell.delegate = self
        return cell
        
    }
    
    func actionCallBackShowSuboptions(index: Int) {
        self.tblFilters.reloadData()
    }
    func actionCallBackSetSubOption(section:Int){
        
        self.tblFilters.reloadData()
        
    }
    
}
