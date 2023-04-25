//
//  ProductCell.swift
//  z3.4
//
//  Created by Абдулла-Бек on 20/4/23.
//

import Foundation
import UIKit

class ProductCell: UICollectionViewCell {
    
    static var reuseId = "product_cell"
    
    private lazy var productImageView: UIImageView = {
    let view = UIImageView()
    return view
    }()
    
    private lazy var productPriceLabel: UILabel = {
        let view = UILabel()
        return view
    }()
    
    private lazy var productTitleLabel: UILabel = {
    let view = UILabel()
    return view
    }()
    
    private lazy var productDescriptionLabel: UILabel = {
    let view = UILabel()
        view.numberOfLines = 0
    return view
    }()
    
    override init(frame: CGRect) {
        super.init (frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func fill(product: Product) {
        productPriceLabel.text = product.price
        productTitleLabel.text = product.title
        productDescriptionLabel.text = product.description
    }
    
    func setupSubviews () {
        
        addSubview(productImageView)
        productImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.height.equalTo(300)
        }
        
        addSubview(productPriceLabel)
        productPriceLabel.snp.makeConstraints { make in
            make.top.equalTo(productImageView.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        
        addSubview(productTitleLabel)
        productTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(productPriceLabel.snp.bottom).offset (10)
            make.centerX.equalToSuperview()
        }
        
        addSubview(productDescriptionLabel)
        productDescriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(productTitleLabel.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.bottom.equalToSuperview().offset(-10)
        }
    }
}
