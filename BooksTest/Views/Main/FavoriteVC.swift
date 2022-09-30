//
//  FavoriteVC.swift
//  BooksTest
//
//  Created by Emre Karaoğlu on 28.09.2022.
//

import UIKit

final class FavoriteVC: UIViewController{

    @IBOutlet weak private var tableView: UITableView!
    @IBOutlet weak private var holderLbl: UILabel!
    lazy public var favArr = [Result]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        favArr = CoreDataHandler.shared.savedArr
        setupHolder()
        tableView.reloadData()
    }
    
    private func configure(){
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func setupHolder(){
        if favArr.isEmpty{
            tableView.isHidden = true
            holderLbl.isHidden = false
            holderLbl.text = "You need to add a book to your fav list\nby clicking the star button!"
        } else {
            tableView.isHidden = false
            holderLbl.isHidden = true
        }
    }
    
   
    
}
