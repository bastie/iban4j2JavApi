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
   * Iban Builder Class
   */
  open class Builder {
    
    private var countryCode : CountryCode?
    private var bankCode : String?
    private var branchCode : String?
    private var nationalCheckDigit : String?
    private var accountType : String?
    private var accountNumber : String?
    private var ownerAccountType : String?
    private var identificationNumber : String?
    
    private let random : java.util.Random;
    
    /**
     * Creates an Iban Builder instance.
     */
    public init(_ random : java.util.Random) {
      self.random = random
    }
    
    /**
     * Creates an Iban Builder instance.
     */
    public init() {
      self.random = java.util.Random()
    }
    
    /**
     * Sets iban's country code.
     *
     * @param countryCode CountryCode
     * @return builder Builder
     */
    public func countryCode(_ countryCode : CountryCode ) -> Builder {
      self.countryCode = countryCode;
      return self;
    }
    
    /**
     * Sets iban's bank code.
     *
     * @param bankCode String
     * @return builder Builder
     */
    public func bankCode(_ bankCode : String) -> Builder {
      self.bankCode = bankCode;
      return self;
    }
    
    /**
     * Sets iban's branch code.
     *
     * @param branchCode String
     * @return builder Builder
     */
    public func branchCode(_ branchCode : String) -> Builder {
      self.branchCode = branchCode;
      return self;
    }
    
    /**
     * Sets iban's account number.
     *
     * @param accountNumber String
     * @return builder Builder
     */
    public func accountNumber(_ accountNumber : String) -> Builder {
      self.accountNumber = accountNumber;
      return self;
    }
    
    /**
     * Sets iban's national check digit.
     *
     * @param nationalCheckDigit String
     * @return builder Builder
     */
    public func nationalCheckDigit(_ nationalCheckDigit : String) -> Builder {
      self.nationalCheckDigit = nationalCheckDigit;
      return self;
    }
    
    /**
     * Sets iban's account type.
     *
     * @param accountType String
     * @return builder Builder
     */
    public func accountType(_ accountType : String ) -> Builder {
      self.accountType = accountType;
      return self;
    }
    
    /**
     * Sets iban's owner account type.
     *
     * @param ownerAccountType String
     * @return builder Builder
     */
    public func ownerAccountType(_ ownerAccountType : String ) -> Builder {
      self.ownerAccountType = ownerAccountType;
      return self
    }
    
    /**
     * Sets iban's identification number.
     *
     * @param identificationNumber String
     * @return builder Builder
     */
    public func identificationNumber(_ identificationNumber : String ) -> Builder {
      self.identificationNumber = identificationNumber;
      return self
    }
        
    /**
     * Builds new iban instance. This method validates the generated IBAN.
     *
     * @return new iban instance.
     * @throws IbanFormatException         if values are not parsable by Iban Specification
     *                                     <a href="http://en.wikipedia.org/wiki/ISO_13616">ISO_13616</a>
     * @throws UnsupportedCountryException if country is not supported
     */
    public func build() throws -> Iban { //} IbanFormatException, IllegalArgumentException, UnsupportedCountryException {
      return try build(true);
    }
    
    /**
     * Builds new iban instance.
     *
     * @param validate boolean indicates if the generated IBAN needs to be
     *  validated after generation
     * @return new iban instance.
     * @exception IbanFormatException if values are not parsable by Iban Specification
     *  <a href="http://en.wikipedia.org/wiki/ISO_13616">ISO_13616</a>
     * @exception UnsupportedCountryException if country is not supported
     */
    public func build(_ validate : Bool) throws  -> Iban{//IbanFormatException, IllegalArgumentException, UnsupportedCountryException {
      
      // null checks
      try require(countryCode, bankCode, accountNumber, nationalCheckDigit);
      
      // iban is formatted with default check digit.
      let formattedIban = try formatIban();
      
      let calcCheckDigit = IbanUtil.calculateCheckDigit(formattedIban);
      switch (calcCheckDigit) {
      case .failure(let error) : throw error
      case .success(let checkDigit) :
        // replace default check digit with calculated check digit
        let ibanValue = IbanUtil.replaceCheckDigit(formattedIban, checkDigit);
        
        if (validate) {
          try IbanUtil.validate(ibanValue);
        }
        return Iban(ibanValue);
      }
    }
    
    private func require(_ countryCode : CountryCode?,
                                _ bankCode : String?,
                                _ accountNumber : String?,
                                _ nationalCheckDigit : String?)
    throws {//IbanFormatException {
      if let countryCode {
        if(bankCode == nil) {
          throw IbanFormatException.IbanFormatException(IbanFormatException.IbanFormatViolation.BANK_CODE_NOT_NULL,
                                                        "bankCode is required; it cannot be null");
        }
        
        if(accountNumber == nil) {
          throw IbanFormatException.IbanFormatException(IbanFormatException.IbanFormatViolation.ACCOUNT_NUMBER_NOT_NULL,
                                                        "accountNumber is required; it cannot be null");
        }
        if (org.iban4j.bban.BbanStructure.hasNationalCheckDigit(countryCode)) {
          if (nationalCheckDigit == nil) {
            throw IbanFormatException.IbanFormatException(IbanFormatException.IbanFormatViolation.NATIONAL_CHECK_DIGIT_NOT_NULL,
                                                          "nationalCheckDigit is required; it cannot be null");
          }
        }
      }
      else {
        throw IbanFormatException.IbanFormatException(IbanFormatException.IbanFormatViolation.COUNTRY_CODE_NOT_NULL,
                                                      "countryCode is required; it cannot be null");
      }
    }
    
    /**
     * Returns formatted iban string with default check digit.
     */
    private func formatIban() throws -> String{
      if let countryCode {
        var sb = ""
        sb.append(countryCode.getAlpha2())
        sb.append(org.iban4j.Iban.DEFAULT_CHECK_DIGIT)
        sb.append(try formatBban())
        return sb
      }
      throw UnsupportedCountryException.UnsupportedCountryException("none",
                                                                    "Country code is not supported.");

    }
    
    /**
     * Returns formatted bban string.
     */
    private func formatBban() throws -> String{
      if let countryCode {
        var sb : String = ""
        let structure = org.iban4j.bban.BbanStructure.forCountry(countryCode);
        
        if let structure {
          
          for entry in structure.getEntries() {
            switch (entry.getEntryType()) {
            case .bank_code:
              sb.append(getPaddedString(bankCode ?? "", entry.getLength()));
              break;
            case .branch_code:
              sb.append(getPaddedString(branchCode ?? "", entry.getLength()));
              break;
            case .account_number:
              sb.append(getPaddedString(accountNumber ?? "", entry.getLength()));
              break;
            case .national_check_digit:
              sb.append(nationalCheckDigit ?? "");
              break;
            case .account_type:
              sb.append(accountType ?? "");
              break;
            case .owner_account_number:
              sb.append(ownerAccountType ?? "");
              break;
            case .identification_number:
              sb.append(identificationNumber ?? "");
              break;
            }
          }
          return sb;
        }
        else {
          throw UnsupportedCountryException.UnsupportedCountryException(countryCode.toString(),
                                                                        "Country code is not supported.");
        }
      }
      else {
        throw UnsupportedCountryException.UnsupportedCountryException("none",
                                                                      "Country code is not supported.");
      }
      
    }
    /**
     * Builds random iban instance.
     *
     * @return random iban instance.
     * @exception IbanFormatException if values are not parsable by Iban Specification
     *  <a href="http://en.wikipedia.org/wiki/ISO_13616">ISO_13616</a>
     * @exception UnsupportedCountryException if country is not supported
     *
     */
    open func buildRandom() throws -> Iban {//IbanFormatException, IllegalArgumentException, UnsupportedCountryException {
      
      // Create a new seeded Random, so it doesn't matter how this Random is used, it won't affect subsequent usages
      // of the original Random. (which can impact seeded behaviour when many IBANs are generated or the number of
      // IBAN entries change).
      let random : java.util.Random = java.util.Random(Int64(self.random.nextInt()));
      
      if (countryCode == nil) {
        let countryCodes = org.iban4j.bban.BbanStructure.supportedCountries();
        _ = self.countryCode(countryCodes[try! random.nextInt(countryCodes.count)])
      }
      try fillMissingFieldsRandomly(random);
      return try build();
    }
    
    private func fillMissingFieldsRandomly(_ random : java.util.Random) throws {
      if let countryCode {
        let structure = org.iban4j.bban.BbanStructure.forCountry(countryCode);
        
        if let structure {
          for entry in structure.getEntries() {
            switch (entry.getEntryType()) {
            case .bank_code:
              if (bankCode == nil) {
                try bankCode = entry.getRandom(random);
              }
              break;
            case .branch_code:
              if (branchCode == nil) {
                try branchCode = entry.getRandom(random);
              }
              break;
            case .account_number:
              if (accountNumber == nil) {
                try accountNumber = entry.getRandom(random);
              }
              break;
            case .national_check_digit:
              if (nationalCheckDigit == nil) {
                try nationalCheckDigit = entry.getRandom(random);
              }
              break;
            case .account_type:
              if (accountType == nil) {
                try accountType = entry.getRandom(random);
              }
              break;
            case .owner_account_number:
              if (ownerAccountType == nil) {
                try ownerAccountType = entry.getRandom(random);
              }
              break;
            case .identification_number:
              if (identificationNumber == nil) {
                try identificationNumber = entry.getRandom(random);
              }
              break;
            }
          }
        }
        else {
          throw UnsupportedCountryException.UnsupportedCountryException(countryCode.toString(),
                                                                        "Country code is not supported.");
        }
      }
    }


    private var enableLeftPadding : Bool = false
    /**
     * Sets iban's left zero padding flag
     *
     * @param enableLeftPadding used to determine must left pad or not, default value is false
     * @return builder Builder
     */
    public func leftPadding(_ enableLeftPadding : Bool) -> Builder{
      self.enableLeftPadding = enableLeftPadding;
      return self
    }
    
    private var padChar : Character = "0"
    /**
     * @param paddingCharacter which is going to replace the default one which is '0'
     * @return builder Builder
     */
    public func paddingCharacter(_ paddingCharacter : Character) -> Builder {
      self.padChar = paddingCharacter;
      return self
    }
    
    /**
     * @param input is the bban portion to be padded
     * @param len   is the length of the bban structure
     * @return
     */
    private func getPaddedString(_ input : String, _ len : Int) -> String{
      if (enableLeftPadding) {
        return IbanUtil.padLeft(input, len, padChar);
      }
      else {
        return input;
      }
    }
  }
}
