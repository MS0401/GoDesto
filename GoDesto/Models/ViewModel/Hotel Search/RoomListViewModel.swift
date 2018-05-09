//
//  RoomListViewModel.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 03/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import Foundation

class RoomListViewModel {
 
    var roomList:[RoomViewModel]
    
    
    init() {
        self.roomList = [RoomViewModel]()
        self.roomList.append(RoomViewModel())
        
    }
    
    func getGuestCount() -> Int {
        var guest = 0
        for room in self.roomList {
            guest = guest + room.adults
            guest = guest + room.children
        }
        return guest;
    }
    
    func getAllRoomCountString() -> String {
        var roomCountString = "\(self.roomList.count) Room, "
        var adult = 0
        var child = 0
        for room in self.roomList {
            adult = adult + room.adults
            child = child + room.children
        }
        roomCountString = roomCountString + "\(adult) Adults, \(child) Children"
        
        return roomCountString
        
    }
    
    func getRoomInfoList() -> [URLQueryItem] {
        var items = [URLQueryItem]()
        items.append(URLQueryItem(name: "num_rooms", value: "\(self.roomList.count)"))
        for i in 0 ..< self.roomList.count{
            var child = ""
            if(self.roomList[i].children != 0){
                child = "|\(self.roomList[i].children)"
            }
            items.append(URLQueryItem(name: "room_adults_\(i+1)", value: "\(self.roomList[i].adults)"))
            items.append(URLQueryItem(name: "room_childs_\(i+1)", value: self.roomList[i].getChildAgesString() + child))
        }
        
        print(items)
        return items
        
    }
    
    func getNumberOfRooms() -> Int {
        return self.roomList.count
    }
    
    func getNumberOfAdultsIn(room roomIndex: Int) -> Int {
        return self.roomList[roomIndex].adults
    }
    
    func getNumberOfChildrenIn(room roomIndex: Int) -> Int {
        return self.roomList[roomIndex].children
    }
    
    func getAgeOfChildIn(room roomIndex: Int, child childIndex: Int) -> Int {
        let child = self.roomList[roomIndex].childList[childIndex]
        return child.childAge
    }
}
