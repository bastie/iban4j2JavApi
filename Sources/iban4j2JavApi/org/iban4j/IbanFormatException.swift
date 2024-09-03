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
   * Thrown to indicate that the application has attempted to convert
   * a string to Iban, but that the string does not
   * have the appropriate format.
   */
  public enum IbanFormatException : Error { //extends Iban4jException {
        
    /**
     * Constructs a <code>IbanFormatException</code> with no detail message.
     */
    case IbanFormatException(Void)
    
    /**
     * Constructs a <code>IbanFormatException</code> with the
     * specified detail message.
     *
     * @param s the detail message.
     */
    case IbanFormatException(s : String)
    
    /**
     * Constructs a <code>IbanFormatException</code> with the
     * specified detail message and cause.
     *
     * @param s the detail message.
     * @param t the cause.
     */
    case IbanFormatException(s : String, t : Throwable)
    
    /**
     * Constructs a <code>IbanFormatException</code> with the
     * specified cause.
     *
     * @param t the cause.
     */
    case IbanFormatException(t : Throwable)
    
    /**
     * Constructs a <code>IbanFormatException</code> with the
     * specified violation, actual value, expected value and detail message.
     *
     * @param violation the violation.
     * @param actual the actual value.
     * @param expected the expected value.
     * @param s the detail message.
     */
    case IbanFormatException(_ violation : IbanFormatViolation,
                             _ actual : Int,
                             _ expected : Int,
                             _ s : String)
  
    /**
     * Constructs a <code>IbanFormatException</code> with the
     * specified violation, actual value and detail message.
     *
     * @param violation the violation.
     * @param actual the actual value.
     * @param s the detail message.
     */
    case IbanFormatException(_ violation : IbanFormatViolation,
                             _ actual : String,
                             _ s : String)
    
    /**
     * Constructs a <code>IbanFormatException</code> with the
     * specified violation, entryType, actual value,
     * invalidCharacter and detail message.
     *
     * @param violation the violation.
     * @param entryType the bban entry type.
     * @param actual the actual value.
     * @param invalidCharacter the invalid character.
     * @param s the detail message.
     */
    case IbanFormatException(_ violation : IbanFormatViolation,
                             _ entryType : org.iban4j.bban.BbanEntryType?,
                             _ actual : String?,
                             _ invalidCharacter : Character,
                             _ s : String)
    
    /**
     * Constructs a <code>IbanFormatException</code> with the
     * specified violation and detail message.
     *
     * @param violation the violation.
     * @param s the detail message.
     */
    case IbanFormatException(_ violation : IbanFormatViolation, _ s: String)
    
    public func getFormatViolation() -> IbanFormatViolation? {
      let m = Mirror(reflecting: self).children
      for case let (_?, value) in m {
        let tupelCount = Mirror(reflecting: value).children.count
        switch tupelCount {
        case 5 :
          if let tupel : (violation : IbanFormatViolation,
                          entryType : org.iban4j.bban.BbanEntryType,
                          actual : Any,
                          invalidCharacter : Character,
                          s : String) = value as? (IbanFormatViolation,
                                                   org.iban4j.bban.BbanEntryType,
                                                   Any,
                                                   Character,
                                                   String) {
            return tupel.violation
          }
        case 4 :
          if let tupel : (violation : IbanFormatViolation,
                          actual : Any,
                          expected : Any,
                          s : String) = value as? (IbanFormatViolation,
                                                   Any,
                                                   Any,
                                                   String) {
            return tupel.violation
          }
        case 3 :
          if let tupel : (violation : IbanFormatViolation,
                          actual : Any,
                          s : String) = value as? (IbanFormatViolation,
                                                   Any,
                                                   String) {
            return tupel.violation
          }
        case 2:
          if let tupel : (violation : IbanFormatViolation,
                          s : String) = value as? (IbanFormatViolation,
                                                   String) {
            return tupel.violation
          }
        default:
          return nil
        }
      }
      return nil
    }
    
    public func getExpected() -> Any? {
      let m = Mirror(reflecting: self).children
      for case let (_?, value) in m {
        let tupelCount = Mirror(reflecting: value).children.count
        switch tupelCount {
        case 5 :
          return nil
        case 4 :
          if let tupel : (violation : IbanFormatViolation,
                          actual : Any,
                          expected : Any,
                          s : String) = value as? (IbanFormatViolation,
                                                   Any,
                                                   Any,
                                                   String) {
            return tupel.expected
          }
        case 3 :
          return nil
        default:
          return nil
        }
      }
      return nil
    }
    
    public func getActual() -> Any? {
      let m = Mirror(reflecting: self).children
      for case let (_?, value) in m {
        let tupelCount = Mirror(reflecting: value).children.count
        switch tupelCount {
        case 5 :
          if let tupel : (violation : IbanFormatViolation,
                          entryType : org.iban4j.bban.BbanEntryType,
                          actual : Any,
                          invalidCharacter : Character,
                          s : String) = value as? (IbanFormatViolation,
                                                   org.iban4j.bban.BbanEntryType,
                                                   Any,
                                                   Character,
                                                   String) {
            return tupel.actual
          }
        case 4 :
          if let tupel : (violation : IbanFormatViolation,
                          actual : Any,
                          expected : Any,
                          s : String) = value as? (IbanFormatViolation,
                                                   Any,
                                                   Any,
                                                   String) {
            return tupel.actual
          }
        case 3 :
          if let tupel : (violation : IbanFormatViolation,
                          actual : Any,
                          s : String) = value as? (IbanFormatViolation,
                                                   Any,
                                                   String) {
            return tupel.actual
          }
        default:
          return nil
        }
      }
      return nil
    }
    
    public func getInvalidCharacter() -> Character? {
      let m = Mirror(reflecting: self).children
      for case let (_?, value) in m {
        let tupelCount = Mirror(reflecting: value).children.count
        switch tupelCount {
        case 5 :
          if let tupel : (violation : IbanFormatViolation,
                          entryType : org.iban4j.bban.BbanEntryType,
                          actual : Any,
                          invalidCharacter : Character,
                          s : String) = value as? (IbanFormatViolation,
                                                   org.iban4j.bban.BbanEntryType,
                                                   Any,
                                                   Character,
                                                   String) {
            return tupel.invalidCharacter
          }
        default:
          return nil
        }
      }
      return nil
    }
    
    public func getMessage () -> String {
      let m = Mirror(reflecting: self).children
      var result = ""
      for case let (_?, value) in m {
        for next in Mirror(reflecting: value).children {
          if type(of: next.value) is String.Type {
            let errorMessage = next.value as! String
            result = errorMessage // bad bad thing: second string overwrite return value but it works and all that works is allowed
          }
        }
      }
      return result
    }

    public func getBbanEntryType() -> org.iban4j.bban.BbanEntryType? {
      let m = Mirror(reflecting: self).children
      for case let (_?, value) in m {
        let tupelCount = Mirror(reflecting: value).children.count
        switch tupelCount {
        case 5 :
          if let tupel : (violation : IbanFormatViolation,
                          entryType : org.iban4j.bban.BbanEntryType,
                          actual : Any,
                          invalidCharacter : Character,
                          s : String) = value as? (IbanFormatViolation,
                                                   org.iban4j.bban.BbanEntryType,
                                                   Any,
                                                   Character,
                                                   String) {
            return tupel.entryType
          }
        default:
          return nil
        }
      }
      return nil
    }
  }
}

extension org.iban4j.IbanFormatException {
  public enum IbanFormatViolation : Sendable {
    case UNKNOWN
    
    case IBAN_FORMATTING
    case IBAN_NOT_NULL
    case IBAN_NOT_EMPTY
    case IBAN_VALID_CHARACTERS
    
    case CHECK_DIGIT_ONLY_DIGITS
    case CHECK_DIGIT_TWO_DIGITS
    
    case COUNTRY_CODE_TWO_LETTERS
    case COUNTRY_CODE_UPPER_CASE_LETTERS
    case COUNTRY_CODE_EXISTS
    case COUNTRY_CODE_NOT_NULL
    
    case BBAN_LENGTH
    case BBAN_ONLY_DIGITS
    case BBAN_ONLY_UPPER_CASE_LETTERS
    case BBAN_ONLY_DIGITS_OR_LETTERS
    
    case BANK_CODE_NOT_NULL
    case ACCOUNT_NUMBER_NOT_NULL
    case NATIONAL_CHECK_DIGIT_NOT_NULL
    
  }
}
