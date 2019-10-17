//
//  weatherTests.swift
//  weatherTests
//
//  Created by Radharani Ribas-Valongo on 10/17/19.
//  Copyright © 2019 Radharani Ribas-Valongo. All rights reserved.
//

import XCTest
@testable import weather

class weatherTests: XCTestCase {
    
   func testWeatherJSON() {
       var data = Data()
       guard let pathToData = Bundle.main.path(forResource: "weatherSample", ofType: "json") else { fatalError("Couldn't find json file") }
       let url = URL(fileURLWithPath: pathToData)
       do {
           data = try Data(contentsOf: url)
           XCTAssertTrue(data != nil)
       } catch {
           XCTFail(error.localizedDescription)
       }
   }
    

}
