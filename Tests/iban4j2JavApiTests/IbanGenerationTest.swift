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

import XCTest
import Foundation
import JavApi

@testable import iban4j2JavApi

extension org.iban4j {
  
  final class IbanGenerationTest : XCTestCase{
    
    public func test_ibanConstructionWithSupportedCountriesShouldReturnIban() {
      for next in TestDataHelper.getIbanData() {
        XCTAssertTrue(next.0.toString() == next.1, "the iban >>>\(next.0)<<< and expected String is >>>\(next.1)<<<")
      }
    }
    
    public func ibanConstructionWithValueOfShouldReturnIban() {
      for next in TestDataHelper.getIbanData() {
        let iban = try! Iban.valueOf(next.1)
        XCTAssertEqual(next.0, iban, "the iban >>>\(iban)<<< and expected String is >>>\(next.1)<<<")
      }
    }
  }
}
