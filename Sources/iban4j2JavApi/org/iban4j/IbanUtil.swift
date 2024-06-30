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

extension org.iban4j {
  
  /**
   * Iban Utility Class
   */
  public final class IbanUtil {
    
    private static let MOD : Int = 97;
    private static let MAX : Int64 = 999999999;
    
    private static let COUNTRY_CODE_INDEX = 0;
    private static let COUNTRY_CODE_LENGTH = 2;
    private static let CHECK_DIGIT_INDEX = COUNTRY_CODE_LENGTH;
    private static let CHECK_DIGIT_LENGTH = 2;
    private static let BBAN_INDEX = CHECK_DIGIT_INDEX + CHECK_DIGIT_LENGTH;
    
    private init() {
    }
    
    /**
     * Calculates Iban
     * <a href="http://en.wikipedia.org/wiki/ISO_13616#Generating_IBAN_check_digits">Check Digit</a>.
     *
     * @param iban string value
     * @throws IbanFormatException if iban contains invalid character.
     *
     * @return check digit as String
     */
    public static func calculateCheckDigit(_ iban : String) throws -> String {//IbanFormatException {
      let reformattedIban : String = replaceCheckDigit(iban,
                                                       Iban.DEFAULT_CHECK_DIGIT);
      let modResult : Int = try calculateMod(reformattedIban);
      let checkDigitIntValue : Int = (98 - modResult);
      let checkDigit : String = "\(checkDigitIntValue)"
      return checkDigitIntValue > 9 ? checkDigit : "0" + checkDigit;
    }
    
    /**
     * Validates iban.
     *
     * @param iban to be validated.
     * @throws IbanFormatException if iban is invalid.
     *         UnsupportedCountryException if iban's country is not supported.
     *         InvalidCheckDigitException if iban has invalid check digit.
     */
    public static func validate(_ iban : String) throws {//IbanFormatException, InvalidCheckDigitException, UnsupportedCountryException {
      do {
        try validateEmpty(iban);
        try validateCountryCode(iban);
        try validateCheckDigitPresence(iban);
        
        let structure : org.iban4j.bban.BbanStructure = getBbanStructure(iban);
        
        try validateBbanLength(iban, structure);
        try validateBbanEntries(iban, structure);
        
        try validateCheckDigit(iban);
      } catch {
        throw error
      }
    }
    
    /**
     * Validates iban.
     *
     * @param iban to be validated.
     * @return true if the iban is valid
     */
    public static func isValid(_ iban :String) -> Bool {
      do {
        try validate(iban);
      } catch {
        return false;
      }
      return true;
    }
    
    /**
     * Validates iban.
     *
     * @param iban to be validated.
     * @param format to be used in validation.
     * @throws IbanFormatException if iban is invalid.
     *         UnsupportedCountryException if iban's country is not supported.
     *         InvalidCheckDigitException if iban has invalid check digit.
     */
    public static func validate(_ iban :String, _ format : IbanFormat) throws {//IbanFormatException, InvalidCheckDigitException, UnsupportedCountryException {
      switch (format) {
      case .Default:
        let ibanWithoutSpaces : String = iban.replace(" ", "");
        try validate(ibanWithoutSpaces);
        if toFormattedString(ibanWithoutSpaces) != iban {
          throw IbanFormatException.IbanFormatException(IbanFormatException.IbanFormatViolation.IBAN_FORMATTING,
                                                        "Iban must be formatted using 4 characters and space combination. " +
                                                        "Instead of \(iban)");
        }
        break;
      default:
        try validate(iban);
        break;
      }
    }
    
    /**
     * Validates iban.
     *
     * @param iban to be validated.
     * @param format to be used in validation.
     * @return true if iban is valid
     */
    public static func isValid(_ iban : String, _ format : IbanFormat) -> Bool {
      do {
        try validate(iban, format);
      } catch {
        return false;
      }
      return true;
    }
    
    /**
     * Checks whether country is supporting iban.
     * @param countryCode {@link org.iban4j.CountryCode}
     *
     * @return boolean true if country supports iban, false otherwise.
     */
    public static func isSupportedCountry(_ countryCode : CountryCode) -> Bool{
      return org.iban4j.bban.BbanStructure.forCountry(countryCode) != nil;
    }
    
