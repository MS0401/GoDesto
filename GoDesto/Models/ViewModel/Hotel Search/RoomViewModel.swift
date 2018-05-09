//
//  RoomViewModel.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 03/04/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import Foundation

class RoomViewModel {
    
    var adults:Int
    var children:Int
    var childList:[ChildrenViewModel]
    
    init() {
        self.adults = 1
        self.children = 0
        self.childList = [ChildrenViewModel]()
    }
    
    func addChild(childCount:Int)  {
        if(childCount == 0){
            self.childList = [ChildrenViewModel]()
            return
        }
        var newChildList = [ChildrenViewModel]()
        for _ in 0 ..< childCount{
            newChildList.append(ChildrenViewModel())
        }
        if(newChildList.count >=  self.childList.count ){
            for i in 0 ..< self.childList.count{
                newChildList[i].childAge = self.childList[i].childAge
            }
        }else{
            for i in 0 ..< newChildList.count{
                newChildList[i].childAge = self.childList[i].childAge
            }
        }
        self.childList = newChildList
    }
    
    func getChildAgesString() -> String {
        var ages = ""
        for eachchild in self.childList{
            ages = ages + "__\(eachchild.childAge)"
        }
        return ages
    }
    
}
