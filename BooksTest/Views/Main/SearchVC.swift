//
//  SearchVC.swift
//  BooksTest
//
//  Created by Emre Karaoğlu on 28.09.2022.
//

import UIKit



final class SearchVC: UIViewController {
    
    @IBOutlet weak private var searchBar: UISearchBar!
    @IBOutlet weak public var tableView: UITableView!
    @IBOutlet weak private var changeBtn: UIButton!
    
    static public let shared = SearchVC()
    lazy public var searchArr = [Result]()
    lazy public var filteredArr = [Result]()
    lazy public var textForSearch = Int()
      
    override func viewDidLoad() {
        super.viewDidLoad()

       configure()
    }
    
    @IBAction func searchTextBtn(_ sender: Any) {
       
        textForSearch += 1
        
        if textForSearch == 1{
            changeBtn.setTitle("Author", for: .normal)
        } else {
            textForSearch = 0
            changeBtn.setTitle("Name", for: .normal)
        }
        
    }
    
    private func configure(){
        searchArr = SearchVC.shared.searchArr
        filteredArr = searchArr
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
    }
    
    
    

}
