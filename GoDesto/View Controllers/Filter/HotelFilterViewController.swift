//
//  HotelFilterViewController.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 21/03/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit

class HotelFilterViewController: BaseViewController {
    
    @IBOutlet weak var tblFilters:UITableView?
    
    var isThingsToDo:Bool = true
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tblFilters!.register(UINib(nibName: NIBName.FilterHotelSearchTableViewCell, bundle: nil), forCellReuseIdentifier: TableViewCellIdentifier.FilterHotelSearchTableViewCell)
        self.tblFilters!.register(UINib(nibName: NIBName.FilterPriceRangeTableViewCell, bundle: nil), forCellReuseIdentifier: TableViewCellIdentifier.FilterPriceRangeTableViewCell)
        self.tblFilters!.register(UINib(nibName: NIBName.FilterOptionsTableViewCell, bundle: nil), forCellReuseIdentifier: TableViewCellIdentifier.FilterOptionsTableViewCell)
        self.tblFilters!.register(UINib(nibName: NIBName.FilterStarsTableViewCell, bundle: nil), forCellReuseIdentifier: TableViewCellIdentifier.FilterStarsTableViewCell)
        self.tblFilters!.register(UINib(nibName: NIBName.FiltersTypesTableViewCell, bundle: nil), forCellReuseIdentifier: TableViewCellIdentifier.FiltersTypesTableViewCell)
        self.tblFilters!.register(UINib(nibName: NIBName.FilterCuisineTableViewCell, bundle: nil), forCellReuseIdentifier: TableViewCellIdentifier.FilterCuisineTableViewCell)
        
    }
    
    @IBAction func actionDone(_ sender:UIButton){
        NotificationCenter.default.post(name: Notification.Name("NotificationFromFilters"), object: nil, userInfo: nil)
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func actionReset(_ sender:UIButton){
        Global.shared.filter.resetFilter()
        Global.shared.filter.tagList = [String]()
        Global.shared.filter.setPrice(searchRegion: Global.shared.searchRegion!)
        NotificationCenter.default.post(name: Notification.Name("NotificationFromFilters"), object: nil, userInfo: nil)
        self.tblFilters?.reloadData()
        self.dismiss(animated: true, completion: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
extension HotelFilterViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(self.isThingsToDo){
            return 7
        }else{
            return 6
        }
        
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if(self.isThingsToDo) {
            if(indexPath.row == 0) {
                return 90
            } else if(indexPath.row == 1) {
                return 90
            } else if(indexPath.row == 2) {
                return 250
            } else if(indexPath.row == 3) {
                return 250
            } else if(indexPath.row == 4) {
                return 100
            } else if(indexPath.row == 5 || indexPath.row == 6) {
                return 120
            }
        } else {
            if(indexPath.row == 0){
                return 90
            } else if(indexPath.row == 1) {
                return 90
            } else if(indexPath.row == 2) {
                return 250
            } else if(indexPath.row == 3) {
                return 100
            } else if(indexPath.row == 4 || indexPath.row == 5) {
                return 120
            }
        }
        return 50
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(self.isThingsToDo){
            if(indexPath.row == 0) {
                let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifier.FilterHotelSearchTableViewCell) as! FilterHotelSearchTableViewCell
                
                return cell
            } else if(indexPath.row == 1) {
                let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifier.FilterPriceRangeTableViewCell) as! FilterPriceRangeTableViewCell
                return cell
                
            }else if(indexPath.row == 2) {
                let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifier.FilterCuisineTableViewCell) as! FilterCuisineTableViewCell
                cell.configure(list: Global.shared.filter.popularCuicineList)
                return cell
            }else if(indexPath.row == 3) {
                let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifier.FilterOptionsTableViewCell) as! FilterOptionsTableViewCell
                cell.configure(list: Global.shared.filter.optionList)
                return cell
            }else if(indexPath.row == 4){
                let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifier.FilterStarsTableViewCell) as! FilterStarsTableViewCell
                cell.configure(list: Global.shared.filter.starsList)
                return cell
            }else if(indexPath.row == 5){
                let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifier.FiltersTypesTableViewCell) as! FiltersTypesTableViewCell
                cell.lblTitle?.text = "Filter by Meal type"
                cell.configure(typeList: Global.shared.filter.mealTypeList)
                return cell
            }else{
                let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifier.FiltersTypesTableViewCell) as! FiltersTypesTableViewCell
                cell.lblTitle?.text = "Filter by Accommodation type"
                cell.configure(typeList: Global.shared.filter.accomodationTypeList)
                return cell
            }
        }else{
            if(indexPath.row == 0){
                let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifier.FilterHotelSearchTableViewCell) as! FilterHotelSearchTableViewCell
                cell.configure(search: Global.shared.filter.hotelSearch)
                return cell
            }else if(indexPath.row == 1){
                let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifier.FilterPriceRangeTableViewCell) as! FilterPriceRangeTableViewCell
                cell.configureview(price: Global.shared.filter.priceSearch)
                return cell
                
            }else if(indexPath.row == 2){
                let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifier.FilterOptionsTableViewCell) as! FilterOptionsTableViewCell
                cell.configure(list: Global.shared.filter.optionList)
                return cell
            }else if(indexPath.row == 3){
                let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifier.FilterStarsTableViewCell) as! FilterStarsTableViewCell
                cell.configure(list: Global.shared.filter.starsList)
                return cell
            }else if(indexPath.row == 4){
                let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifier.FiltersTypesTableViewCell) as! FiltersTypesTableViewCell
                cell.lblTitle?.text = "Filter by Meal type"
                cell.configure(typeList: Global.shared.filter.mealTypeList)
                return cell
            }else{
                let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifier.FiltersTypesTableViewCell) as! FiltersTypesTableViewCell
                cell.lblTitle?.text = "Filter by Accommodation type"
                cell.configure(typeList: Global.shared.filter.accomodationTypeList)
                return cell
            }
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}