    /**
     * Returns iban length for the specified country.
     *
     * @param countryCode {@link org.iban4j.CountryCode}
     * @return the length of the iban for the specified country.
     */
    public static func getIbanLength(_ countryCode : CountryCode) -> Int {
      let structure : org.iban4j.bban.BbanStructure = getBbanStructure(countryCode);
      return COUNTRY_CODE_LENGTH + CHECK_DIGIT_LENGTH + structure.getBbanLength();
    }
    
    /**
     * Returns iban's check digit.
     *
     * @param iban String
     * @return checkDigit String
     */
    public static func getCheckDigit(_ iban : String) -> String{
      return iban.substring(CHECK_DIGIT_INDEX,
                            CHECK_DIGIT_INDEX + CHECK_DIGIT_LENGTH);
    }
    
    /**
     * Returns iban's country code.
     *
     * @param iban String
     * @return countryCode String
     */
    public static func getCountryCode(_ iban : String) -> String{
      return iban.substring(COUNTRY_CODE_INDEX,
                            COUNTRY_CODE_INDEX + COUNTRY_CODE_LENGTH);
    }
    
    /**
     * Returns iban's country code and check digit.
     *
     * @param iban String
     * @return countryCodeAndCheckDigit String
     */
    public static func getCountryCodeAndCheckDigit(_ iban : String) -> String {
      return iban.substring(COUNTRY_CODE_INDEX,
                            COUNTRY_CODE_INDEX + COUNTRY_CODE_LENGTH + CHECK_DIGIT_LENGTH);
    }
    
    /**
     * Returns iban's bban (Basic Bank Account Number).
     *
     * @param iban String
     * @return bban String
     */
    public static func getBban(_ iban : String) -> String{
      return iban.substring(BBAN_INDEX);
    }
    
    /**
     * Returns iban's account number.
     *
     * @param iban String
     * @return accountNumber String
     */
    public static func getAccountNumber(_ iban : String) -> String {
      return extractBbanEntry(iban, org.iban4j.bban.BbanEntryType.account_number) ?? ""
    }
    
    /**
     * Returns iban's bank code.
     *
     * @param iban String
     * @return bankCode String
     */
    public static func getBankCode(_ iban : String) -> String {
      return extractBbanEntry(iban, org.iban4j.bban.BbanEntryType.bank_code) ?? ""
    }
    
    /**
     * Returns iban's branch code.
     *
     * @param iban String
     * @return branchCode String
     */
    static func getBranchCode(_ iban : String) ->  String {
      return extractBbanEntry(iban, org.iban4j.bban.BbanEntryType.branch_code) ?? ""
    }
    
    /**
     * Returns iban's national check digit.
     *
     * @param iban String
     * @return nationalCheckDigit String
     */
    static func getNationalCheckDigit(_ iban : String) -> String {
      return extractBbanEntry(iban, org.iban4j.bban.BbanEntryType.national_check_digit) ?? ""
    }
    
    /**
     * Returns iban's account type.
     *
     * @param iban String
     * @return accountType String
     */
    static func getAccountType(_ iban : String) -> String {
      return extractBbanEntry(iban, org.iban4j.bban.BbanEntryType.account_type) ?? ""
    }
    
    /**
     * Returns iban's owner account type.
     *
     * @param iban String
     * @return ownerAccountType String
     */
    static func getOwnerAccountType(_ iban : String) -> String {
      return extractBbanEntry(iban, org.iban4j.bban.BbanEntryType.owner_account_number) ?? ""
    }
    
    /**
     * Returns iban's identification number.
     *
     * @param iban String
     * @return identificationNumber String
     */
    static func getIdentificationNumber(_ iban : String) -> String {
      return extractBbanEntry(iban, org.iban4j.bban.BbanEntryType.identification_number) ?? ""
    }
    
    static func calculateCheckDigit(_ iban : Iban) throws -> String {
      return try calculateCheckDigit(iban.toString());
    }
    
    /**
     * Returns an iban with replaced check digit.
     *
     * @param iban The iban
     * @return The iban without the check digit
     */
    static func replaceCheckDigit(_ iban : String, _ checkDigit : String) -> String {
      return getCountryCode(iban) + checkDigit + getBban(iban);
    }
    
    /**
     * Returns formatted version of Iban.
     *
     * @return A string representing formatted Iban for printing.
     */
    static func toFormattedString(_ iban : String) -> String{
      var ibanBuffer = String(iban)
      let length = ibanBuffer.count
      
      for i in 0..<(Int(length / 4)) {
        let index = ibanBuffer.index(ibanBuffer.startIndex, offsetBy: (i + 1) * 4 + i)
        ibanBuffer.insert(" ", at: index)
        //ibanBuffer.insert((i + 1) * 4 + i, " ")
      }
      
      return ibanBuffer.trim();
    }
    
