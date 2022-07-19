//
//  ProductsCollectionViewCell.swift
//  DeBijenkorf
//
//  Created by Amitav Singh on 12/07/2022.
//

import UIKit

class ProductsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var productImageView: LazyImageView!
    @IBOutlet weak var labelProductName: UILabel!
    @IBOutlet weak var labelProductDescription: UILabel!
    @IBOutlet weak var labelPrice: UILabel!
    
    
    func setUp(product: Products){
        labelProductName.text = product.brand?.name
        labelProductDescription.text = product.displayName
        labelPrice.text = product.sellingPrice?.value?.toString()
        
        guard let productImage = product.currentVariantProduct?.images?[0] else {
            return
        }
        
        let imageUrl = URL(string: productImage.url!)?.sanitise
        productImageView.loadImage(imageUrl: imageUrl!, placeHolderImage: "image_not_found")
       
        
    }
}

