//
//  DataResourceTest.swift
//  DeBijenkorfTests
//
//  Created by Amitav Singh on 20/07/2022.
//

import XCTest
@testable import DeBijenkorf

class DataResourceTest: XCTestCase {
    
    func test_ProductList_resource_With_valid_Input(){
        
        let searchString = "trui"
        let resource = ProductListResource()
        let expectations = self.expectation(description: "valid_Input")
        resource.getProductListBySearchText(searchText: searchString) { productListResponse in
            
            XCTAssertNotNil(productListResponse)
            XCTAssertNotNil(productListResponse?.data?.products)
            XCTAssertTrue((productListResponse?.data?.products!.count)! > 0)
            XCTAssertNil(productListResponse?.data?.redirectUrl)
            expectations.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func test_ProductList_resource_With_Invalid_Input(){
        
        let searchString = "damesmode"
        let resource = ProductListResource()
        let expectations = self.expectation(description: "Invalid_Input")
        resource.getProductListBySearchText(searchText: searchString) { productListResponse in
            
            XCTAssertNotNil(productListResponse)
            XCTAssertNotNil(productListResponse?.data?.redirectUrl)
            XCTAssertNil(productListResponse?.data?.products)
            expectations.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }

}
