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

import JavApi
import Foundation

extension org.iban4j {
  
  /**
   * Bic Utility Class
   */
  public class BicUtil {
    
    private static let BIC8_LENGTH : Int = 8;
    private static let BIC11_LENGTH : Int = 11;
    
    private static let BANK_CODE_INDEX : Int = 0;
    private static let BANK_CODE_LENGTH : Int = 4;
    private static let COUNTRY_CODE_INDEX : Int = BANK_CODE_INDEX + BANK_CODE_LENGTH;
    private static let COUNTRY_CODE_LENGTH : Int = 2;
    private static let LOCATION_CODE_INDEX : Int = COUNTRY_CODE_INDEX + COUNTRY_CODE_LENGTH;
    private static let LOCATION_CODE_LENGTH : Int = 2;
    private static let BRANCH_CODE_INDEX : Int = LOCATION_CODE_INDEX + LOCATION_CODE_LENGTH;
    private static let BRANCH_CODE_LENGTH : Int = 3;
    
    /**
     * Validates bic.
     *
     * @param bic to be validated.
     * @throws BicFormatException if bic is invalid.
     *         UnsupportedCountryException if bic's country is not supported.
     */
    public static func validate(_ bic : String) throws {// BicFormatException, UnsupportedCountryException {
      do {
        try validateEmpty(bic);
        try validateLength(bic);
        try validateCase(bic);
        try validateBankCode(bic);
        try validateCountryCode(bic);
        try validateLocationCode(bic);
        
        if(hasBranchCode(bic)) {
          try validateBranchCode(bic);
        }
      }
      catch {
        throw error
      }
    }
    
    private static func validateEmpty(_ bic : String) throws{
      /* check not required in Swift
       if(bic == nil) {
       throw BicFormatException(BIC_NOT_NULL,
       "Nil can't be a valid Bic.");
       }
       */
      if(bic.count == 0) {
        throw BicFormatException.BicFormatException(BicFormatException.BicFormatViolation.BIC_NOT_EMPTY,
                                                    "Empty string can't be a valid Bic.");
      }
    }
    
    private static func validateLength(_ bic : String) throws {
      if(bic.count != BIC8_LENGTH && bic.count != BIC11_LENGTH) {
        throw BicFormatException.BicFormatException(BicFormatException.BicFormatViolation.BIC_LENGTH_8_OR_11,
                                                    "Bic length must be \(BIC8_LENGTH) or \(BIC11_LENGTH)")
      }
    }
    
    private static func validateCase(_ bic : String) throws {
      if bic != bic.uppercased() {
        throw BicFormatException.BicFormatException(BicFormatException.BicFormatViolation.BIC_ONLY_UPPER_CASE_LETTERS,
                                                    "Bic must contain only upper case letters.")
      }
    }
    
    private static func validateBankCode(_ bic : String) throws {
      let bankCode = getBankCode(bic)
      if bankCode.rangeOfCharacter(from: CharacterSet.alphanumerics.inverted) != nil {
        throw BicFormatException.BicFormatException(BicFormatException.BicFormatViolation.BANK_CODE_ONLY_ALPHANUMERIC,
                                                    "Bank code must contain only alphanumeric.");
      }
    }
    
    private static func validateCountryCode(_ bic : String) throws {
      let countryCode = getCountryCode(bic);
      if(countryCode.trim().count != COUNTRY_CODE_LENGTH ||
         countryCode.rangeOfCharacter(from: .uppercaseLetters.inverted) != nil) {
        throw BicFormatException.BicFormatException(BicFormatException.BicFormatViolation.COUNTRY_CODE_ONLY_UPPER_CASE_LETTERS,
                                                    countryCode,
                                                    "Bic country code must contain upper case letters")
      }
      
      if(CountryCode.getByCode(countryCode) == nil) {
        throw UnsupportedCountryException.UnsupportedCountryException(countryCode,
                                                                      "Country code is not supported.")
      }
    }
    
    private static func validateLocationCode(_ bic : String) throws {
      let locationCode = getLocationCode(bic)
      if locationCode.rangeOfCharacter(from: CharacterSet.alphanumerics.inverted) != nil {
        throw BicFormatException.BicFormatException(BicFormatException.BicFormatViolation.LOCATION_CODE_ONLY_LETTERS_OR_DIGITS, "Location code must contain only letters or digits.")
      }
    }
    
    private static func validateBranchCode(_ bic : String) throws {
      let branchCode = getBranchCode(bic)
      if branchCode.rangeOfCharacter(from: CharacterSet.alphanumerics.inverted) != nil {
        throw BicFormatException.BicFormatException(BicFormatException.BicFormatViolation.BRANCH_CODE_ONLY_LETTERS_OR_DIGITS, "Branch code must contain only letters or digits.")
      }
      
    }
    
    public static func getBankCode(_ bic : String) -> String {
      return bic.substring(BANK_CODE_INDEX, BANK_CODE_INDEX + BANK_CODE_LENGTH)
    }
    
    public static func getCountryCode(_ bic : String) -> String {
      return bic.substring(COUNTRY_CODE_INDEX, COUNTRY_CODE_INDEX + COUNTRY_CODE_LENGTH)
    }
    
    public static func getLocationCode(_ bic : String) -> String {
      return bic.substring(LOCATION_CODE_INDEX, LOCATION_CODE_INDEX + LOCATION_CODE_LENGTH)
    }
    
    public static func getBranchCode(_ bic : String) -> String {
      return bic.substring(BRANCH_CODE_INDEX, BRANCH_CODE_INDEX + BRANCH_CODE_LENGTH)
    }
    
    public static func hasBranchCode(_ bic : String) -> Bool{
      return bic.count == BIC11_LENGTH;
    }
  }
}
