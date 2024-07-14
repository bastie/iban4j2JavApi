/*
 * SPDX-License-Identifier: Apache-2.0
 */

import XCTest
import Foundation
import JavApi

@testable import iban4j2JavApi

extension org.iban4j {
  
  public class InvalidCheckDigitCalculationTest : XCTestCase{
    
    public func test_checkDigitCalculationWithNonNumericBbanShouldThrowException() {
      let notAllowed : [Character] = ["\u{216C}", "+"]
      
      for badBoy in notAllowed {
        let errorExpected = IbanUtil.calculateCheckDigit("AT000159260\(badBoy)076545510730339")
        switch errorExpected {
        case .failure(_) :
          XCTAssertTrue(true, "expected error is the result")
        case .success(_) :
          XCTAssertNoThrow("valid result is not expected")
        }
      }
    }
  }
}
