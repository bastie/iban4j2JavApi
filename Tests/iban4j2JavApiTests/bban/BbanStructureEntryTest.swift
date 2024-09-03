/*
 * SPDX-License-Identifier: Apache-2.0
 */

import XCTest
import Foundation
import JavApi

@testable import iban4j2JavApi

// Note: use of default values makes 10 times not 3+1
extension org.iban4j {
  
  public class BbanStructureEntryTest : XCTestCase {
    
    public func test_expectRandomAccountNumberIsDeterministicWhenSeeded() {
      let entry = org.iban4j.bban.BbanStructureEntry.accountNumber(10, "a");
      
      var seed = 1
      XCTAssertEqual(
        try! entry.getRandom(java.util.Random(Int64(seed))),
        try! entry.getRandom(java.util.Random(Int64(seed))),
        "expect that creating \(entry) with seed '\(seed)' is deterministic"
      )

      seed = 2
      XCTAssertEqual(
        try! entry.getRandom(java.util.Random(Int64(seed))),
        try! entry.getRandom(java.util.Random(Int64(seed))),
        "expect that creating \(entry) with seed '\(seed)' is deterministic"
      )
      
      seed = 3
      XCTAssertEqual(
        try! entry.getRandom(java.util.Random(Int64(seed))),
        try! entry.getRandom(java.util.Random(Int64(seed))),
        "expect that creating \(entry) with seed '\(seed)' is deterministic"
      )
    }
    
    public func test_expectRandomOwnerAccountNumberIsDeterministicWhenSeeded() {
      let entry = org.iban4j.bban.BbanStructureEntry.ownerAccountNumber(11, "n");
      
      var seed = 1
      XCTAssertEqual(
        try! entry.getRandom(java.util.Random(Int64(seed))),
        try! entry.getRandom(java.util.Random(Int64(seed))),
        "expect that creating \(entry) with seed '\(seed)' is deterministic"
      )
      
      seed = 2
      XCTAssertEqual(
        try! entry.getRandom(java.util.Random(Int64(seed))),
        try! entry.getRandom(java.util.Random(Int64(seed))),
        "expect that creating \(entry) with seed '\(seed)' is deterministic"
      )
      
      seed = 3
      XCTAssertEqual(
        try! entry.getRandom(java.util.Random(Int64(seed))),
        try! entry.getRandom(java.util.Random(Int64(seed))),
        "expect that creating \(entry) with seed '\(seed)' is deterministic"
      )
    }
    
    public func test_expectRandomBankCodeIsDeterministicWhenSeeded() {
      let entry = org.iban4j.bban.BbanStructureEntry.bankCode(12, "c");
      
      var seed = 1
      XCTAssertEqual(
        try! entry.getRandom(java.util.Random(Int64(seed))),
        try! entry.getRandom(java.util.Random(Int64(seed))),
        "expect that creating \(entry) with seed '\(seed)' is deterministic"
      )
      
      seed = 2
      XCTAssertEqual(
        try! entry.getRandom(java.util.Random(Int64(seed))),
        try! entry.getRandom(java.util.Random(Int64(seed))),
        "expect that creating \(entry) with seed '\(seed)' is deterministic"
      )
      
      seed = 3
      XCTAssertEqual(
        try! entry.getRandom(java.util.Random(Int64(seed))),
        try! entry.getRandom(java.util.Random(Int64(seed))),
        "expect that creating \(entry) with seed '\(seed)' is deterministic"
      )
    }
        
    public func test_expectRandomAlphanumericBranchCodeIsValid() {
      for _ in 0..<100 {
        let entry = org.iban4j.bban.BbanStructureEntry.branchCode(5, "c");
        
        let generated : String = try! entry.getRandom();
        
        let pattern = "[a-zA-Z0-9]+"
        let regex = try! NSRegularExpression(pattern: pattern)
        let matches = regex.matches(in: generated, range: NSRange(generated.startIndex..., in: generated))
        XCTAssertNotNil(
          matches.first,
          "expect '\(generated)' is alphabetic. (\(entry))"
        );
        XCTAssertEqual(5, entry.getLength());
      }
    }
    
