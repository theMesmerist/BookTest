//
//  APIHandler.swift
//  BooksTest
//
//  Created by Emre Karaoğlu on 28.09.2022.
//

import Foundation

final class APIHandler{
    
    static let shared = APIHandler()
    lazy var API_URL = "https://rss.applemarketingtools.com/api/v2/us/books/top-free/100/books.json"
    
    public func fetchDataFromApi(completion: @escaping (Bool,[Result]) -> ()){
        let task = URLSession.shared.dataTask(with: URL(string: API_URL)!, completionHandler: { data, response, error in
            
                guard let data = data else {
                    completion(false,[])
                    return
                }
 
                do{
                    let result: General = try JSONDecoder().decode(General.self, from: data)
                    completion(true,result.feed.results)
                }catch{
                    completion(false,[])
                }
            
        })
        
        task.resume()
        
    }
}
