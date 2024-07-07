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
  
  public class BicUtilTest : XCTestCase{
    
    public func test_bicValidationWithEmptyStringShouldThrowException() {
      do {
        try BicUtil.validate("")
      }
      catch let error as BicFormatException {
        XCTAssertEqual(error.getMessage(), "Empty string can't be a valid Bic.")
      }
      catch {
        XCTAssertFalse(true,"Unexpected error with validation of empty string")
      }
    }
    
    public func test_bicValidationWithLessCharactersShouldThrowException() {
      do {
        try BicUtil.validate("DEUTFF")
      }
      catch let error as BicFormatException {
        XCTAssertEqual(error.getMessage(), "Bic length must be 8 or 11")
      }
      catch {
        XCTAssertFalse(true,"Unexpected error with validation of empty string")
      }
    }
    
    public func test_bicValidationWithMoreCharactersShouldThrowException() {
      do {
        try BicUtil.validate("DEUTFFDEUTFF")
      }
      catch let error as BicFormatException {
        XCTAssertEqual(error.getMessage(), "Bic length must be 8 or 11")
      }
      catch {
        XCTAssertFalse(true,"Unexpected error with validation of empty string")
      }
    }
    
    public func test_bicValidationWithLowercaseShouldThrowException() {
      do {
        try BicUtil.validate("DEUTdeFF")
      }
      catch let error as BicFormatException {
        XCTAssertEqual(error.getMessage(), "Bic must contain only upper case letters.")
      }
      catch {
        XCTAssertFalse(true,"Unexpected error with validation of empty string")
      }
    }
    
    public func test_bicValidationWithInvalidBankCodeShouldThrowException() {
      do {
        try BicUtil.validate("DEU_DEFF")
      }
      catch let error as BicFormatException {
        XCTAssertEqual(error.getMessage(), "Bank code must contain only alphanumeric.")
      }
      catch {
        XCTAssertFalse(true,"Unexpected error with validation of empty string")
      }
    }
    
    public func test_bicValidationWithNonExistingCountryCodeShouldThrowException() {
      do {
        try BicUtil.validate("DEUTDDFF")
      }
      catch let error as UnsupportedCountryException {
        XCTAssertEqual(error.getMessage(), "Country code is not supported.")
      }
      catch {
        print (error)
        print (type(of: error))
        XCTAssertFalse(true,"Unexpected error with validation of empty string")
      }
    }
    
    public func test_bicValidationWithInvalidCountryCodeShouldThrowException() {
      do {
        try BicUtil.validate("DEUT_1FF")
      }
      catch let error as BicFormatException {
        XCTAssertEqual(error.getMessage(), "Bic country code must contain upper case letters")
      }
      catch {
        XCTAssertFalse(true,"Unexpected error with validation of empty string")
      }
    }
    
    public func test_bicValidationWithInvalidLocationCodeShouldThrowException() {
      do {
        try BicUtil.validate("DEUTDEF ")
      }
      catch let error as BicFormatException {
        XCTAssertEqual(error.getMessage(), "Location code must contain only letters or digits.")
      }
      catch {
        XCTAssertFalse(true,"Unexpected error with validation of empty string")
      }
    }
    
    public func test_bicValidationWithInvalidBranchCodeShouldThrowException() {
      do {
        try BicUtil.validate("DEUTDEFF50_")
      }
      catch let error as BicFormatException {
        XCTAssertEqual(error.getMessage(), "Branch code must contain only letters or digits.")
      }
      catch {
        XCTAssertFalse(true,"Unexpected error with validation of empty string")
      }
    }
    
    public func test_bicValidationWithAlphanumericBankCode() {
      XCTAssertNoThrow(try BicUtil.validate("1234DEFFXXX"))
    }
  }
}
