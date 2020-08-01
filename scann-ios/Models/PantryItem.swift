//
//  PantryItem.swift
//  scann-ios
//
//  Created by George Zhuang on 7/31/20.
//  Copyright © 2020 Scann. All rights reserved.
//

import Foundation

enum itemCategory {
    case produce, meatAndPoultry, snacks
}

struct PantryItem {
    
    var name: String!
    var category: itemCategory!
    
    init(name: String, category: itemCategory) {
        self.name = name
        self.category = category
    }
    
}
