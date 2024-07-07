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
   * Thrown to indicate that requested country is not supported.
   */
  public enum UnsupportedCountryException : Error {//}, Iban4jException {

    /**
     * Constructs a <code>UnsupportedCountryException</code> with no detail message and cause.
     */
    case UnsupportedCountryException (Void)
    
    /**
     * Constructs a <code>UnsupportedCountryException</code> with the
     * specified detail message.
     *
     * @param s the detail message.
     */
    case UnsupportedCountryException (countryCode : String)

    /**
     * Constructs a <code>UnsupportedCountryException</code> with the
     * specified country code and detail message.
     *
     * @param countryCode the country code.
     * @param s the detail message.
     */
    case UnsupportedCountryException(_ countryCode : String, _ s : String)
    
    /**
     * Constructs a <code>UnsupportedCountryException</code> with the
     * specified detail message and cause.
     *
     * @param s the detail message.
     * @param t the cause.
     */
    case UnsupportedCountryException(s : String, t : Throwable)
    
    /**
     * Constructs a <code>UnsupportedCountryException</code> with the
     * specified cause.
     *
     * @param t the cause.
     */
    case UnsupportedCountryException(t : Throwable)
    
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

    public func getCountryCode() -> String {
      let m = Mirror(reflecting: self).children
      for case let (_?, value) in m {
        if let tupel : (countryCode:String,message:String) = value as? (String, String) {
          return tupel.countryCode
        }
        else {
          if Mirror(reflecting: value).children.count == 1 {
            let single = Mirror(reflecting: value).children.first!.value
            if single is String {
              return single as! String
            }
          }
        }
        
      }
      return "" // NullPattern
    }
  }
}
