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
  
  public class IbanUtilTest : XCTestCase{
    
    public func test_ibanCountrySupportCheckWithSupportedCountryShouldReturnTrue() {
      XCTAssertTrue(IbanUtil.isSupportedCountry(CountryCode.BE()))
    }
    
    public func test_ibanCountrySupportCheckWithUnsupportedCountryShouldReturnFalse() {
      XCTAssertFalse(IbanUtil.isSupportedCountry(CountryCode.AM()))
    }
    
    public func test_unformattedIbanValidationWithNoneFormattingShouldNotThrowException() {
      XCTAssertNoThrow(try IbanUtil.validate("AT611904300234573201", .None))
    }
    public func test_unformattedIbanIsValidWithNoneFormattingShouldNotThrowException() {
      XCTAssertTrue(IbanUtil.isValid("AT611904300234573201", .None))
    }
    
    public func test_formattedIbanValidationWithDefaultFormattingShouldNotThrowException() {
      XCTAssertNoThrow(try IbanUtil.validate("AT61 1904 3002 3457 3201", .Default))
    }
    public func test_formattedIbanIsValidWithDefaultFormattingShouldNotThrowException() {
      XCTAssertTrue(IbanUtil.isValid("AT61 1904 3002 3457 3201", .Default))
    }
  }
}
