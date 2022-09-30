//
//  ViewController.swift
//  BooksTest
//
//  Created by Emre Karaoğlu on 27.09.2022.
//

import UIKit


final class MainVC: UIViewController {
    
    @IBOutlet weak private var collectionView: UICollectionView?

    lazy public var booksArr = [Result]()
    lazy public var filterArr = [Result]()
    public static let shared = MainVC()
    
    @IBOutlet weak private var activityIndicator: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
       configure()
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        collectionView?.reloadData()
    }
    
    
    @IBAction private func barBtnClicked(_ sender: Any) {
        
        let alert = UIAlertController(title: "Order", message: "Order Books", preferredStyle: .actionSheet)
           
           alert.addAction(UIAlertAction(title: "All", style: .default , handler:{ [unowned self] (UIAlertAction)in
               filterArr = booksArr
               MainVC.shared.filterArr = filterArr
               collectionView?.reloadData()
           }))
           
           alert.addAction(UIAlertAction(title: "New-Old", style: .default , handler:{ [unowned self] (UIAlertAction)in
               filterArr = filterArr.sorted(by: {$0.releaseDate.toDate()! > $1.releaseDate.toDate()!})
               MainVC.shared.filterArr = filterArr
               collectionView?.reloadData()
           }))

           alert.addAction(UIAlertAction(title: "Old-New", style: .default , handler:{ [unowned self] (UIAlertAction)in
               filterArr = filterArr.sorted(by: {$0.releaseDate.toDate()! < $1.releaseDate.toDate()!})
               MainVC.shared.filterArr = filterArr
               collectionView?.reloadData()
           }))
           
            alert.addAction(UIAlertAction(title: "Favs", style: .default, handler:{ [unowned self] (UIAlertAction)in
              
                filterArr = CoreDataHandler.shared.savedArr
                collectionView?.reloadData()
           }))
            
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler:{ [unowned self] (UIAlertAction)in
                dismiss(animated: true)
            }))

            
        
           self.present(alert, animated: true, completion: {
               
           })
        
    }

    private func configure(){
        activityIndicator.startAnimating()
        tabBarController?.tabBar.isUserInteractionEnabled = false
        getData()
        setupCollectionView()
    }
    
    private func setupCollectionView(){
        collectionView?.dataSource = self
        collectionView?.delegate = self
        collectionView?.isHidden = true
    }
   
    private func getData(){
        APIHandler.shared.fetchDataFromApi { isResult, resultArr in
            switch isResult{
            case true:
                self.booksArr = resultArr
                self.filterArr = self.booksArr
                DispatchQueue.main.async { [unowned self] in
                    tabBarController?.tabBar.isUserInteractionEnabled = true
                    activityIndicator.stopAnimating()
                    SearchVC.shared.searchArr = resultArr
                    MainVC.shared.filterArr = resultArr
                    CoreDataHandler.shared.fetchData()
                    collectionView?.isHidden = false
                    collectionView?.reloadData()
                }
               
            case false:
                print("Error")
            }
        }
        
    }
    
}