    public func test_expectRandomAlphabeticNationalCheckDigitIsValid() {
      for _ in 0..<100 {
        let entry = org.iban4j.bban.BbanStructureEntry.nationalCheckDigit(6, "a");
        
        let generated : String = try! entry.getRandom();
        
        let pattern = "[A-Z]+"
        let regex = try! NSRegularExpression(pattern: pattern)
        let matches = regex.matches(in: generated, range: NSRange(generated.startIndex..., in: generated))
        XCTAssertNotNil(
          matches.first,
          "expect '\(generated)' only has capitalized letters. (\(entry))"
        );
        XCTAssertEqual(6, entry.getLength());
      }
    }
    
    public func test_expectRandomNumericIdentificationNumberIsValid() {
      for _ in 0..<100 {
        let entry = org.iban4j.bban.BbanStructureEntry.identificationNumber(7, "n");
        
        let generated : String = try! entry.getRandom();
        
        let pattern = "[0-9]+"
        let regex = try! NSRegularExpression(pattern: pattern)
        let matches = regex.matches(in: generated, range: NSRange(generated.startIndex..., in: generated))
        XCTAssertNotNil(
          matches.first,
          "expect '\(generated)' only has numbers. (\(entry))"
        );
        XCTAssertEqual(7, entry.getLength());
      }
    }
    
    public func test_expectZeroLengthEntryGeneratesZeroLengthStrings() {
      let entry = org.iban4j.bban.BbanStructureEntry.accountType(0, "n");
      for _ in 0..<100 {
        let generated = try! entry.getRandom();
        
        XCTAssertEqual(
          "",
          generated,
          "expect that entry with length=0 generates zero-length strings. (\(entry))"
        );
      }
    }
    
    public func test_expectAlphabeticEntryGeneratesAllUppercaseLetters() {
      // make sure that when generating random entries, all letters of the alphabet are used
      let entry = org.iban4j.bban.BbanStructureEntry.accountNumber(10_000, "a");
      let generated : String = try! entry.getRandom();
      
      let distinctChars : String = org.iban4j.BbanStructureEntryTest.getDistinctSortedChars(generated);
      
      XCTAssertEqual(
        "ABCDEFGHIJKLMNOPQRSTUVWXYZ",
        distinctChars
      );
    }
    
    public func test_expectNumericEntryGeneratesAllNumbers() {
      // make sure that when generating random entries, all numbers are used
      let entry = org.iban4j.bban.BbanStructureEntry.accountNumber(10_000, "n");
      let generated : String = try! entry.getRandom();
      
      let distinctChars : String = org.iban4j.BbanStructureEntryTest.getDistinctSortedChars(generated);
      
      XCTAssertEqual(
        "0123456789",
        distinctChars
      );
    }
    
    public func test_expectAlphanumericEntryGeneratesAllLettersAndNumbers() {
      // make sure that when generating random entries, all letters and numbers are used
      let entry = org.iban4j.bban.BbanStructureEntry.accountNumber(10_000, "c");
      let generated : String = try! entry.getRandom();
      
      let distinctChars : String = org.iban4j.BbanStructureEntryTest.getDistinctSortedChars(generated);
      
      XCTAssertEqual(
        "0123456789"
        //                + "abcdefghijklmnopqrstuvwxyz"
        + "ABCDEFGHIJKLMNOPQRSTUVWXYZ",
        distinctChars
      );
    }
    
    private static func getDistinctSortedChars(_ s : String) -> String {
      let sortedDistinct = Array(Set(s.toCharArray())).sorted()
      return String(sortedDistinct)
      /*
       Stream<Character> chars = CharBuffer.wrap(s.toCharArray()).chars()
       .mapToObj(ch -> (char) ch);
       return chars.distinct()
       .sorted()
       .map(Objects::toString)
       .collect(Collectors.joining(""));
       */
    }
  }
}
