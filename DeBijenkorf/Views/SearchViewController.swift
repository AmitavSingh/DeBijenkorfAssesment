//
//  ViewController.swift
//  DeBijenkorf
//
//  Created by Amitav Singh on 11/07/2022.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var textSearchField: UITextField!
    @IBOutlet weak var btnSearch: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textSearchField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }

    @IBAction func btnDidSearchTapped(_ sender: UIButton) {
        let viewModel = ProductListViewModel(searchText: textSearchField.text ?? "")
        let viewController = ProductListViewController.initWith(viewModel: viewModel)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func textFieldDidChange(){
        if(textSearchField.text?.isEmpty == true){
            btnSearch.isEnabled = false
        }else{
            btnSearch.isEnabled = true
        }
    }
    
}

