//
//  File.swift
//  scann-ios
//
//  Created by George Zhuang on 8/1/20.
//  Copyright © 2020 Scann. All rights reserved.
//

import UIKit

class ItemCategory: Decodable {
    
    var name: String?
    var items: [Item]?
    
}

struct Item: Decodable {
    
    var id: Int?
    var name: String?
    var imageName: String?
    var expiration: String?
    var category: Int?
    
}
