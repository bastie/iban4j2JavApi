/*
 * SPDX-License-Identifier: Apache-2.0
 */

import XCTest
import Foundation
import JavApi

@testable import iban4j2JavApi

extension org.iban4j {
  
  public class InvalidIbanValidationTest : XCTestCase{
    
    public func test_ibanValidationWithEmptyShouldThrowException() {
      do {
        try IbanUtil.validate("")
      }
      catch let error as IbanFormatException {
        switch error.getFormatViolation() {
        case .IBAN_NOT_EMPTY : // fine
          XCTAssertEqual(error.getMessage(), "Empty string can't be a valid Iban.")
        default :
          XCTAssertFalse(true,"unexpected format violation")
        }
      }
      catch {
        XCTAssertFalse(true,"unexpected error violation")
      }
    }
    
    public func test_ibanValidationWithOneCharStringShouldThrowException() {
      do {
        try IbanUtil.validate("A")
      }
      catch let error as IbanFormatException {
        switch error.getFormatViolation() {
        case .COUNTRY_CODE_TWO_LETTERS : // fine
          XCTAssertEqual(error.getMessage(), "Iban must contain 2 char country code.")
        default :
          XCTAssertFalse(true,"unexpected format violation")
        }
      }
      catch {
        XCTAssertFalse(true,"unexpected error violation")
      }
    }
    
    public func test_ibanValidationWithCountryCodeOnlyShouldThrowException() {
      do {
        try IbanUtil.validate("AT")
      }
      catch let error as IbanFormatException {
        switch error.getFormatViolation() {
        case .CHECK_DIGIT_TWO_DIGITS : // fine
          XCTAssertEqual(error.getMessage(), "Iban must contain 2 digit check digit.")
        default :
          XCTAssertFalse(true,"unexpected format violation")
        }
      }
      catch {
        XCTAssertFalse(true,"unexpected error violation")
      }
    }
    
    public func test_ibanValidationWithNonDigitCheckDigitShouldThrowException() {
      do {
        try IbanUtil.validate("AT4T")
      }
      catch let error as IbanFormatException {
        switch error.getFormatViolation() {
        case .CHECK_DIGIT_ONLY_DIGITS : // fine
          XCTAssertEqual(error.getMessage(), "Iban's check digit should contain only digits.")
        default :
          XCTAssertFalse(true,"unexpected format violation")
        }
      }
      catch {
        XCTAssertFalse(true,"unexpected error violation")
      }
    }
    
    public func test_ibanValidationWithCountryCodeAndCheckDigitOnlyShouldThrowException() {
      do {
        try IbanUtil.validate("AT48")
      }
      catch let error as IbanFormatException {
        switch error.getFormatViolation() {
        case .BBAN_LENGTH : // fine
          XCTAssertEqual(error.getMessage(), "[] length is 0, expected BBAN length is: 16")
        default :
          XCTAssertFalse(true,"unexpected format violation")
        }
      }
      catch {
        XCTAssertFalse(true,"unexpected error violation")
      }
      /*
      Matcher<IbanFormatException> bbanMatcher = is(new IbanFormatViolationMatcher(IbanFormatException.IbanFormatViolation.BBAN_LENGTH));
      Matcher<IbanFormatException> actualMatcher = is(new IbanFormatExceptionActualValueMatcher(0));
      Matcher<IbanFormatException> expectedMatcher = is(new IbanFormatExceptionExpectedValueMatcher(16));
      IbanFormatException thrown = assertThrows(IbanFormatException.class,
                                                () -> IbanUtil.validate("AT48"));
      assertThat(thrown, bbanMatcher);
      assertThat(thrown, actualMatcher);
      assertThat(thrown, expectedMatcher);
       */
    }
    
    public func test_ibanValidationWithLowercaseCountryShouldThrowException() {
      do {
        try IbanUtil.validate("at611904300234573201")
      }
      catch let error as IbanFormatException {
        switch error.getFormatViolation() {
        case .COUNTRY_CODE_UPPER_CASE_LETTERS : // fine
          XCTAssertEqual(error.getMessage(), "Iban country code must contain upper case letters.")
        default :
          XCTAssertFalse(true,"unexpected format violation")
        }
      }
      catch {
        XCTAssertFalse(true,"unexpected error violation")
      }
      /*
      Matcher<IbanFormatException> countryCodeMatcher = is(new IbanFormatViolationMatcher(IbanFormatException.IbanFormatViolation.COUNTRY_CODE_UPPER_CASE_LETTERS));
      Matcher<IbanFormatException> actualMatcher = is(new IbanFormatExceptionActualValueMatcher("at"));
      IbanFormatException thrown = assertThrows(IbanFormatException.class,
                                                () -> IbanUtil.validate(""));
      assertThat(thrown.getMessage(), containsString("Iban country code must contain upper case letters"));
      assertThat(thrown, countryCodeMatcher);
      assertThat(thrown, actualMatcher);
       */
    }
    
