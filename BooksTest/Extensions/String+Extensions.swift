//
//  String+Extensions.swift
//  BooksTest
//
//  Created by Emre Karaoğlu on 29.09.2022.
//

import Foundation
import UIKit


extension String {

    func toDate() -> Date?{

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateFromString = dateFormatter.date(from: self) ?? Date()
        return dateFromString

    }
}
