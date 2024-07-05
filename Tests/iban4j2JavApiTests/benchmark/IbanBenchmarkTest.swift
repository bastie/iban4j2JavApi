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

// Note: use of default values makes 10 times not 3+1
extension org.iban4j {
  public class IbanBenchmarkTest : XCTestCase {
    
    private static let LOOPS_COUNT : UInt64 = 1_000;
    
    public func ibanConstruction() {
      measure(metrics: [XCTClockMetric()]) {
        for _ in 0..<org.iban4j.IbanBenchmarkTest.LOOPS_COUNT {
          let iban = try! Builder()
            .countryCode(CountryCode.DE())
            .bankCode("52060170")
            .accountNumber("0012335785")
            .build()
          XCTAssertNotNil(iban)
        }
      }
    }
    
    public func test_ibanValidation() {
      measure(metrics: [XCTClockMetric()]) {
        for _ in 0..<org.iban4j.IbanBenchmarkTest.LOOPS_COUNT {
          try! IbanUtil.validate("DE89370400440532013000");
        }
      }
    }
  }
}
