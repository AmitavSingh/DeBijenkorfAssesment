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
        if let vc = storyboard.instantiateViewController(withIdentifier:"ProductDetailViewController")
            as? ProductDetailViewController
        {
            vc.viewModel = viewModel
            return vc
        }
        return ProductDetailViewController()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addNavBarImage()
        labelPrice.text = viewModel?.productData.sellingPrice?.value?.toString()
        labelDescription.text = viewModel?.productData.displayName
        
        guard let productImage = viewModel?.productData.currentVariantProduct?.images?[0] else {
            return
        }
        
        let imageUrl = URL(string: productImage.url!)?.sanitise
        imageView.loadImage(imageUrl: imageUrl!, placeHolderImage: "image_not_found")
        
    }

    func addNavBarImage() {
            let navController = navigationController!
            let image = UIImage(named: "title_logo")
            let imageView = UIImageView(image: image)
            let bannerWidth = navController.navigationBar.frame.size.width
            let bannerHeight = navController.navigationBar.frame.size.height
            let bannerX = bannerWidth / 2 - (image?.size.width)! / 2
            let bannerY = bannerHeight / 2 - (image?.size.height)! / 2
            imageView.frame = CGRect(x: bannerX, y: bannerY, width: bannerWidth, height: bannerHeight)
            imageView.contentMode = .scaleAspectFit
            navigationItem.titleView = imageView
        }
}
