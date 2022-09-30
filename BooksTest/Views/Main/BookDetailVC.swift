//
//  BookDetailVC.swift
//  BooksTest
//
//  Created by Emre Karaoğlu on 28.09.2022.
//

import UIKit

final class BookDetailVC: UIViewController {
    
    @IBOutlet weak private var imageView: UIImageView!
    @IBOutlet weak private var label: UILabel!
    @IBOutlet weak private var authorLbl: UILabel!
    @IBOutlet weak private var dateLbl: UILabel!
    @IBOutlet weak private var favBtn: UIButton!
    public var detailObj : Result?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
        
    }
    
    private func configure(){
        checkFav()
        setupView()
    }
    
    private func setupView(){
        imageView.downloaded(from: detailObj!.artworkUrl100)
        
        label.text = detailObj?.name
        authorLbl.text = detailObj?.artistName
        dateLbl.text = detailObj?.releaseDate
    }
    
    @IBAction private func favButtonClicked(_ sender: Any) {
        
        if CoreDataHandler.shared.savedArr.contains(where: {$0.id == detailObj!.id}){
            CoreDataHandler.shared.deleteData(book: detailObj!)
            favBtn.setImage(UIImage(systemName: "star"), for: .normal)
            
        } else {
            CoreDataHandler.shared.saveToCoreData(book: detailObj!)
            favBtn.setImage(UIImage(systemName: "star.fill"), for: .normal)
         
        }
        
    }
    
    
    private func checkFav(){
        if CoreDataHandler.shared.savedArr.contains(where: {$0.id == detailObj!.id}){
            favBtn.setImage(UIImage(systemName: "star.fill"), for: .normal)
            
        } else {
            favBtn.setImage(UIImage(systemName: "star"), for: .normal)
        }
    }

}
