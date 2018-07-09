//
//  ItemStore.swift
//  Homepwner
//
//  Created by USER on 2018. 7. 9..
//  Copyright © 2018년 yeongho. All rights reserved.
//

import Foundation

class ItemStore {
    
    var allItems = [Item]()
    
    init() {
        for _ in 0..<5 {
            createItem()
        }
    }
    
    @discardableResult func createItem() -> Item {
        let newItem = Item(random: true)
        
        allItems.append(newItem)
        
        return newItem
    }
    
}
