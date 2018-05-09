//
//  HotelRoomViewController.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 03/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit

class HotelRoomViewController: BaseViewController,TopBarDelegate {
    
    @IBOutlet weak var tblRoomList:UITableView?
    @IBOutlet weak var btnAddRoom:UIButton?
    @IBOutlet weak var btnConfirm:UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.btnAddRoom?.layer.cornerRadius = 5
        self.btnConfirm?.layer.cornerRadius = 5
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let container = self.mainContainer{
            container.showBackIcon()
            //container.lblMenuTitle.isHidden = false
            container.lblTitle.text = NavigationTitles.PeopleInfo
            container.lblSubTitle.isHidden = true
            // container.lblMenuTitle.text = NavigationTitles.PeopleInfo
            container.delegate = self
            container.btnMap.isHidden = true
            
        }
    }
    func actionCallBackMoveBack() {
        if let container = self.mainContainer{
            container.bottomViewHeight.constant = 60
            self.navigationController?.popViewController(animated: true)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func actionAddRoom(_ sender:UIButton) {
        Global.shared.HotelSearchRoomList.roomList.append(RoomViewModel())
        self.tblRoomList?.reloadData()
    }
    
    @IBAction func actionConfirm(_ sender:UIButton) {
        
        if let container = self.mainContainer {
            NotificationCenter.default.post(name: Notification.Name("NotificationSelectRoomInfo"), object: nil, userInfo: ["name":""])
            container.bottomViewHeight.constant = 60
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    
}
extension HotelRoomViewController:UITableViewDelegate,UITableViewDataSource,HotelSearchRoomDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Global.shared.HotelSearchRoomList.roomList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var height = 80
        let count = Global.shared.HotelSearchRoomList.roomList[indexPath.row].childList.count
        if(count > 0) {
            let devide = count / 2
            if(count % 2 == 0) {
                height = height + (devide * 44)
                return CGFloat(height + 20)
            } else {
                height = height + ((devide + 1) * 44)
                return CGFloat(height + 20)
            }
        } else {
            return CGFloat(height)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifier.HotelSearchRoomTableViewCell) as! HotelSearchRoomTableViewCell
        cell.configure(room: Global.shared.HotelSearchRoomList.roomList[indexPath.row],index:indexPath.row)
        cell.delegate = self
        return cell
    }
    
    func actionCallBackDelete(index: Int) {
        Global.shared.HotelSearchRoomList.roomList.remove(at: index)
        self.tblRoomList?.reloadData()
    }
    
    func actionCallBackAddChild(index: Int, Chlids: Int) {
        let room =  Global.shared.HotelSearchRoomList.roomList[index]
        room.addChild(childCount: Chlids)
        self.tblRoomList?.reloadData()
    }
}
