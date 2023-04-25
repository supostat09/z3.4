//
//  ViewController.swift
//  z3.4
//
//  Created by Абдулла-Бек on 20/4/23.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var products: [Product] = []
    
    private lazy var productCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.register(ProductCell.self, forCellWithReuseIdentifier: ProductCell.reuseId)
        view.dataSource = self
        view.delegate = self
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupSubview()
        fetchProductList { result in
            self.products = result
            DispatchQueue.main.async {
                self.productCollectionView.reloadData()
            }
        }
    }
    
    private func setupSubview() {
        view.addSubview(productCollectionView)
        productCollectionView.snp.makeConstraints { make in
            make.top.bottom.left.right.equalToSuperview()
        }
    }
    
    func fetchProductList(completion: @escaping ([Product]) -> ()) {
        let url = URL(string: "https://dummyjson.com/products")
        
        let request = URLRequest(url: url!)
        
        let task = URLSession.shared.dataTask(with: request) { data, responce, error in
            
            guard let data = data, error == nil else {
                return
            }
            do {
                let dict = try JSONDecoder().decode(Dictionary<String, Product>.self, from: data)
                let result = dict.values.sorted { $0.id < $1.id }
                completion(Array(result))
                print(result)
            } catch let error {
                print(error)
            }
        }
        task.resume()
    }
}
    
extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCell.reuseId, for: indexPath) as! ProductCell
        cell.fill(product: products[indexPath.row])
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 20, height: 400)
    }
}