    private static func validateCheckDigit(_ iban : String) throws {
      do {
        if (try calculateMod(iban) != 1) {
          let checkDigit = getCheckDigit(iban);
          let expectedCheckDigit = try calculateCheckDigit(iban);
          throw InvalidCheckDigitException.InvalidCheckDigitException(
            checkDigit, expectedCheckDigit,
            "\(iban) has invalid check digit: \(checkDigit), " +
            "expected check digit is: \(expectedCheckDigit)")
        }
      }
      catch {
        throw error
      }
    }
    
    private static func validateEmpty(_ iban : String) throws {
      if(iban.count == 0) {
        throw IbanFormatException.IbanFormatException(IbanFormatException.IbanFormatViolation.IBAN_NOT_EMPTY,
                                                      "Empty string can't be a valid Iban.");
      }
    }
    
    private static func validateCountryCode(_ iban : String) throws {
      // check if iban contains 2 char country code
      if(iban.count < COUNTRY_CODE_LENGTH) {
        throw IbanFormatException.IbanFormatException(IbanFormatException.IbanFormatViolation.COUNTRY_CODE_TWO_LETTERS, iban,
                                                      "Iban must contain 2 char country code.");
      }
      
      let countryCode = getCountryCode(iban);
      
      // check case sensitivity
      if(!countryCode.equals(countryCode.uppercased()) ||
         !Character.isLetter(countryCode.charAt(0)) ||
         !Character.isLetter(countryCode.charAt(1))) {
        throw IbanFormatException.IbanFormatException(IbanFormatException.IbanFormatViolation.COUNTRY_CODE_UPPER_CASE_LETTERS, countryCode,
                                                      "Iban country code must contain upper case letters.");
      }
      
      if(CountryCode.getByCode(countryCode) == nil) {
        throw IbanFormatException.IbanFormatException(IbanFormatException.IbanFormatViolation.COUNTRY_CODE_EXISTS, countryCode,
                                                      "Iban contains non existing country code.");
      }
      
      // check if country is supported
      if let ccByCode = CountryCode.getByCode(countryCode) {
        let structure = org.iban4j.bban.BbanStructure.forCountry(
          ccByCode)
        if (structure == nil) {
          throw UnsupportedCountryException.UnsupportedCountryException(countryCode,
                                            "Country code is not supported.");
        }
      }
      else {
        throw UnsupportedCountryException.UnsupportedCountryException("none",
                                                                      "Country code is not supported.");
      }
    }
    
    private static func validateCheckDigitPresence(_ iban : String) throws {
      // check if iban contains 2 digit check digit
      if iban.count < COUNTRY_CODE_LENGTH + CHECK_DIGIT_LENGTH {
        throw IbanFormatException.IbanFormatException(IbanFormatException.IbanFormatViolation.CHECK_DIGIT_TWO_DIGITS,
                                                      iban.substring(COUNTRY_CODE_LENGTH),
                                                      "Iban must contain 2 digit check digit.");
      }
      
      let checkDigit = getCheckDigit(iban);
      
      // check digits
      if(!Character.isDigit(checkDigit.charAt(0)) ||
         !Character.isDigit(checkDigit.charAt(1))) {
        throw IbanFormatException.IbanFormatException(IbanFormatException.IbanFormatViolation.CHECK_DIGIT_ONLY_DIGITS, checkDigit,
                                                      "Iban's check digit should contain only digits.");
      }
    }
    
    private static func validateBbanLength(_ iban : String,
                                           _ structure : org.iban4j.bban.BbanStructure) throws {
      let expectedBbanLength : Int = structure.getBbanLength();
      let bban : String = getBban(iban);
      let bbanLength : Int = bban.count
      if (expectedBbanLength != bbanLength) {
        throw IbanFormatException.IbanFormatException(IbanFormatException.IbanFormatViolation.BBAN_LENGTH,
                                                      bbanLength, expectedBbanLength,
                                                      "[\(bban)] length is \(bbanLength), expected BBAN length is: \(expectedBbanLength)");
      }
    }
    
