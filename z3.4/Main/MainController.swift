//
//  MainController.swift
//  z3.4
//
//  Created by Абдулла-Бек on 25/4/23.
//

import Foundation

class MainController {
    private weak var view: ViewController!
    
    private var model: MainModel?
    
    init(view: ViewController) {
        self.view = view
        self.model = MainModel(controller: self)
    }
    
    func fetchProducts() {
        model?.fetchProducts()
    }
    
    func getProducts() -> [Product] {
        let products = model?.getProducts()
        return products ?? []
    }
    
    func collectionViewReloaded() {
        view.reloadProductsCollectionView()
    }

}