    public func test_ibanValidationWithEmptyCountryShouldThrowException() {
      do {
        try IbanUtil.validate(" _611904300234573201")
      }
      catch let error as IbanFormatException {
        switch error.getFormatViolation() {
        case .COUNTRY_CODE_UPPER_CASE_LETTERS : // fine
          XCTAssertEqual(error.getMessage(), "Iban country code must contain upper case letters.")
        default :
          XCTAssertFalse(true,"unexpected format violation")
        }
      }
      catch {
        XCTAssertFalse(true,"unexpected error violation")
      }
      /*
      Matcher<IbanFormatException> countryCodeMatcher = is(new IbanFormatViolationMatcher(IbanFormatException.IbanFormatViolation.COUNTRY_CODE_UPPER_CASE_LETTERS));
      Matcher<IbanFormatException> actualMatcher = is(new IbanFormatExceptionActualValueMatcher(" _"));
      IbanFormatException thrown = assertThrows(IbanFormatException.class,
                                                () -> IbanUtil.validate(" _611904300234573201"));
      assertThat(thrown.getMessage(), containsString("Iban country code must contain upper case letters"));
      assertThat(thrown, countryCodeMatcher);
      assertThat(thrown, actualMatcher);
       */
    }
    
    public func test_ibanValidationWithNonSupportedCountryShouldThrowException() {
      do {
        try IbanUtil.validate("AM611904300234573201")
      }
      catch is UnsupportedCountryException {
        XCTAssertTrue(true)
      }
      catch {
        XCTAssertFalse(true,"unexpected error")
      }
    }
    
    public func test_ibanValidationWithNonExistingCountryShouldThrowException() {
      do {
        try IbanUtil.validate("JJ611904300234573201")
      }
      catch let error as IbanFormatException {
        switch error.getFormatViolation() {
        case .COUNTRY_CODE_EXISTS : // fine
          XCTAssertEqual(error.getMessage(), "Iban contains non existing country code.")
        default :
          XCTAssertFalse(true,"unexpected format violation")
        }
      }
      catch {
        XCTAssertFalse(true,"unexpected error violation")
      }
    }
    
    public func test_ibanValidationWithInvalidCheckDigitShouldThrowException() {
      do {
        try IbanUtil.validate("AT621904300234573201")
      }
      catch let error as InvalidCheckDigitException {
        XCTAssertEqual(error.getMessage(), "AT621904300234573201 has invalid check digit: 62, expected check digit is: 61")
      }
      catch {
        XCTAssertFalse(true,"unexpected error violation")
      }
    }
    
    public func test_ibanValidationWithSpaceShouldThrowException() {
      do {
        try IbanUtil.validate("AT61 1904300234573201")
      }
      catch let error as IbanFormatException {
        XCTAssertEqual(error.getMessage().substring(20,32), "length is 17")
        XCTAssertEqual(error.getMessage().substring(34), "expected BBAN length is: 16")
      }
      catch {
        XCTAssertFalse(true,"unexpected error violation")
      }
    }
    
    public func test_ibanValidationWithInvalidLengthShouldThrowException() {
      do {
        try IbanUtil.validate("AT621904300")
      }
      catch is IbanFormatException {
        XCTAssertTrue(true)
      }
      catch {
        XCTAssertFalse(true,"unexpected error violation")
      }
    }
    
    public func test_ibanValidationWithInvalidBbanLengthShouldThrowException() {
      do {
        try IbanUtil.validate("AT61190430023457320")
      }
      catch let error as IbanFormatException {
        XCTAssertEqual(error.getMessage().substring(32,56), "expected BBAN length is:")
      }
      catch {
        XCTAssertFalse(true,"unexpected error violation")
      }
    }
    
    public func test_ibanValidationWithInvalidBankCodeShouldThrowException() {
      do {
        try IbanUtil.validate("AT611C04300234573201")
      }
      catch let error as IbanFormatException {
        XCTAssertEqual(error.getMessage().substring(8), "must contain only digits.")
      }
      catch {
        XCTAssertFalse(true,"unexpected error violation")
      }
    }
    
    public func test_ibanValidationWithInvalidAccountNumberShouldThrowException() {
      do {
        try IbanUtil.validate("DE8937040044053201300A")
      }
      catch let error as IbanFormatException {
        XCTAssertEqual(error.getMessage().substring(13), "must contain only digits.")
      }
      catch {
        XCTAssertFalse(true,"unexpected error violation")
      }
    }

    // FIXME: name vs. content from original source
    public func test_ibanValidationWithInvalidNationalCheckDigitShouldThrowException() {
      do {
        try IbanUtil.validate("IT6010542811101000000123456")
      }
      catch let error as IbanFormatException {
        XCTAssertEqual(error.getMessage().substring(4), "must contain only upper case letters.")
      }
      catch {
        XCTAssertFalse(true,"unexpected error violation")
      }
    }
    
    public func test_unformattedIbanValidationWithDefaultFormattingShouldThrowException() {
      do {
        try IbanUtil.validate("AT611904300234573201", .Default)
      }
      catch let error as IbanFormatException {
        XCTAssertEqual(error.getMessage().substring(0,51), "Iban must be formatted using 4 characters and space")
      }
      catch {
        XCTAssertFalse(true,"unexpected error violation")
      }
    }
    
    public func test_formattedIbanValidationWithNoneFormattingShouldThrowException() {
      do {
        try IbanUtil.validate("AT61 1904 3002 3457 3201")
      }
      catch let error as IbanFormatException {
        XCTAssertEqual(error.getMessage().substring(37), "expected BBAN length is: 16")
      }
      catch {
        XCTAssertFalse(true,"unexpected error violation")
      }
    }
  }
}