    private static func validateBbanEntries(_ iban : String, _ structure : org.iban4j.bban.BbanStructure) throws {
      let bban : String = getBban(iban);
      var bbanEntryOffset = 0;
      for entry in structure.getEntries() {
        let entryLength : Int = entry.getLength();
        let entryValue = bban.substring(bbanEntryOffset,
                                        bbanEntryOffset + entryLength);
        
        bbanEntryOffset = bbanEntryOffset + entryLength;
        
        // validate character type
        try validateBbanEntryCharacterType(entry, entryValue);
      }
    }
    
    private static func validateBbanEntryCharacterType(_ entry : org.iban4j.bban.BbanStructureEntry,
                                                       _ entryValue : String) throws {
      switch (entry.getCharacterType()) {
      case .a:
        for ch in entryValue.toCharArray() {
          if (!ch.isUppercase) {
            throw IbanFormatException.IbanFormatException(IbanFormatException.IbanFormatViolation.BBAN_ONLY_UPPER_CASE_LETTERS,
                                                          entry.getEntryType(), entryValue, ch,
                                                          "[\(entryValue)] must contain only upper case letters.")
          }
        }
        break;
      case .c:
        for ch in entryValue.toCharArray() {
          if (!(ch.isLetter || ch.isNumber)) {
            throw IbanFormatException.IbanFormatException(IbanFormatException.IbanFormatViolation.BBAN_ONLY_DIGITS_OR_LETTERS,
                                                          entry.getEntryType(), entryValue, ch,
                                                          "[\(entryValue)] must contain only digits or letters.")
          }
        }
        break;
      case .n:
        for ch in entryValue.toCharArray() {
          if (!ch.isNumber) {
            throw IbanFormatException.IbanFormatException(IbanFormatException.IbanFormatViolation.BBAN_ONLY_DIGITS,
                                                          entry.getEntryType(), entryValue, ch,
                                                          "[\(entryValue)] must contain only digits.")
          }
        }
      }
    }
    
    
    /**
     * Calculates
     * <a href="http://en.wikipedia.org/wiki/ISO_13616#Modulo_operation_on_IBAN">Iban Modulo</a>.
     *
     * @param iban String value
     * @return modulo 97
     */
    private static func calculateMod(_ iban : String) throws -> Int {
      let reformattedIban : String = getBban(iban) + getCountryCodeAndCheckDigit(iban);
      var total : Int64 = 0;
      for i in 0..<reformattedIban.count {
        let numericValue : Int = Int (reformattedIban.charAt(i).asciiValue ?? UInt8.max)
        if (numericValue < 0 || numericValue > 35) {
          throw IbanFormatException.IbanFormatException(IbanFormatException.IbanFormatViolation.IBAN_VALID_CHARACTERS, nil, nil,
                                                        reformattedIban.charAt(i),
                                                        "Invalid Character[\(i)] = '\(numericValue)'");
        }
        total = (numericValue > 9 ? total * 100 : total * 10) + Int64(numericValue);
        
        if (total > MAX) {
          total = (total % Int64(MOD));
        }
        
      }
      return Int(total % Int64(MOD));
    }
    
    private static func getBbanStructure(_ iban : String) -> org.iban4j.bban.BbanStructure {
      let countryCode : String = getCountryCode(iban);
      return getBbanStructure(CountryCode.getByCode(countryCode)!)
    }
    
    private static func getBbanStructure(_ countryCode : CountryCode) -> org.iban4j.bban.BbanStructure {
      return org.iban4j.bban.BbanStructure.forCountry(countryCode)!
    }
    
    private static func extractBbanEntry(_ iban : String, _ entryType : org.iban4j.bban.BbanEntryType) -> String?{
      let bban = getBban(iban);
      let structure = getBbanStructure(iban);
      var bbanEntryOffset = 0;
      for entry in structure.getEntries() {
        let entryLength = entry.getLength();
        let entryValue = bban.substring(bbanEntryOffset,
                                        bbanEntryOffset + entryLength);
        
        bbanEntryOffset = bbanEntryOffset + entryLength;
        if (entry.getEntryType() == entryType) {
          return entryValue;
        }
      }
      return nil;
    }
    
    /**
     * Left padding a string with the given character
     *
     * @param str     The string to be padded
     * @param length  The total fix length of the string
     * @param padChar The pad character
     * @return The padded string
     */
    public static func padLeft(_ str : String, _ length : Int, _ padChar : Character) -> String {
      if (str.count >= length) {
        return str;
      }
      var pad : String = ""
      for _ in 0..<length {
        pad.append(padChar);
      }
      return pad.substring(str.count) + str;
    }
    
  }
}
