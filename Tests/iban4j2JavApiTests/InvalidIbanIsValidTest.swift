/*
 * SPDX-License-Identifier: Apache-2.0
 */

import XCTest
import Foundation
import JavApi

@testable import iban4j2JavApi

extension org.iban4j {
  
  public class InvalidIbanIsValidTest : XCTestCase{
    
    public func test_ibanValidationWithEmptyShouldThrowException() {
      XCTAssertFalse(IbanUtil.isValid(""));
    }
    
    public func test_ibanValidationWithOneCharStringShouldThrowException() {
      XCTAssertFalse(IbanUtil.isValid("A"));
    }
    
    public func test_ibanValidationWithCountryCodeOnlyShouldThrowException() {
      XCTAssertFalse(IbanUtil.isValid("AT"));
    }
    
    public func test_ibanValidationWithNonDigitCheckDigitShouldThrowException() {
      XCTAssertFalse(IbanUtil.isValid("AT4T"));
    }
    
    public func test_ibanValidationWithCountryCodeAndCheckDigitOnlyShouldThrowException() {
      XCTAssertFalse(IbanUtil.isValid("AT48"));
    }
    
    public func test_ibanValidationWithLowercaseCountryShouldThrowException() {
      XCTAssertFalse(IbanUtil.isValid("at611904300234573201"));
    }
    
    public func test_ibanValidationWithEmptyCountryShouldThrowException() {
      XCTAssertFalse(IbanUtil.isValid("_611904300234573201"));
    }
    
    public func test_ibanValidationWithNonSupportedCountryShouldThrowException() {
      XCTAssertFalse(IbanUtil.isValid("AM611904300234573201"));
    }
    
    public func test_ibanValidationWithNonExistingCountryShouldThrowException() {
      XCTAssertFalse(IbanUtil.isValid("JJ611904300234573201"));
    }
    
    public func test_ibanValidationWithInvalidCheckDigitShouldThrowException() {
      XCTAssertFalse(IbanUtil.isValid("AT621904300234573201"));
    }
    
    public func test_ibanValidationWithSpaceShouldThrowException() {
      XCTAssertFalse(IbanUtil.isValid("AT61 1904300234573201"));
    }
    
    public func test_ibanValidationWithInvalidLengthShouldThrowException() {
      XCTAssertFalse(IbanUtil.isValid("AT621904300"));
    }
    
    public func test_ibanValidationWithInvalidBbanLengthShouldThrowException() {
      XCTAssertFalse(IbanUtil.isValid("AT61190430023457320"));
    }
    
    public func test_ibanValidationWithInvalidBankCodeShouldThrowException() {
      XCTAssertFalse(IbanUtil.isValid("AT611C04300234573201"));
    }
    
    public func test_ibanValidationWithInvalidAccountNumberShouldThrowException() {
      XCTAssertFalse(IbanUtil.isValid("DE8937040044053201300A"));
    }
    
    public func test_ibanValidationWithInvalidNationalCheckDigitShouldThrowException() {
      XCTAssertFalse(IbanUtil.isValid("IT6010542811101000000123456"));
    }
    
    public func test_unformattedIbanValidationWithDefaultFormattingShouldThrowException() {
      XCTAssertFalse(IbanUtil.isValid("AT611904300234573201",IbanFormat.Default));
    }
    
    public func test_formattedIbanValidationWithNoneFormattingShouldThrowException() {
      XCTAssertFalse(IbanUtil.isValid("AT61 1904 3002 3457 3201"));
    }
  }
}
