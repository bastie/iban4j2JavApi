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
   * Thrown to indicate that Iban's check digit is invalid
   */
  public enum InvalidCheckDigitException : Error {//} extends Iban4jException {
    
    /**
     * Constructs a <code>InvalidCheckDigitException</code> with no detail message.
     */
    case InvalidCheckDigitException(Void)
    
    /**
     * Constructs a <code>InvalidCheckDigitException</code> with the
     * specified detail message.
     *
     * @param s the detail message.
     */
    case InvalidCheckDigitException(s : String)
    
    /**
     * Constructs a <code>InvalidCheckDigitException</code> with the
     * specified actual, expected and detail message.
     *
     * @param actual the actual check digit.
     * @param expected the expected check digit.
     * @param s the detail message.
     */
    case InvalidCheckDigitException(_ actual : String, _ expected : String, _ s : String)
    
    /**
     * Constructs a <code>InvalidCheckDigitException</code> with the
     * specified detail message and cause.
     *
     * @param s the detail message.
     * @param t the cause.
     */
    case InvalidCheckDigitException(s : String, t :Throwable)
    
    /**
     * Constructs a <code>InvalidCheckDigitException</code> with the
     * specified cause.
     *
     * @param t the cause.
     */
    case InvalidCheckDigitException(t : Throwable)
        
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

    public func getActual() -> String {
      let m = Mirror(reflecting: self).children
      for case let (_, value) in m {
        if let tupel : (actual:String,expected:String,message:String) = value as? (String, String, String) {
          return tupel.actual
        }
      }
      return "" // NullPattern
    }
    
    public func getExpected() -> String {
      let m = Mirror(reflecting: self).children
      for case let (_, value) in m {
        if let tupel : (actual:String,expected:String,message:String) = value as? (String, String, String) {
          return tupel.expected
        }
      }
      return "" // NullPattern
    }
  }
}
