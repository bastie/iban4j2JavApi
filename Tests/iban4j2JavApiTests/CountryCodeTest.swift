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
  
  
  //@DisplayName("Country code Test class")
  public class CountryCodeTest : XCTestCase{
    
    public func testGetByCodeWithAlpha2CodeShouldReturnCountry() throws {
      for code in CountryCode.allCases {
        let newCode = CountryCode.getByCode(code.getAlpha2());
        XCTAssertEqual(code,newCode);
      }
    }
    
    public func testGetByCodeWithLowerCaseAlpha2CodeShouldReturnCountry() {
      for code in CountryCode.values() {
        let newCode = CountryCode.getByCode(code.getAlpha2().lowercased());
        XCTAssertEqual(code,newCode);
      }
    }
    
    public func testGetByCodeWithUpperCaseAlpha2CodeShouldReturnCountry() {
      for code in CountryCode.values() {
        let newCode = CountryCode.getByCode(code.getAlpha2().uppercased());
        XCTAssertEqual(code,newCode);
      }
    }
    
    public func testGetByCodeWithAlpha3CodeShouldReturnCountryCode() {
      for code in CountryCode.values() {
        let newCode = CountryCode.getByCode(code.getAlpha3());
        XCTAssertEqual(code,newCode);
      }
    }
    
    public func testGetByCodeWithLowerCaseAlpha3CodeShouldReturnCountry() {
      for code in CountryCode.values() {
        let newCode = CountryCode.getByCode(code.getAlpha3().lowercased());
        XCTAssertEqual(code,newCode);
      }
    }
    
    public func testGetByCodeWithUpperCaseAlpha3CodeShouldReturnCountry() {
      for code in CountryCode.values() {
        let newCode = CountryCode.getByCode(code.getAlpha3().uppercased());
        XCTAssertEqual(code,newCode);
      }
    }
    
    public func testGetByCodeWithNullCodeShouldReturnNull() {
      XCTAssertNil(CountryCode.getByCode(nil));
    }
    
    public func testGetByCodeWith4DigitCodeShouldReturnNull() {
      let code = CountryCode.getByCode("XXXX");
      XCTAssertNil(code);
    }
    
    public func testGetByCodeWithWrongAlpha2CodeShouldReturnNull() {
      let code = CountryCode.getByCode("XX");
      XCTAssertNil(code);
    }
    
    public func testGetByCodeWithWrongAlpha3CodeShouldReturnNull() {
      let code = CountryCode.getByCode("XXX");
      XCTAssertNil(code);
    }
    
    public func testGetNameWithDECodeShouldReturnGermany() {
      XCTAssertEqual("Germany",CountryCode.DE().getName());
    }
    
    public func testGetAlpha2WithDECodeShouldReturnGermany() {
      XCTAssertEqual("DE",CountryCode.DE().getAlpha2());
    }
    
    public func testGetAlpha3WithDECodeShouldReturnGermany() {
      XCTAssertEqual("DEU",CountryCode.DE().getAlpha3());
    }
    
    public func testGetAllCoutyCodes () {
      let count = CountryCode.allCases.count
      
      XCTAssertEqual(count, 250, "Fehlerhafte Anzahl der unterstützten Ländercodes")
    }
  }
}
