/*
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

extension org.iban4j.bban {
  
  /**
   * Bban Structure Entry representation.
   */
  public final class BbanStructureEntry : CustomStringConvertible, Sendable {
    
    private let entryType : org.iban4j.bban.BbanEntryType;
    private let characterType : EntryCharacterType;
    private let length : Int;
    
    private static let charByCharacterType : [EntryCharacterType: [Character]] = [
      EntryCharacterType.n : [
        "0","1","2","3","4","5","6","7","8","9"],
      EntryCharacterType.a : [
        "A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"],
      EntryCharacterType.c : [
        "0","1","2","3","4","5","6","7","8","9",
        "A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"
      ]
    ]
    
    private init(_ newEntryType : org.iban4j.bban.BbanEntryType, _ newCharacterType : EntryCharacterType, _ newLength : Int) {
      self.entryType = newEntryType;
      self.characterType = newCharacterType;
      self.length = newLength;
    }
    
    public static func bankCode(_ length : Int, _ characterType : Character) -> BbanStructureEntry {
      return BbanStructureEntry(org.iban4j.bban.BbanEntryType.bank_code,
                                EntryCharacterType.valueOf(String.valueOf(characterType)), length);
    }
    
    public static func branchCode(_ length : Int, _ characterType : Character) -> BbanStructureEntry {
      return BbanStructureEntry(org.iban4j.bban.BbanEntryType.branch_code,
                                EntryCharacterType.valueOf(String.valueOf(characterType)), length);
    }
    
    public static func accountNumber(_ length : Int, _ characterType : Character) -> BbanStructureEntry {
      return BbanStructureEntry(org.iban4j.bban.BbanEntryType.account_number,
                                EntryCharacterType.valueOf(String.valueOf(characterType)), length);
    }
    
    public static func nationalCheckDigit(_ length : Int, _ characterType : Character) -> BbanStructureEntry {
      return BbanStructureEntry(org.iban4j.bban.BbanEntryType.national_check_digit,
                                EntryCharacterType.valueOf(String.valueOf(characterType)), length);
    }
    
    public static func accountType(_ length : Int, _ characterType : Character) -> BbanStructureEntry {
      return BbanStructureEntry(org.iban4j.bban.BbanEntryType.account_type,
                                EntryCharacterType.valueOf(String.valueOf(characterType)), length);
    }
    
    public static func ownerAccountNumber(_ length : Int, _ characterType : Character) -> BbanStructureEntry {
      return BbanStructureEntry(org.iban4j.bban.BbanEntryType.owner_account_number,
                                EntryCharacterType.valueOf(String.valueOf(characterType)), length);
    }
    
    public static func identificationNumber(_ length : Int, _ characterType : Character) -> BbanStructureEntry {
      return BbanStructureEntry(org.iban4j.bban.BbanEntryType.identification_number,
                                EntryCharacterType.valueOf(String.valueOf(characterType)), length);
    }
    
    public func getEntryType() -> org.iban4j.bban.BbanEntryType {
      return entryType;
    }
    
    public func getCharacterType() -> EntryCharacterType {
      return characterType;
    }
    
    public func getLength() -> Int {
      return length;
    }
    
    public enum EntryCharacterType : String, Sendable {
      /**
       * Numerical digits (0-9 only)
       */
      case n = "n"
      /**
       * Alphabetical characters (A-Z only)
       */
      case a = "a"
      /**
       * Combined alphabetical (uppercase) and numeric characters (A-Z and 0-9)
       */
      case c = "c"
      
      public static func valueOf (_ char : String) -> EntryCharacterType{
        switch (char) {
        case "n" : return EntryCharacterType.n
        case "a" : return EntryCharacterType.a
        case "c" : return EntryCharacterType.c
        default:
          fatalError() //TODO: better way
        }
      }
      public func name () -> String {
        return self.rawValue
      }
    }
    
    public func getRandom() throws -> String {
      return try getRandom(java.util.Random()); // TODO: create Random Implementation in JavApi4Swift
    }
    
    public func getRandom(_ _random : java.util.Random) throws -> String {
      var random = _random
      // Create a new seeded Random, so it doesn't matter how this Random is used, it won't affect subsequent usages
      // of the original Random. (which can impact seeded behaviour when many IBANs are generated or the number of
      // IBAN entries change).
      random = java.util.Random(Int64(random.nextInt()));
      
      var s = StringBuilder();
      let charChoices : [Character]? = try org.iban4j.bban.BbanStructureEntry.charByCharacterType.get(characterType);
      if (charChoices == nil) {
        throw Throwable.RuntimeException("programmer has not implemented choices for character type \(characterType.name())");
      }
      
      for _ in 0..<getLength() {
        s = s.append(charChoices![try! random.nextInt(charChoices!.count)]);
      }
      return s.toString();
    }
    
    public func toString() -> String {
      return "BbanStructureEntry{entryType=\(entryType), characterType=\(characterType), length=\(length)}"
    }
    
    public var description: String {
      get {
        return toString()
      }
    }
  }
}
