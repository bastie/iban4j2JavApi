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
   * a string to Bic or to validate Bic's string representation, but the string does not
   * have the appropriate format.
   */
  public enum BicFormatException : Error { //extends Iban4jException {
    
    /**
     * Constructs a <code>BicFormatException</code> with no detail message.
     */
    case BicFormatException(Void)
    
    /**
     * Constructs a <code>BicFormatException</code> with the
     * specified detail message.
     *
     * @param s the detail message.
     */
    case BicFormatException(s : String)
    
    /**
     * Constructs a <code>BicFormatException</code> with the
     * specified detail message and cause.
     *
     * @param s the detail message.
     * @param t the cause.
     */
    case BicFormatException(s : String, t : Throwable)
    
    /**
     * Constructs a <code>BicFormatException</code> with the
     * specified violation, actual value, expected value and detail message.
     *
     * @param violation the violation.
     * @param actual the actual value.
     * @param expected the expected value.
     * @param s the detail message.
     */
    case BicFormatException(violation :BicFormatViolation, actual : Any, expected : Any, s: String)
    
    /**
     * Constructs a <code>BicFormatException</code> with the
     * specified violation and detail message.
     *
     * @param violation the violation.
     * @param s the detail message.
     */
    case BicFormatException(violation : BicFormatViolation, s : String)
    
    /**
     * Constructs a <code>BicFormatException</code> with the
     * specified violation, actual value and detail message.
     *
     * @param violation the violation.
     * @param actual the actual value.
     * @param s the detail message.
     */
    case BicFormatException(violation : BicFormatViolation, actual : Any, s : String)
    
    /**
     * Constructs a <code>BicFormatException</code> with the
     * specified cause.
     *
     * @param t the cause.
     */
    case BicFormatException(t : Throwable)
    
    public func getFormatViolation() -> BicFormatViolation? {
      let m = Mirror(reflecting: self).children
      for case let (_?, value) in m {
        let tupelCount = Mirror(reflecting: value).children.count
        switch tupelCount {
        case 4 :
          if let tupel : (violation:BicFormatViolation,actual:Any, expected:Any,s:String) = value as? (BicFormatViolation, Any, Any, String) {
            return tupel.violation
          }
        case 3 :
          if let tupel : (violation:BicFormatViolation,actual:Any,s:String) = value as? (BicFormatViolation, Any, String) {
            return tupel.violation
          }
        case 2 :
          let first = Mirror(reflecting: value).children.first!.value
          if first is BicFormatViolation {
            return (first as! BicFormatViolation)
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
        case 4 :
          if let tupel : (violation:BicFormatViolation,actual:Any, expected:Any,s:String) = value as? (BicFormatViolation, Any, Any, String) {
            return tupel.expected
          }
        default:
          return nil
        }
      }
      return nil;
    }
    
    public func getActual() -> Any? {
      let m = Mirror(reflecting: self).children
      for case let (_?, value) in m {
        let tupelCount = Mirror(reflecting: value).children.count
        switch tupelCount {
        case 4 :
          if let tupel : (violation:BicFormatViolation,actual:Any, expected:Any,s:String) = value as? (BicFormatViolation, Any, Any, String) {
            return tupel.actual
          }
        case 3 :
          if let tupel : (violation:BicFormatViolation,actual:Any,s:String) = value as? (BicFormatViolation, Any, String) {
            return tupel.actual
          }
        default:
          return nil
        }
      }
      return nil;
    }
    
  }
}

  extension org.iban4j.BicFormatException {
    public enum BicFormatViolation {
      case UNKNOWN
      
      case BIC_NOT_NULL
      case BIC_NOT_EMPTY
      case BIC_LENGTH_8_OR_11
      case BIC_ONLY_UPPER_CASE_LETTERS
      
      case BRANCH_CODE_ONLY_LETTERS_OR_DIGITS
      case LOCATION_CODE_ONLY_LETTERS_OR_DIGITS
      case BANK_CODE_ONLY_ALPHANUMERIC
      case COUNTRY_CODE_ONLY_UPPER_CASE_LETTERS
    }

  }
