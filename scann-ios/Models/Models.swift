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
    
    static func fetchPantryItems(completionHandler: @escaping ([ItemCategory]) -> ()) {
        let jsonUrlString = "http://localhost:1337/categories"
        guard let url = URL(string: jsonUrlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            if err != nil {
                print(err!)
                return
            }
            
            guard let data = data else { return }
            
            do {
                let categories = try JSONDecoder().decode([ItemCategory].self, from: data)
                DispatchQueue.main.async(execute: {() -> Void in completionHandler(categories)})
            } catch let jsonErr {
                print("Error serializing json:", jsonErr)
            }
        }.resume()
    }
    
}

struct Item: Decodable {
    
    var id: Int?
    var name: String?
    var imageName: String?
    var expiration: String?
    var category: Int?
    
}
