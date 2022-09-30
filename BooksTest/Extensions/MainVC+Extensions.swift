//
//  MainVC+Extensions.swift
//  BooksTest
//
//  Created by Emre Karaoğlu on 28.09.2022.
//

import Foundation
import UIKit

extension MainVC: UICollectionViewDelegate,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! BookCell
        
        cell.favBtn.tag = indexPath.item
        cell.setupCell(book: filterArr[indexPath.item])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filterArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let detailVC = (storyboard.instantiateViewController(withIdentifier: "BookDetail") as? BookDetailVC)!
        detailVC.hidesBottomBarWhenPushed = true
        detailVC.detailObj = filterArr[indexPath.item]
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
