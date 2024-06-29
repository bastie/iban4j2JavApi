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
   * Business Identifier Codes (also known as SWIFT-BIC, BIC code, SWIFT ID or SWIFT code).
   *
   * <a href="http://en.wikipedia.org/wiki/ISO_9362">ISO_9362</a>.
   */
  public final class Bic : Equatable, Hashable, CustomStringConvertible {
    
    private var value : String;
    
    private init(_ newValue : String) {
      self.value = newValue;
    }
    
    /**
     * Returns a Bic object holding the value of the specified String.
     *
     * @param bic the String to be parsed.
     * @return a Bic object holding the value represented by the string argument.
     * @throws BicFormatException if the String doesn't contain parsable Bic.
     *         UnsupportedCountryException if bic's country is not supported.
     */
    public static func valueOf(_ bic : String) throws -> Bic { //BicFormatException, UnsupportedCountryException {
      try BicUtil.validate(bic);
      return Bic(bic);
    }
    
    /**
     * Returns the bank code from the Bic.
     *
     * @return string representation of Bic's institution code.
     */
    public func getBankCode() -> String{
      return BicUtil.getBankCode(value);
    }
    
    /**
     * Returns the country code from the Bic.
     *
     * @return CountryCode representation of Bic's country code.
     */
    public func getCountryCode() -> CountryCode {
      return CountryCode.getByCode(BicUtil.getCountryCode(value))!;
    }
    
    /**
     * Returns the location code from the Bic.
     *
     * @return string representation of Bic's location code.
     */
    public func getLocationCode() -> String{
      return BicUtil.getLocationCode(value);
    }
    
    /**
     * Returns the branch code from the Bic.
     *
     * @return string representation of Bic's branch code, null if Bic has no branch code.
     */
    public func getBranchCode() -> String?{
      if(BicUtil.hasBranchCode(value)) {
        return BicUtil.getBranchCode(value);
      }
      return nil;
    }
    
    
    public func equals(_ obj : Any) -> Bool {
      if (obj is Bic) {
        return value.equals((obj as! Bic).value);
      }
      return false;
    }
    public static func == (lhs: org.iban4j.Bic, rhs: org.iban4j.Bic) -> Bool {
      return lhs.value == rhs.value
    }
    
    public func hashCode() -> Int {
      return value.hashValue;
    }
    public func hash(into hasher: inout Hasher) {
      self.value.hash(into: &hasher)
    }
    public func toString() -> String {
      return value;
    }
    public var description: String {
      get {
        self.value
      }
    }
  }
}
