/*
 * SPDX-License-Identifier: Apache-2.0
 */

import XCTest
import Foundation
import JavApi

@testable import iban4j2JavApi

extension org.iban4j {
  
  public class ValidIbanValidationTest {
    
    private static func nonStandardButValidIbans() -> [(Iban,String)]{
      var data : [(Iban,String)] = []
      // adding custom validation cases.
      // iban with 01 check digit
      let first =
      (try! Builder()
        .countryCode(CountryCode.TR())
        .bankCode("00123")
        .accountNumber("0882101517977799")
        .nationalCheckDigit("0")
        .build(),
       "TR010012300882101517977799"
      )
      data.append(first)
      // iban with 98 check digit
      let second =
      (try! Builder()
        .countryCode(CountryCode.TR())
        .bankCode("00123")
        .accountNumber("0882101517977799")
        .nationalCheckDigit("0")
        .build(),
       "TR980012300882101517977799"
      )
      data.append(second)
      
      return data;
    }
    
    public func test_ibanValidationWithValidIbanShouldNotThrowException() {
      for (_, ibanString) in ValidIbanValidationTest.nonStandardButValidIbans() {
        XCTAssertNoThrow(try IbanUtil.validate(ibanString))
      }
    }
    
    public func test_ibanIsValidWithValidIbanShouldNotThrowException() {
      for (_, ibanString) in ValidIbanValidationTest.nonStandardButValidIbans() {
        XCTAssertTrue(IbanUtil.isValid(ibanString))
      }
    }
  }
}
