//
//  APIServiceTests.swift
//  BooksTestTests
//
//  Created by Emre Karaoğlu on 30.09.2022.
//

import XCTest
@testable import BooksTest
class APIServiceTests: XCTestCase {

    var sut : APIHandler!
    
    override func setUpWithError() throws {
        sut = APIHandler()
    }
    
    func testGetApi(){
        let expectation = XCTestExpectation(description: "Downloaded")
        
        var isFetched : Bool?
        var response : [Result]?
        
        sut.fetchDataFromApi { bool, result in
            
            isFetched = bool
            response = result
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 3)
        XCTAssertTrue((isFetched != nil))
        XCTAssert((response != nil))
    }

    override func tearDownWithError() throws {
       sut = nil
    }


}
