//
//  ProductListViewController.swift
//  DeBijenkorf
//
//  Created by Amitav Singh on 11/07/2022.
//

import UIKit

class ProductListViewController: UIViewController {
    
    var viewModel: ProductListViewModel?
    var products: [Products]?


    @IBOutlet weak var collectionView: UICollectionView!
    
    static func initWith(viewModel: ProductListViewModel) -> ProductListViewController {
        let storyboard = UIStoryboard(name: StoryBoards.Main, bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier:"ProductListViewController")
            as? ProductListViewController
        {
            vc.viewModel = viewModel
            return vc
        }
        return ProductListViewController()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        addNavBarImage()
        viewModel?.searchProductWithText()
        viewModel?.delegate = self
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
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

extension ProductListViewController: ProductListViewModelDelegate{
    func didReceiveProductList(response: ProductSearchReposne) {
        products = response.data?.products
        if(products == nil){
            showLink(link: response.data?.redirectUrl ?? "www.google.com")
        }
        collectionView.reloadData()
    }
    
    
}

extension ProductListViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductsCollectionViewCell", for: indexPath) as! ProductsCollectionViewCell
        cell.setUp(product: (products?[indexPath.row])!)
        cell.layer.borderWidth = 0.5
        cell.layer.borderColor = UIColor.lightGray.cgColor
        return cell
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return products?.count ?? 0
    }
    
    func showLink(link: String){
        let linkLabel = self.collectionView.setMessage(link)
        let tap = UITapGestureRecognizer(target: self, action: #selector(labelTapped))
        linkLabel.addGestureRecognizer(tap)
    }
    
    @objc func labelTapped(sender: UITapGestureRecognizer){
        if let label = sender.view as? UILabel {
            let viewModel = WebViewViewModel(urlLink: label.text ?? "www.google.com")
            let viewController = WebViewViewController.initWith(viewModel: viewModel)
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let viewModel = ProductDetailViewModel(product: (products?[indexPath.row])!)
        let viewController = ProductDetailViewController.initWith(viewModel: viewModel)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    

    
}

extension ProductListViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 190, height: 400)
    }
    
}
