//
//  HotelSearchRoomTableViewCell.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 03/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit

protocol HotelSearchRoomDelegate:NSObjectProtocol {
    func actionCallBackDelete(index:Int)
    func actionCallBackAddChild(index:Int,Chlids:Int)
}
class HotelSearchRoomTableViewCell: BaseTableViewCell {
    
    @IBOutlet weak var collectionViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var txtAdults:IQDropDownTextField?
    @IBOutlet weak var txtChildren:IQDropDownTextField?
    @IBOutlet weak var lblChildAges:UILabel?
    @IBOutlet weak var btnDelete:UIButton?
    
    @IBOutlet weak var collectionView:UICollectionView?

    var room:RoomViewModel?
    var index:Int = 0
    var delegate:HotelSearchRoomDelegate?
    var selextedTexfield:UITextField?
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.txtAdults?.itemList = DropDownList.AdultsList
        self.txtChildren?.itemList = DropDownList.ChildrenList
        self.addToolBarToPickerView(textField: self.txtChildren!)
        self.addToolBarToPickerView(textField: self.txtAdults!)
        self.txtChildren?.delegate = self
        self.txtAdults?.delegate = self
        
        
    }
    func configure(room:RoomViewModel,index:Int)  {
        self.room = room
        self.index = index
        if(index == 0){
            self.btnDelete?.isHidden = true
        }else{
            self.btnDelete?.isHidden = false
        }
        if(room.childList.count == 0){
            self.lblChildAges?.isHidden = true
        }else{
            self.lblChildAges?.isHidden = false
        }
        self.txtAdults?.text = "\(self.room!.adults)"
        self.txtChildren?.text = "\(self.room!.children)"
        self.collectionView?.reloadData()
    }
    
    override func hideKeyboard() {
        self.endEditing(true)
        if let textfield = self.selextedTexfield{
            if(textfield == self.txtChildren){
                if(textfield.text!.isEmpty){
                    if let del = self.delegate{
                        del.actionCallBackAddChild(index: self.index, Chlids: 0)
                    }
                }else{
                    if let del = self.delegate{
                        del.actionCallBackAddChild(index: self.index, Chlids: Int(textfield.text!)!)
                    }
                }
                
            }
        }
    }
    @IBAction func actionDeleteRoom(_ sender:UIButton){
        if let del = self.delegate{
            del.actionCallBackDelete(index: self.index)
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension HotelSearchRoomTableViewCell:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,IQDropDownTextFieldDelegate
{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let _ = self.room{
            return self.room!.childList.count
        }else{
            return 0
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: ((ScreenSize.SCREEN_WIDTH - 60) / 2), height: 47)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCellIdentifier.HotelSearchChildCollectionViewCell, for: indexPath) as! HotelSearchChildCollectionViewCell
        cell.configure(child: self.room!.childList[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    func textField(_ textField: IQDropDownTextField!, didSelectItem item: String!) {
        self.selextedTexfield = textField
        if(textField.text!.isEmpty){
            if(self.selextedTexfield == self.txtAdults){
                self.room?.adults = 1
            }else{
                self.room?.children = 0
            }
        }else{
            if(self.selextedTexfield == self.txtAdults){
                self.room?.adults = Int(textField.text!)!
            }else{
                self.room?.children = Int(textField.text!)!
            }
        }
    }
}
