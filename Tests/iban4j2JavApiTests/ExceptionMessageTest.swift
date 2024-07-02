/*
 * SPDX-License-Identifier: Apache-2.0
 */

import XCTest
import Foundation
import JavApi

@testable import iban4j2JavApi

extension org.iban4j {
  
  //@DisplayName("Country code Test class")
  public class ExceptionMessageTest : XCTestCase {
    public func testOnlyCountryCode () {
      let messageException = UnsupportedCountryException.UnsupportedCountryException(countryCode: "DE")
      XCTAssertEqual("DE",messageException.getCountryCode())
    }
    public func testMoreThanCountryCode () {
      let messageException = UnsupportedCountryException.UnsupportedCountryException("DE", "Nice to see you!")
      XCTAssertEqual("DE",messageException.getCountryCode())
    }
  }
}
    
