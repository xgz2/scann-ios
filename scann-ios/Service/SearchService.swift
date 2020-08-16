//
//  SearchService.swift
//  scann-ios
//
//  Created by George Zhuang on 8/16/20.
//  Copyright © 2020 Scann. All rights reserved.
//

import Foundation

class SearchService: NSObject {
    
        static func fetchDummyItems() -> [SearchCategory] {
            let shakshuka = makeItem(1, "shakshuka", "shakshukaImage", "Bake")
            let chickenAndBroccoli = makeItem(2, "chicken and broccoli", "candbImage", "Bake")
            let bibimbap = makeItem(3, "bibimbap", "bibimbapImage", "fry")
            
            let suggestedRecipes = SearchCategory()
            suggestedRecipes.name = "suggested recipes"
            suggestedRecipes.items = [shakshuka, chickenAndBroccoli, bibimbap]
            
            let shoprite = makeItem(1, "shoprite", "shopriteImage", "shops")
            let wegmans = makeItem(1, "wegmans", "wegmansImage", "shop")
            
            let stores = SearchCategory()
            stores.name = "stores"
            stores.items = [shoprite, wegmans]
            
            let loadedPotato = makeItem(1, "loaded potato", "loadedPotatoImage", "load")
            let cremeBrulee = makeItem(1, "creme brulee", "cremeBruleeImage", "load")
            let burger = makeItem(1, "burger", "burgerImage", "load")
            
            let allRecipes = SearchCategory()
            allRecipes.name = "all recipes"
            allRecipes.items = [loadedPotato, cremeBrulee, burger]
            
            return [suggestedRecipes, stores, allRecipes]
        }
        
        static func makeItem(_ id: Int, _ name: String, _ imageName: String, _ instructions: String) -> Recipe {
            var item = Recipe()
            item.id = id
            item.name = name
            item.imageName = imageName
            item.instructions = instructions
            return item
        }
        
    //    static func fetchPantryItems(completionHandler: @escaping ([ItemCategory]) -> ()) {
    //        let jsonUrlString = "http://localhost:1337/categories"
    //        guard let url = URL(string: jsonUrlString) else { return }
    //
    //        URLSession.shared.dataTask(with: url) { (data, response, err) in
    //            if err != nil {
    //                print(err!)
    //                return
    //            }
    //
    //            guard let data = data else { return }
    //
    //            do {
    //                let categories = try JSONDecoder().decode([ItemCategory].self, from: data)
    //                DispatchQueue.main.async(execute: {() -> Void in completionHandler(categories)})
    //            } catch let jsonErr {
    //                print("Error serializing json:", jsonErr)
    //            }
    //        }.resume()
    //    }
    
}
