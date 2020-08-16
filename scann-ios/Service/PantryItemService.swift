//
//  PantryItemService.swift
//  scann-ios
//
//  Created by George Zhuang on 8/16/20.
//  Copyright © 2020 Scann. All rights reserved.
//
import Foundation

class PantryItemService: NSObject {
    
    static func fetchDummyItems() -> [ItemCategory] {
        let banana = makeItem(id: 1, name: "banana", imageName: "bananaImage", expiration: "Someday", category: 1)
        let apple = makeItem(id: 2, name: "apple", imageName: "appleImage", expiration: "no", category: 1)
        let broccoli = makeItem(id: 3, name: "broccoli", imageName: "broccoliImage", expiration: "no", category: 1)
        
        let produce = ItemCategory()
        produce.name = "produce"
        produce.items = [banana, apple, broccoli]
        
        let porkTenderloin = makeItem(id: 4, name: "pork tenderloin", imageName: "porkTenderloinImage", expiration: "Someday", category: 2)
        let steak = makeItem(id: 5, name: "steak", imageName: "steakImage", expiration: "Someday", category: 2)
        let chickenBreast = makeItem(id: 6, name: "chicken breast", imageName: "chickenBreastImage", expiration: "Someday", category: 2)
        let eggs = makeItem(id: 1, name: "eggs", imageName: "eggImage", expiration: "Never", category: 2)

        let meatAndFish = ItemCategory()
        meatAndFish.name = "meat and dairy"
        meatAndFish.items = [porkTenderloin, steak, chickenBreast, eggs]
        
        let limeLays = makeItem(id: 7, name: "lime lays", imageName: "limeLaysImage", expiration: "Someday", category: 3)
        let roldGoldTwists = makeItem(id: 8, name: "rold gold twists", imageName: "roldGoldTwistImage", expiration: "no", category: 3)

        let snacks = ItemCategory()
        snacks.name = "snacks"
        snacks.items = [limeLays, roldGoldTwists]
        
        return [produce, meatAndFish, snacks]
    }
    
    static func makeItem(id: Int, name: String, imageName: String, expiration: String, category: Int) -> Item {
        var newItem = Item()
        newItem.id = id
        newItem.name = name
        newItem.imageName = imageName
        newItem.expiration = expiration
        newItem.category = category
        return newItem
    }
    
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
