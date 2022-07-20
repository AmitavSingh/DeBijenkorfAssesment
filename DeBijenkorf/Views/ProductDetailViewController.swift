//
//  ProductDetailViewController.swift
//  DeBijenkorf
//
//  Created by Amitav Singh on 19/07/2022.
//

import UIKit

class ProductDetailViewController: UIViewController {

    @IBOutlet weak var imageView: LazyImageView!
    @IBOutlet weak var labelPrice: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    var viewModel: ProductDetailViewModel?

    static func initWith(viewModel: ProductDetailViewModel) -> ProductDetailViewController {
        let storyboard = UIStoryboard(name: StoryBoards.Main, bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: StoryBoards.ProductDetailViewController)
            as? ProductDetailViewController
        {
            vc.viewModel = viewModel
            return vc
        }
        return ProductDetailViewController()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.addNavBarImage(navigationController: navigationController)
        setData()
    }
    
    func setData(){
        labelPrice.text = viewModel?.productData.sellingPrice?.value?.toString()
        labelDescription.text = viewModel?.productData.displayName
        
        guard let productImage = viewModel?.productData.currentVariantProduct?.images?[0] else {
            return
        }
        
        let imageUrl = URL(string: productImage.url!)?.makeHttps
        imageView.loadImage(imageUrl: imageUrl!, placeHolderImage: "image_not_found")
    }
}
