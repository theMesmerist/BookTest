//
//  FavoriteVC+Extensions.swift
//  BooksTest
//
//  Created by Emre Karaoğlu on 29.09.2022.
//

import Foundation
import UIKit

extension FavoriteVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath) as! SearchCell
        
        cell.setCell(book: favArr[indexPath.item])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favArr.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let detailVC = (storyboard.instantiateViewController(withIdentifier: "BookDetail") as? BookDetailVC)!
        detailVC.hidesBottomBarWhenPushed = true
        detailVC.detailObj = favArr[indexPath.item]
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
}
