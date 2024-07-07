/*
 * SPDX-License-Identifier: Apache-2.0
 */

import XCTest
import Foundation
import JavApi

@testable import iban4j2JavApi

extension org.iban4j {
  
  public class ValidCheckDigitCalculationTest : XCTestCase{
    
    public func test_checkDigitCalculationWithCountryCodeAndBbanShouldReturnCheckDigit() {
      for (iban, expectedIbanString) in TestDataHelper.getIbanData() {
        let checkDigit = try! IbanUtil.calculateCheckDigit(iban);
        XCTAssertEqual(checkDigit,expectedIbanString.substring(2, 4), "the iban ''\(iban)'' and expected String is \(expectedIbanString)")
      }
      
    }
  }
}
