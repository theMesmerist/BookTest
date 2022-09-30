//
//  BookCell.swift
//  BooksTest
//
//  Created by Emre Karaoğlu on 28.09.2022.
//

import UIKit

class BookCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var favBtn: UIButton!
    @IBOutlet weak var label: UILabel!
    
    
    func setupCell(book: Result){
        
        imageView.downloaded(from: book.artworkUrl100)
        
        label.text = book.name

        contentView.layer.cornerRadius = 8
        
        
        if CoreDataHandler.shared.savedArr.contains(where: {$0.id == book.id}){
            
           
            favBtn.setImage(UIImage(systemName: "star.fill"), for: .normal)
        } else {
            
            favBtn.setImage(UIImage(systemName: "star"), for: .normal)
        }
        
    }
    
    @IBAction func favButtonClicked(_ sender: Any) {
        
        lazy var selectedObj = MainVC.shared.filterArr[(sender as AnyObject).tag]
        
        if CoreDataHandler.shared.savedArr.contains(where: {$0.id == selectedObj.id}){
            CoreDataHandler.shared.deleteData(book: selectedObj)
            print("deleted")
            
            favBtn.setImage(UIImage(systemName: "star"), for: .normal)
            
        } else {
            CoreDataHandler.shared.saveToCoreData(book: selectedObj)
            print("saved")
            
            favBtn.setImage(UIImage(systemName: "star.fill"), for: .normal)
        }

    }
   
}
