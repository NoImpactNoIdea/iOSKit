//
//  HomeControllerTests.swift

import XCTest
@testable import UIKit_Template

class HomeControllerTests: XCTestCase {
    var homeController: HomeController!
    
    override func setUpWithError() throws {
        homeController = HomeController()
    }
    
    override func tearDownWithError() throws {
        homeController = nil
    }
    
    func testAddition() {
        
        let a = 10
        let b = 5
        
        let result = homeController.additionTest(numberOne: a, numberTwo: b)
        XCTAssertEqual(result, 15, "Message for the test")
    }
}
