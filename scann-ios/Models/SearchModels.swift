//
//  RecipeModels.swift
//  scann-ios
//
//  Created by George Zhuang on 8/2/20.
//  Copyright © 2020 Scann. All rights reserved.
//

import UIKit

class SearchCategory: Decodable {
    
    var name: String?
    var items: [Recipe]?
    
}

struct Recipe: Decodable {
    
    var id: Int?
    var name: String?
    var imageName: String?
    var instructions: String?
    
}

