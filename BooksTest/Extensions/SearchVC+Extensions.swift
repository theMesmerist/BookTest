//
//  SearchVC+Extensions.swift
//  BooksTest
//
//  Created by Emre Karaoğlu on 29.09.2022.
//

import Foundation
import UIKit

extension SearchVC: UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath) as! SearchCell
        
        cell.setCell(book: filteredArr[indexPath.item])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredArr.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let detailVC = (storyboard.instantiateViewController(withIdentifier: "BookDetail") as? BookDetailVC)!
        detailVC.hidesBottomBarWhenPushed = true
        detailVC.detailObj = filteredArr[indexPath.item]
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        
        filteredArr = searchText.isEmpty ? searchArr : searchArr.filter({(dataString: Result) -> Bool in
            
            switch textForSearch{
            case 0:
                return dataString.name.lowercased().hasPrefix(searchText.lowercased())
            case 1:
                return dataString.artistName.lowercased().hasPrefix(searchText.lowercased())
            default:
                return dataString.name.lowercased().hasPrefix(searchText.lowercased())
            }
           
            })

        tableView.reloadData()
    }
}
