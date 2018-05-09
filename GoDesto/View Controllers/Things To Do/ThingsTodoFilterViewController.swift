//
//  ThingsTodoFilterViewController.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 13/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit

class ThingsTodoFilterViewController: BaseViewController,TopBarDelegate {

    @IBOutlet weak var tblFilters:UITableView?
    
    var locaitonCell:ThingsToDoFilterAutoCompleteTableViewCell?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tblFilters!.register(UINib(nibName: NIBName.ThingsToDoFiltersOptionsTableViewCell, bundle: nil), forCellReuseIdentifier: TableViewCellIdentifier.ThingsToDoFiltersOptionsTableViewCell)
        self.tblFilters!.register(UINib(nibName: NIBName.ThingsToDoFilterAutoCompleteTableViewCell, bundle: nil), forCellReuseIdentifier: TableViewCellIdentifier.ThingsToDoFilterAutoCompleteTableViewCell)
        
        if(self.checkInternetConnection()){
            self.getOpenTimes(type: "ladies_nite")
            self.getOpenTimes(type: "happy_hour")
        }
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
        if let container = self.mainContainer{
            container.bottomViewHeight.constant = 60
        }
        self.navigationController?.popViewController(animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
extension ThingsTodoFilterViewController:UITableViewDelegate,UITableViewDataSource,ThingsToDoFiltersOptionsDelegate,ThingsToDoFilterAutoCompleteDelegate{
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.row == 0){
            return 150
        }else{
            return 320
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(indexPath.row == 0){
            
            let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifier.ThingsToDoFilterAutoCompleteTableViewCell, for: indexPath) as! ThingsToDoFilterAutoCompleteTableViewCell
            if let _ = self.locaitonCell{
                return self.locaitonCell!
            }
            self.locaitonCell = cell
            cell.configure(location: Global.shared.toDoFilters.locationName)
            cell.delegate = self
            cell.lblTitle?.text = Global.shared.toDoFilters.searchTitle
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifier.ThingsToDoFiltersOptionsTableViewCell, for: indexPath) as! ThingsToDoFiltersOptionsTableViewCell
            cell.delegate = self
            if(indexPath.row == 1){
                 cell.configure(list: Global.shared.toDoFilters.cusineList,index: indexPath.row)
                cell.lblTitle?.text = Global.shared.toDoFilters.cusineTitle
            }else{
                 cell.configure(list: Global.shared.toDoFilters.optionList,index: indexPath.row)
                cell.lblTitle?.text = Global.shared.toDoFilters.optionTitle
            }
           
            return cell
        }
        
        
    }
    func actionCallBackShowMoreFilters(index: Int,itemIndex:Int) {
        if(index == 1){
            if(itemIndex == 7){
                let storyboard = UIStoryboard.init(name: StoryboardName.ThingsToDO, bundle: nil)
                if let vc = storyboard.instantiateViewController(withIdentifier: ControllerIdentifier.ThingsToDoMoreFiltersViewController) as? ThingsToDoMoreFiltersViewController{
                    vc.optionList = Global.shared.toDoFilters.cusineList
                    vc.optionTitle = Global.shared.toDoFilters.cusineTitle
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            }
            
        }else if(index == 2){
            if(itemIndex == 7){
                let storyboard = UIStoryboard.init(name: StoryboardName.ThingsToDO, bundle: nil)
                if let vc = storyboard.instantiateViewController(withIdentifier: ControllerIdentifier.ThingsToDoMoreFiltersViewController) as? ThingsToDoMoreFiltersViewController{
                    vc.optionList = Global.shared.toDoFilters.optionList
                    vc.optionTitle = Global.shared.toDoFilters.cusineTitle
                    vc.isForOptions = true
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            }
        }
    }
    
    func actionSearchLocation() {
        let autocompleteController = GMSAutocompleteViewController()
        autocompleteController.delegate = self
        present(autocompleteController, animated: true, completion: nil)
    }
    

}
//MARK:-GMSAutocompleteDelegate
extension ThingsTodoFilterViewController: GMSAutocompleteViewControllerDelegate {
    
    
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        print("Place name: \(place.name)")
        print("Place address: \(place.formattedAddress)")
        print("Place attributions: \(place.attributions)")
        
        Global.shared.toDoFilters.locationName = place.name
        self.locaitonCell!.configure(location: place.name)
        dismiss(animated: true, completion: nil)
    }
    
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        // TODO: handle the error.
        print("Error: ", error.localizedDescription)
    }
    
    // User canceled the operation.
    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    // Turn the network activity indicator on and off again.
    func didRequestAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func didUpdateAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
}
//MARK:- Get Open Time API
extension ThingsTodoFilterViewController{
    func getOpenTimes(type:String)  {
        
        let requestMessage:RequestMessage? = RequestMessage()
        requestMessage?.type = ""
        if let request = requestMessage{
            GCD.async(.Default){
//                GCD.async(.Main, execute: {
//                    if let container = self.mainContainer{
//                        container.startActivity()
//                    }
//                })
                let service = ThingToDoService()
                service.getOpenTime(requestMessage: request, complete: { (responseMessage) in
                    GCD.async(.Main){
                     
                        if let container = self.mainContainer{
                            container.stopActivity()
                            
                        }
                    }
                    switch responseMessage.serviceResponseType {
                        
                    case .Success:
                        GCD.async(.Main){
                            if let day = responseMessage.data as? ToDoFilterDayViewModel {
                                if(type == "ladies_nite"){
                                    
                                }else{
                                    
                                }
                            }else {
                                self.showAlertVIew(message: responseMessage.message, title: "")
                            }
                        }
                    case .Failure:
                        GCD.async(.Main){
                            self.showAlertVIew(message: responseMessage.message, title: "")
                        }
                    default:
                        GCD.async(.Main){
                            self.showAlertVIew(message: FAILED_MESSAGE, title: "")
                            
                        }
                    }
                })
            }
            
            
        }
    }
}
