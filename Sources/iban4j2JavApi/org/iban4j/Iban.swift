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
   * International Bank Account Number
   *
   * <a href="http://en.wikipedia.org/wiki/ISO_13616">ISO_13616</a>.
   */
  public final class Iban : CustomStringConvertible, Equatable, Hashable {
    
    static let DEFAULT_CHECK_DIGIT = "00"
    
    // Cache string value of the iban
    private let value : String
    
    /**
     * Creates iban instance.
     *
     * @param value String
     */
    internal init(_ newValue : String) {
      self.value = newValue;
    }
    
    /**
     * Returns iban's country code.
     *
     * @return countryCode CountryCode
     */
    public func getCountryCode() -> CountryCode? {
      return CountryCode.getByCode(IbanUtil.getCountryCode(value))
    }
    
    /**
     * Returns iban's check digit.
     *
     * @return checkDigit String
     */
    public func getCheckDigit() -> String {
      return IbanUtil.getCheckDigit(value);
    }
    
    /**
     * Returns iban's account number.
     *
     * @return accountNumber String
     */
    public func getAccountNumber() -> String {
      return IbanUtil.getAccountNumber(value);
    }
    
    /**
     * Returns iban's bank code.
     *
     * @return bankCode String
     */
    public func getBankCode() -> String{
      return IbanUtil.getBankCode(value);
    }
    
    /**
     * Returns iban's branch code.
     *
     * @return branchCode String
     */
    public func getBranchCode() -> String{
      return IbanUtil.getBranchCode(value);
    }
    
    /**
     * Returns iban's national check digit.
     *
     * @return nationalCheckDigit String
     */
    public func getNationalCheckDigit() -> String{
      return IbanUtil.getNationalCheckDigit(value);
    }
    
    /**
     * Returns iban's account type.
     *
     * @return accountType String
     */
    public func getAccountType() -> String{
      return IbanUtil.getAccountType(value);
    }
    
    /**
     * Returns iban's owner account type.
     *
     * @return ownerAccountType String
     */
    public func getOwnerAccountType() -> String{
      return IbanUtil.getOwnerAccountType(value);
    }
    
    /**
     * Returns iban's identification number.
     *
     * @return identificationNumber String
     */
    public func getIdentificationNumber() -> String{
      return IbanUtil.getIdentificationNumber(value);
    }
    
    /**
     * Returns iban's bban (Basic Bank Account Number).
     *
     * @return bban String
     */
    public func getBban() -> String{
      return IbanUtil.getBban(value);
    }
    
    /**
     * Returns an Iban object holding the value of the specified String.
     *
     * @param iban the String to be parsed.
     * @return an Iban object holding the value represented by the string argument.
     * @throws IbanFormatException if the String doesn't contain parsable Iban
     *         InvalidCheckDigitException if Iban has invalid check digit
     *         UnsupportedCountryException if Iban's Country is not supported.
     *
     */
    public static func valueOf(_ iban : String) throws -> Iban {//} IbanFormatException, InvalidCheckDigitException, UnsupportedCountryException {
      do {
        try IbanUtil.validate(iban);
      }
      catch {
        throw error
      }
      return Iban(iban);
    }
    
    /**
     * Returns an Iban object holding the value of the specified String.
     *
     * @param iban the String to be parsed.
     * @param format the format of the Iban.
     * @return an Iban object holding the value represented by the string argument.
     * @throws IbanFormatException if the String doesn't contain parsable Iban
     *         InvalidCheckDigitException if Iban has invalid check digit
     *         UnsupportedCountryException if Iban's Country is not supported.
     *
     */
    public static func valueOf(_ iban : String, _ format : IbanFormat) throws -> Iban {//} IbanFormatException, InvalidCheckDigitException, UnsupportedCountryException {
      do {
        switch (format) {
        case .Default:
          let ibanWithoutSpaces = iban.replace(" ", "");
          let ibanObj = try valueOf(ibanWithoutSpaces);
          if ibanObj.toFormattedString() == iban {
            return ibanObj;
          }
          throw IbanFormatException.IbanFormatException(IbanFormatException.IbanFormatViolation.IBAN_FORMATTING,
                                                        "Iban must be formatted using 4 characters and space combination. " +
                                                        "Instead of \(iban)");
        default:
          return try valueOf(iban);
        }
      }
      catch {
        throw error
      }
    }
    
    public func toString() -> String{
      return value;
    }
    public var description: String {
      get {
        return toString()
      }
    }
    
    /**
     * Returns formatted version of Iban.
     *
     * @return A string representing formatted Iban for printing.
     */
    public func toFormattedString() -> String{
      return IbanUtil.toFormattedString(value);
    }
    
    public static func random() throws -> Iban {
      return try org.iban4j.Builder().buildRandom();
    }
    
    public static func random(_ random : java.util.Random) throws -> Iban{
      return try org.iban4j.Builder(random).buildRandom();
    }
    
    public static func random(_ cc : CountryCode) throws -> Iban {
      return try org.iban4j.Builder().setCountryCode(cc).buildRandom();
    }
    
    public func equals(_ obj : Any) -> Bool{
      if (obj is Iban) {
        return value.equals((obj as! Iban).value);
      }
      return false;
    }
    public static func == (lhs: org.iban4j.Iban, rhs: org.iban4j.Iban) -> Bool {
      return lhs.value == rhs.value
    }

    public func hashCode() -> Int{
      return value.hash;
    }
    public func hash(into hasher: inout Hasher) {
      self.value.hash(into: &hasher)
    }

  }
}
