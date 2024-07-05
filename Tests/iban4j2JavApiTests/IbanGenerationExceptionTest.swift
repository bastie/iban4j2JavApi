/*
 * Copyright 2013 Artur Mkrtchyan
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
/*
 * SPDX-License-Identifier: Apache-2.0
 */

import XCTest
import Foundation
import JavApi

@testable import iban4j2JavApi

extension org.iban4j {
  
  public class IbanGenerationExceptionTest : XCTestCase{
    
    public func test_ibanConstructionWithNonSupportedCountryShouldThrowException() {
      do {
        _ = try Builder ()
          .countryCode(CountryCode.AM())
          .bankCode("0001")
          .branchCode("2030")
          .accountNumber("200359100100")
          .build()
      }
      catch is UnsupportedCountryException {
        XCTAssertTrue(true, "expected Exception")
      }
      catch {
        XCTAssertFalse(true)
      }
    }
    
    public func test_ibanConstructionWithInvalidCountryShouldThrowException() {
      do {
        _ = try Iban.valueOf("ZZ018786767")
      }
      catch is IbanFormatException {
        XCTAssertTrue(true, "expected Exception")
      }
      catch {
        XCTAssertFalse(true)
      }
    }
    
    public func test_ibanConstructionWithInvalidCheckDigitShouldThrowException() {
      do {
        _ = try Iban.valueOf("AT621904300234573201")
      }
      catch is InvalidCheckDigitException {
        XCTAssertTrue(true, "expected Exception")
      }
      catch {
        XCTAssertFalse(true)
      }
    }
    
    public func test_ibanConstructionWithInvalidBbanCharacterShouldThrowException() {
      do {
        _ = try Iban.valueOf("AZ21NABZ000000001370100_1944")
      }
      catch is IbanFormatException {
        XCTAssertTrue(true, "expected Exception")
      }
      catch {
        XCTAssertFalse(true)
      }
    }
    
    public func test_ibanConstructionWithDefaultButInvalidFormatShouldThrowException() {
      do {
        _ = try Iban.valueOf("AT61 1904 3002 34573201", .Default)
      }
      catch is IbanFormatException {
        XCTAssertTrue(true, "expected Exception")
      }
      catch {
        XCTAssertFalse(true)
      }
    }

    public func test_formattedIbanConstructionWithNoneFormatShouldThrowException() {
      do {
        _ = try Iban.valueOf("AT61 1904 3002 3457 3201", .None)
      }
      catch is IbanFormatException {
        XCTAssertTrue(true, "expected Exception")
      }
      catch {
        XCTAssertFalse(true)
      }
    }
    
    public func test_unformattedIbanConstructionWithDefaultFormatShouldThrowException() {
      do {
        _ = try Iban.valueOf("AT611904300234573201", .Default)
      }
      catch is IbanFormatException {
        XCTAssertTrue(true, "expected Exception")
      }
      catch {
        XCTAssertFalse(true)
      }
    }
    
    public func test_ibanConstructionWithoutCountryShouldThrowException() {
      do {
      _ = try Builder()
        .bankCode("0001")
        .branchCode("2030")
        .accountNumber("200359100100")
        .build()
      }
      catch is IbanFormatException {
        XCTAssertTrue(true, "expected Exception")
      }
      catch {
        XCTAssertFalse(true)
      }
    }
    
    public func test_ibanConstructionWithoutBankCodeShouldThrowException() {
      do {
        _ = try Builder()
        .countryCode(CountryCode.AM())
        .branchCode("2030")
        .accountNumber("200359100100")
        .build()
      }
      catch is IbanFormatException {
        XCTAssertTrue(true, "expected Exception")
      }
      catch {
        XCTAssertFalse(true)
      }
    }
    
    public func test_ibanConstructionWithoutAccountNumberShouldThrowException() {
      do {
        _ = try Builder()
          .countryCode(CountryCode.AM())
          .bankCode("0001")
          .branchCode("2030")
          .build()
      }
      catch is IbanFormatException {
        XCTAssertTrue(true, "expected Exception")
      }
      catch {
        XCTAssertFalse(true)
      }
    }

