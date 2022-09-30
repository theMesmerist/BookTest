//
//  CoreDataHandler.swift
//  BooksTest
//
//  Created by Emre Karaoğlu on 28.09.2022.
//

import Foundation
import CoreData
import UIKit

final class CoreDataHandler{
    
    
    static let shared = CoreDataHandler()
    
    lazy var savedArr = [Result]()
    
    public func saveToCoreData(book: Result){
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
            let context = appDelegate.persistentContainer.viewContext
            let entity = NSEntityDescription.entity(forEntityName: "Book", in: context)!
            let item = NSManagedObject(entity: entity, insertInto: context)
        
        item.setValuesForKeys([
           "artworkUrl100" : book.artworkUrl100,
           "artistName" : book.artistName,
           "name" : book.name,
           "id" : book.id,
           "releaseDate" : book.releaseDate,
           "url" : book.url
        ])
         
        
        do {
            try context.save()
        } catch {
            print(error)
        }
         
         fetchData()
    }
    
    
     public func deleteData(book : Result) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<Book>(entityName: "Book")
        let sortDescriptor = NSSortDescriptor(key: "id", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        let objects = try! context.fetch(fetchRequest)
            for obj in objects {
                if obj.id == book.id{
                    context.delete(obj)
                    
                    if let index = savedArr.firstIndex(where: {$0.id == obj.id}){
                        savedArr.remove(at: index)
                    }
                    
                    
                }
            }

            do {
                try context.save()
            } catch {
              print(error)
            }
         
         fetchData()
        }
    
    
    
     public func fetchData(){
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        
        let context = appDelegate.persistentContainer.viewContext
        
         let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Book")
        
        do{
            
            let fetchResults = try context.fetch(fetchRequest)
            
            for item in fetchResults {
                
                if !savedArr.contains(where: {$0.id == item.value(forKey: "id") as! String}){
                    let savedObj = Result(artistName: item.value(forKey: "artistName") as! String,
                                          id: item.value(forKey: "id") as! String,
                                          name: item.value(forKey: "name") as! String,
                                          releaseDate: item.value(forKey: "releaseDate") as! String,
                                          url: item.value(forKey: "url") as! String,
                                          artworkUrl100: item.value(forKey: "artworkUrl100") as! String)

                    savedArr.append(savedObj)
                } else {
                    print("already added")
                }
                
               
            }
           
            
        } catch{
           
            print(error)
        }
         
         CoreDataHandler.shared.savedArr = savedArr
    }
}
