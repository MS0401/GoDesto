//
//  GoogleMapViewController.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 06/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit

class GoogleMapViewController: BaseViewController,TopBarDelegate {

    @IBOutlet weak var viewGoogleMap:GMSMapView?
    
    var hotelList = [HotelViewModel]()
    var lat:String = "31.5204"
    var long:String = "74.3587"
    var isFromThingsToDo:Bool? = false
    var thingToDoList:[HomeInfoViewModel]?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.loadMapView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let container = self.mainContainer{
            container.lblTitle.text = "Find Hotels"
            container.lblSubTitle.text = ""
            container.btnMap.isHidden = true
            container.delegate = self
            container.showBackIcon()
        }
    }
    
    func loadMapView()  {
        let camera = GMSCameraPosition.camera(withLatitude:Double(self.lat)!, longitude:Double(self.long)!, zoom: 12.0)
        self.viewGoogleMap?.camera = camera
        self.viewGoogleMap?.delegate = self
        // self.googleMapView?.isMyLocationEnabled = true
        
        var isFramSet:Bool = false
        var tag = 0
        if(self.isFromThingsToDo!){
            for eachHotel in self.thingToDoList!
            {
                let marker = GMSMarker()
                if(eachHotel.lat.isEmpty || eachHotel.lng.isEmpty || eachHotel.lat == nil || eachHotel.lng == nil){
                    
                }else{
                    marker.position = CLLocationCoordinate2D(latitude: Double(eachHotel.lat)!, longitude: Double(eachHotel.lng)!)
                    marker.title = eachHotel.name
                    marker.userData = tag
                    //marker.setValue(tag, forKey: "id")
                    tag = tag + 1
                    marker.map = self.viewGoogleMap
                    if(!isFramSet){
                        let camera = GMSCameraPosition.camera(withLatitude:Double(eachHotel.lat)!, longitude:Double(eachHotel.lng)!, zoom: 12.0)
                        self.viewGoogleMap?.animate(to: camera)
                        isFramSet = true
                    }
                }
            }
        }else{
            for eachHotel in self.hotelList
            {
                let marker = GMSMarker()
                if(eachHotel.latitute.isEmpty || eachHotel.longitute.isEmpty || eachHotel.latitute == nil || eachHotel.longitute == nil){
                    
                }else{
                    marker.position = CLLocationCoordinate2D(latitude: Double(eachHotel.latitute)!, longitude: Double(eachHotel.longitute)!)
                    marker.title = eachHotel.name
                    marker.userData = tag
                    //marker.setValue(tag, forKey: "id")
                    tag = tag + 1
                    marker.map = self.viewGoogleMap
                    if(!isFramSet){
                        let camera = GMSCameraPosition.camera(withLatitude:Double(eachHotel.latitute)!, longitude:Double(eachHotel.longitute)!, zoom: 12.0)
                        self.viewGoogleMap?.animate(to: camera)
                        isFramSet = true
                    }
                }
            }
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
extension GoogleMapViewController:GMSMapViewDelegate,ThingToDoListingTDelegate {
    

    func mapView(_ mapView: GMSMapView, markerInfoWindow marker: GMSMarker) -> UIView? {
        if(self.isFromThingsToDo!){
            let index = marker.userData as! Int
            let myView = Bundle.main.loadNibNamed("ThingToDoListingTableViewCell", owner: nil, options: nil)![0] as! ThingToDoListingTableViewCell
            myView.configureView(thing:self.thingToDoList![index])
            myView.delegate = self
            return myView
        }else{
            let index = marker.userData as! Int
            let myView = Bundle.main.loadNibNamed("HotelTableViewCell", owner: nil, options: nil)![0] as! HotelTableViewCell
            
            myView.configure(hotel:self.hotelList[index] )
            return myView
            
        }
    }
    func actionCallBackShowDetail(thing:HomeInfoViewModel){
       
        
        let storyboard = UIStoryboard.init(name: StoryboardName.ThingsToDO, bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: ControllerIdentifier.ThingsToDoDetailViewController) as? ThingsToDoDetailViewController{
            vc.thingItem = thing
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
