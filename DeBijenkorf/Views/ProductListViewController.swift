//
//  ProductListViewController.swift
//  DeBijenkorf
//
//  Created by Amitav Singh on 11/07/2022.
//

import UIKit

class ProductListViewController: UIViewController {
    
    var viewModel: ProductListViewModel?

    
    static func initWith(viewModel: ProductListViewModel) -> ProductListViewController {
        let storyboard = UIStoryboard(name: StoryBoards.Main, bundle: nil)
        if let aboutYouVC = storyboard.instantiateViewController(withIdentifier:"ProductListViewController")
            as? ProductListViewController
        {
            aboutYouVC.viewModel = viewModel
            return aboutYouVC
        }
        return ProductListViewController()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.searchProductWithText()
    }
    
}
