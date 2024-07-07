/*
 * SPDX-License-Identifier: Apache-2.0
 */

import XCTest
import Foundation
import JavApi

@testable import iban4j2JavApi

extension org.iban4j {
  
  final class IbanLengthTest : XCTestCase{
    
    public func test_getIbanLengthShouldReturnValidLength() {
      for iban in TestDataHelper.getIbanData() {
        let lenght = IbanUtil.getIbanLength(iban.0.getCountryCode()!)
        let expectedIbanLength = iban.1.count
        XCTAssertEqual(lenght, expectedIbanLength, "the iban ''\(iban.0)'' and expected String is \(iban.1)")
      }
    }
  }
}