    public func test_ibanConstructionWithInvalidCharacterShouldThrowException() {
      do {
        _ = try Builder()
        .countryCode(CountryCode.AT())
        .bankCode("19043")
        .accountNumber("A0234573201")
        .build()
      }
      catch is IbanFormatException {
        XCTAssertTrue(true, "expected Exception")
      }
      catch {
        XCTAssertFalse(true)
      }
    }
    
    public func test_ibanConstructionWithShortBankCodeShouldThrowException() {
      do {
        _ = try Builder()
          .countryCode(CountryCode.AT())
          .bankCode("1904")
          .accountNumber("A0234573201")
          .build()
      }
      catch is IbanFormatException {
        XCTAssertTrue(true, "expected Exception")
      }
      catch {
        XCTAssertFalse(true)
      }
    }
    
    public func test_ibanConstructionWithShortBankCodeShouldThrowExceptionIfValidationRequested() {
      do {
        _ = try Builder()
          .countryCode(CountryCode.AT())
          .bankCode("1904")
          .accountNumber("A0234573201")
          .build(true)
      }
      catch is IbanFormatException {
        XCTAssertTrue(true, "expected Exception")
      }
      catch {
        XCTAssertFalse(true)
      }
    }
    
    
    public func test_ibanConstructionRandomAcctRetainsSpecifiedCountry() {
      var iban = try? Builder().countryCode(CountryCode.AT()).buildRandom();
      XCTAssertEqual(CountryCode.AT(), iban!.getCountryCode());
      
      iban = try? Iban.random(CountryCode.AT());
      XCTAssertEqual(CountryCode.AT(), iban!.getCountryCode());
    }
    
    
    public func test_ibanConstructionRandomRetainsSpecifiedBankCode() {
      let iban = try? Builder()
        .countryCode(CountryCode.AT())
        .bankCode("12345")
        .buildRandom();
      XCTAssertEqual("12345", iban!.getBankCode());
    }
    
    
    public func test_ibanConstructionRandomDoesNotOverwriteBankAccount() {
      let iban = try? Builder()
        .countryCode(CountryCode.AT())
        .accountNumber("12345678901")
        .buildRandom();
      XCTAssertEqual("12345678901", iban!.getAccountNumber());
    }
    
    
    public func test_ibanConstructionRandomDoesNotOverwriteBranchCode() {
      let iban = try? Builder()
        .countryCode(CountryCode.AL())
        .branchCode("1234")
        .buildRandom();
      XCTAssertEqual("1234", iban!.getBranchCode());
    }
    
    
    public func test_ibanConstructionRandomDoesNotOverwriteNationalCheckDigit() {
      let iban = try? Builder()
        .countryCode(CountryCode.AL())
        .nationalCheckDigit("1")
        .buildRandom();
      XCTAssertEqual("1", iban!.getNationalCheckDigit());
    }
    
    
    public func test_ibanConstructionRandomDoesNotOverwriteAccountType() {
      let iban = try? Builder()
        .countryCode(CountryCode.BR())
        .accountType("A")
        .buildRandom();
      XCTAssertEqual("A", iban!.getAccountType());
    }
    
    
    public func test_ibanConstructionRandomDoesNotOverwriteOwnerAccountType() {
      let iban = try? Builder()
        .countryCode(CountryCode.BR())
        .ownerAccountType("C")
        .buildRandom();
      XCTAssertEqual("C", iban!.getOwnerAccountType());
    }
    
    
    public func test_ibanConstructionRandomDoesNotOverwriteIdentificationNumber() {
      let iban = try? Builder()
        .countryCode(CountryCode.IS())
        .identificationNumber("1234567890")
        .buildRandom()
      XCTAssertEqual("1234567890", iban!.getIdentificationNumber())
    }
  }
}
