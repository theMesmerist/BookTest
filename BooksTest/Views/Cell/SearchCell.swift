//
//  SearchCell.swift
//  BooksTest
//
//  Created by Emre Karaoğlu on 28.09.2022.
//

import UIKit

class SearchCell: UITableViewCell {

    @IBOutlet weak var bookLbl: UILabel!
    @IBOutlet weak var bookAuthorLbl: UILabel!
    @IBOutlet weak var bookDateLbl: UILabel!
    @IBOutlet weak var searchImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setCell(book:Result){
        
        DispatchQueue.main.async {
            self.searchImg.downloaded(from: book.artworkUrl100)
        }
        
        bookLbl.text = book.name
        bookAuthorLbl.text = book.artistName
        bookDateLbl.text = book.releaseDate
        
        
        
    }

}
