//
//  Product.swift
//  z3.4
//
//  Created by Абдулла-Бек on 20/4/23.
//

import Foundation

struct ProductResponse: Codable {
    var products: [Product]
}

struct Product: Codable {
    var id: Int
    var title: String
    var description: String
    var price: Int
    var thumbnail: String
}

class MainModel {
    private weak var controller: MainController!
    
    private var networkManager = NetworkManager()
    
    private var products: [Product] = []
    
    private var filteredProducts: [Product] = []
    
    init(controller: MainController) {
        self.controller = controller
    }
    
    func fetchProducts() {
        networkManager.fetchProducts { result in
            self.products = result.products
            self.controller.collectionViewReloaded()
        }
    }
    
    func getProducts() -> [Product] {
        return products
    }
    
}
