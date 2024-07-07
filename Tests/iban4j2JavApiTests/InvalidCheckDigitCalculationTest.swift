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
        XCTAssertThrowsError(try IbanUtil.calculateCheckDigit("AT000159260\(badBoy)076545510730339"))
      }
    }
  }
}
