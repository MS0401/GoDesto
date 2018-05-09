//
//  HotelRoomListViewModel.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 08/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import Foundation

class HotelRoomListViewModel {
    var textvalue:HotelValueViewModel
    var roomList:[HotelRoomViewModel]
    
    init() {
        self.textvalue = HotelValueViewModel()
        self.roomList = [HotelRoomViewModel]()
    }
    
    convenience init(roomList:HotelRoomList) {
        self.init()
        if let text = roomList.textValue{
            self.textvalue = HotelValueViewModel(dic: text as NSDictionary)
        }
        if let list = roomList.roomList{
            for item in list{
                self.roomList.append(HotelRoomViewModel(room: item as! HoteRoom))
            }
        }
        
    }
    func getQuotesId() -> String {
        var ids = ""
        for item in self.roomList {
            if(ids.isEmpty){
                ids = item.quoteId
            }else{
                ids = ids +  "--"  + item.quoteId
            }
        }
        return ids
    }
    func getCodeId() -> String {
        var ids = ""
        for item in self.roomList {
            if(ids.isEmpty){
                ids = item.showPriceSelection
            }else{
                ids =  ids +  "--"  + item.showPriceSelection
            }
        }
        return ids
    }
    func setRoomStatus(list:[CancelationViewModel]) {
        for item in list {
            for room in self.roomList{
                if(room.quoteId == item.quoteId){
                    room.isNonRefund = true
                }
            }
        }
    }
    func getRefundableList() -> [HotelRoomViewModel] {
        var list = [HotelRoomViewModel]()
        
        for room in self.roomList{
            if(room.isNonRefund){
                list.append(room)
            }
        }
        return list
    }
    func getRoomOnlyList() ->  [HotelRoomViewModel] {
        var list = [HotelRoomViewModel]()
        
        for room in self.roomList{
            if(room.isRoomOnly){
                list.append(room)
            }
        }
        return list
    }
    func getBreakfastList() ->  [HotelRoomViewModel] {
        var list = [HotelRoomViewModel]()
        
        for room in self.roomList{
            if(!room.isRoomOnly){
                list.append(room)
            }
        }
        return list
    }
}
