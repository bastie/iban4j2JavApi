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

extension org.iban4j.bban {
  
  /** Class that represents BBAN structure */
  public class BbanStructure {
    
    private static var structures : [org.iban4j.CountryCode: BbanStructure] = [:]
    private static var needInit : Bool = true
    
    private var entries : [BbanStructureEntry] = [];
    
    private init(_ newEntries : BbanStructureEntry...) {
      if BbanStructure.needInit {
        BbanStructure.needInit = false
        BbanStructure.staticBlock
      }
      self.entries.append(contentsOf: newEntries);
    }
    /**
     * French sub-territories may use their own country code (BL,RE,NC,...) or FR for their IBAN.
     * Structure is the same, only the IBAN checksum differs.
     */
    private static let FRENCH_STRUCTURE =
    BbanStructure(
      BbanStructureEntry.bankCode(5, "n"),
      BbanStructureEntry.branchCode(5, "n"),
      BbanStructureEntry.accountNumber(11, "c"),
      BbanStructureEntry.nationalCheckDigit(2, "n"))
    
    private static let UNITED_KINGDOM_STRUCTURE =
    BbanStructure(
      BbanStructureEntry.bankCode(4, "a"),
      BbanStructureEntry.branchCode(6, "n"),
      BbanStructureEntry.accountNumber(8, "n"))
    
    private static let FINLAND_STRUCTURE =
    BbanStructure(
      BbanStructureEntry.bankCode(6, "n"),
      BbanStructureEntry.accountNumber(7, "n"),
      BbanStructureEntry.nationalCheckDigit(1, "n"))
    
    private static let staticBlock: Void = {
    
//    private static func staticBlock (){
      
      structures[org.iban4j.CountryCode.AL()] =
        BbanStructure(
          BbanStructureEntry.bankCode(3, "n"),
          BbanStructureEntry.branchCode(4, "n"),
          BbanStructureEntry.nationalCheckDigit(1, "n"),
          BbanStructureEntry.accountNumber(16, "c"))
      
      structures[org.iban4j.CountryCode.AD()] =
        BbanStructure(
          BbanStructureEntry.bankCode(4, "n"),
          BbanStructureEntry.branchCode(4, "n"),
          BbanStructureEntry.accountNumber(12, "c"))
      
      structures[org.iban4j.CountryCode.AO()] =
        BbanStructure(
          BbanStructureEntry.bankCode(4, "n"),
          BbanStructureEntry.branchCode(4, "n"),
          BbanStructureEntry.accountNumber(11, "n"),
          BbanStructureEntry.nationalCheckDigit(2, "n"))
      
      structures[org.iban4j.CountryCode.AT()] =
        BbanStructure(
          BbanStructureEntry.bankCode(5, "n"), BbanStructureEntry.accountNumber(11, "n"))
      
      structures[org.iban4j.CountryCode.AZ()] =
        BbanStructure(
          BbanStructureEntry.bankCode(4, "a"), BbanStructureEntry.accountNumber(20, "c"))
      
      structures[org.iban4j.CountryCode.BH()] =
        BbanStructure(
          BbanStructureEntry.bankCode(4, "a"), BbanStructureEntry.accountNumber(14, "c"))
      
      structures[org.iban4j.CountryCode.BE()] =
        BbanStructure(
          BbanStructureEntry.bankCode(3, "n"),
          BbanStructureEntry.accountNumber(7, "n"),
          BbanStructureEntry.nationalCheckDigit(2, "n"))
      
      structures[org.iban4j.CountryCode.BA()] =
        BbanStructure(
          BbanStructureEntry.bankCode(3, "n"),
          BbanStructureEntry.branchCode(3, "n"),
          BbanStructureEntry.accountNumber(8, "n"),
          BbanStructureEntry.nationalCheckDigit(2, "n"))
      
      structures[org.iban4j.CountryCode.BR()] =
        BbanStructure(
          BbanStructureEntry.bankCode(8, "n"),
          BbanStructureEntry.branchCode(5, "n"),
          BbanStructureEntry.accountNumber(10, "n"),
          BbanStructureEntry.accountType(1, "a"),
          BbanStructureEntry.ownerAccountNumber(1, "c"))
      
      structures[org.iban4j.CountryCode.BG()] =
        BbanStructure(
          BbanStructureEntry.bankCode(4, "a"),
          BbanStructureEntry.branchCode(4, "n"),
          BbanStructureEntry.accountType(2, "n"),
          BbanStructureEntry.accountNumber(8, "c"))
      
      structures[org.iban4j.CountryCode.BY()] =
        BbanStructure(
          BbanStructureEntry.bankCode(4, "c"),
          BbanStructureEntry.branchCode(4, "n"),
          BbanStructureEntry.accountNumber(16, "c"))
      
      structures[org.iban4j.CountryCode.CR()] =
        BbanStructure(
          BbanStructureEntry.bankCode(4, "n"), BbanStructureEntry.accountNumber(14, "n"))
      
      structures[org.iban4j.CountryCode.DE()] =
        BbanStructure(
          BbanStructureEntry.bankCode(8, "n"), BbanStructureEntry.accountNumber(10, "n"))
      
      structures[org.iban4j.CountryCode.HR()] =
        BbanStructure(
          BbanStructureEntry.bankCode(7, "n"), BbanStructureEntry.accountNumber(10, "n"))
      
      structures[org.iban4j.CountryCode.CY()] =
        BbanStructure(
          BbanStructureEntry.bankCode(3, "n"),
          BbanStructureEntry.branchCode(5, "n"),
          BbanStructureEntry.accountNumber(16, "c"))
      
      structures[org.iban4j.CountryCode.CZ()] =
        BbanStructure(
          BbanStructureEntry.bankCode(4, "n"), BbanStructureEntry.accountNumber(16, "n"))
      
      structures[org.iban4j.CountryCode.DK()] =
        BbanStructure(
          BbanStructureEntry.bankCode(4, "n"), BbanStructureEntry.accountNumber(10, "n"))
      
      structures[org.iban4j.CountryCode.DO()] =
        BbanStructure(
          BbanStructureEntry.bankCode(4, "c"), BbanStructureEntry.accountNumber(20, "n"))
      
      structures[org.iban4j.CountryCode.EE()] =
        BbanStructure(
          BbanStructureEntry.bankCode(2, "n"),
          BbanStructureEntry.branchCode(2, "n"),
          BbanStructureEntry.accountNumber(11, "n"),
          BbanStructureEntry.nationalCheckDigit(1, "n"))
      
      structures[org.iban4j.CountryCode.EG()] =
        BbanStructure(
          BbanStructureEntry.bankCode(4, "n"),
          BbanStructureEntry.branchCode(4, "n"),
          BbanStructureEntry.accountNumber(17, "n"))
      
      structures[org.iban4j.CountryCode.FO()] =
        BbanStructure(
          BbanStructureEntry.bankCode(4, "n"),
          BbanStructureEntry.accountNumber(9, "n"),
          BbanStructureEntry.nationalCheckDigit(1, "n"))
      
      // Finland and its sub-territory (see https://www.iban.com/structure)
      structures[org.iban4j.CountryCode.FI()] = BbanStructure.FINLAND_STRUCTURE
      structures[org.iban4j.CountryCode.AX()] = BbanStructure.FINLAND_STRUCTURE
      
      // France and its sub-territories (see https://www.iban.com/structure)
      structures[org.iban4j.CountryCode.FR()] = BbanStructure.FRENCH_STRUCTURE
      structures[org.iban4j.CountryCode.GF()] = BbanStructure.FRENCH_STRUCTURE
      structures[org.iban4j.CountryCode.GP()] = BbanStructure.FRENCH_STRUCTURE
      structures[org.iban4j.CountryCode.MQ()] = BbanStructure.FRENCH_STRUCTURE
      structures[org.iban4j.CountryCode.RE()] = BbanStructure.FRENCH_STRUCTURE
      structures[org.iban4j.CountryCode.PF()] = BbanStructure.FRENCH_STRUCTURE
      structures[org.iban4j.CountryCode.TF()] = BbanStructure.FRENCH_STRUCTURE
      structures[org.iban4j.CountryCode.YT()] = BbanStructure.FRENCH_STRUCTURE
      structures[org.iban4j.CountryCode.NC()] = BbanStructure.FRENCH_STRUCTURE
      structures[org.iban4j.CountryCode.BL()] = BbanStructure.FRENCH_STRUCTURE
      structures[org.iban4j.CountryCode.MF()] = BbanStructure.FRENCH_STRUCTURE
      structures[org.iban4j.CountryCode.PM()] = BbanStructure.FRENCH_STRUCTURE
      structures[org.iban4j.CountryCode.WF()] = BbanStructure.FRENCH_STRUCTURE
      
      structures[org.iban4j.CountryCode.GA()] =
        BbanStructure(
          BbanStructureEntry.bankCode(5, "n"),
          BbanStructureEntry.branchCode(5, "n"),
          BbanStructureEntry.accountNumber(13, "c"))
      
      structures[org.iban4j.CountryCode.GE()] =
        BbanStructure(
          BbanStructureEntry.bankCode(2, "a"), BbanStructureEntry.accountNumber(16, "n"))
      
      structures[org.iban4j.CountryCode.GI()] =
        BbanStructure(
          BbanStructureEntry.bankCode(4, "a"), BbanStructureEntry.accountNumber(15, "c"))
      
      structures[org.iban4j.CountryCode.GL()] =
        BbanStructure(
          BbanStructureEntry.bankCode(4, "n"), BbanStructureEntry.accountNumber(10, "n"))
      
      structures[org.iban4j.CountryCode.GR()] =
        BbanStructure(
          BbanStructureEntry.bankCode(3, "n"),
          BbanStructureEntry.branchCode(4, "n"),
          BbanStructureEntry.accountNumber(16, "c"))
      
      structures[org.iban4j.CountryCode.GT()] =
        BbanStructure(
          BbanStructureEntry.bankCode(4, "c"), BbanStructureEntry.accountNumber(20, "c"))
      
      structures[org.iban4j.CountryCode.HU()] =
        BbanStructure(
          BbanStructureEntry.bankCode(3, "n"),
          BbanStructureEntry.branchCode(4, "n"),
          BbanStructureEntry.accountNumber(16, "n"),
          BbanStructureEntry.nationalCheckDigit(1, "n"))
      
      structures[org.iban4j.CountryCode.IS()] =
        BbanStructure(
          BbanStructureEntry.bankCode(2, "n"),
          BbanStructureEntry.branchCode(2, "n"),
          BbanStructureEntry.accountType(2, "n"),
          BbanStructureEntry.accountNumber(6, "n"),
          BbanStructureEntry.identificationNumber(10, "n"))
      
      structures[org.iban4j.CountryCode.IE()] =
        BbanStructure(
          BbanStructureEntry.bankCode(4, "a"),
          BbanStructureEntry.branchCode(6, "n"),
          BbanStructureEntry.accountNumber(8, "n"))
      
      structures[org.iban4j.CountryCode.IL()] =
        BbanStructure(
          BbanStructureEntry.bankCode(3, "n"),
          BbanStructureEntry.branchCode(3, "n"),
          BbanStructureEntry.accountNumber(13, "n"))
      
      structures[org.iban4j.CountryCode.IR()] =
        BbanStructure(
          BbanStructureEntry.bankCode(3, "n"), BbanStructureEntry.accountNumber(19, "n"))
      
      structures[org.iban4j.CountryCode.IT()] =
        BbanStructure(
          BbanStructureEntry.nationalCheckDigit(1, "a"),
          BbanStructureEntry.bankCode(5, "n"),
          BbanStructureEntry.branchCode(5, "n"),
          BbanStructureEntry.accountNumber(12, "c"))
      
      structures[org.iban4j.CountryCode.JO()] =
        BbanStructure(
          BbanStructureEntry.bankCode(4, "a"),
          BbanStructureEntry.branchCode(4, "n"),
          BbanStructureEntry.accountNumber(18, "c"))
      
      structures[org.iban4j.CountryCode.KZ()] =
        BbanStructure(
          BbanStructureEntry.bankCode(3, "n"), BbanStructureEntry.accountNumber(13, "c"))
      
      structures[org.iban4j.CountryCode.KW()] =
        BbanStructure(
          BbanStructureEntry.bankCode(4, "a"), BbanStructureEntry.accountNumber(22, "c"))
      
      structures[org.iban4j.CountryCode.LC()] =
        BbanStructure(
          BbanStructureEntry.bankCode(4, "a"), BbanStructureEntry.accountNumber(24, "c"))
      
      structures[org.iban4j.CountryCode.LV()] =
        BbanStructure(
          BbanStructureEntry.bankCode(4, "a"), BbanStructureEntry.accountNumber(13, "c"))
      
      structures[org.iban4j.CountryCode.LB()] =
        BbanStructure(
          BbanStructureEntry.bankCode(4, "n"), BbanStructureEntry.accountNumber(20, "c"))
      
      structures[org.iban4j.CountryCode.LI()] =
        BbanStructure(
          BbanStructureEntry.bankCode(5, "n"), BbanStructureEntry.accountNumber(12, "c"))
      
      structures[org.iban4j.CountryCode.LT()] =
        BbanStructure(
          BbanStructureEntry.bankCode(5, "n"), BbanStructureEntry.accountNumber(11, "n"))
      
      structures[org.iban4j.CountryCode.LU()] =
        BbanStructure(
          BbanStructureEntry.bankCode(3, "n"), BbanStructureEntry.accountNumber(13, "c"))
      
      structures[org.iban4j.CountryCode.MK()] =
        BbanStructure(
          BbanStructureEntry.bankCode(3, "n"),
          BbanStructureEntry.accountNumber(10, "c"),
          BbanStructureEntry.nationalCheckDigit(2, "n"))
      
      structures[org.iban4j.CountryCode.MT()] =
        BbanStructure(
          BbanStructureEntry.bankCode(4, "a"),
          BbanStructureEntry.branchCode(5, "n"),
          BbanStructureEntry.accountNumber(18, "c"))
      
      structures[org.iban4j.CountryCode.MR()] =
        BbanStructure(
          BbanStructureEntry.bankCode(5, "n"),
          BbanStructureEntry.branchCode(5, "n"),
          BbanStructureEntry.accountNumber(11, "n"),
          BbanStructureEntry.nationalCheckDigit(2, "n"))
      
      structures[org.iban4j.CountryCode.MU()] =
        BbanStructure(
          BbanStructureEntry.bankCode(6, "c"),
          BbanStructureEntry.branchCode(2, "n"),
          BbanStructureEntry.accountNumber(18, "c"))
      
      structures[org.iban4j.CountryCode.MD()] =
        BbanStructure(
          BbanStructureEntry.bankCode(2, "c"), BbanStructureEntry.accountNumber(18, "c"))
      
      structures[org.iban4j.CountryCode.MC()] =
        BbanStructure(
          BbanStructureEntry.bankCode(5, "n"),
          BbanStructureEntry.branchCode(5, "n"),
          BbanStructureEntry.accountNumber(11, "c"),
          BbanStructureEntry.nationalCheckDigit(2, "n"))
      
      structures[org.iban4j.CountryCode.ME()] =
        BbanStructure(
          BbanStructureEntry.bankCode(3, "n"),
          BbanStructureEntry.accountNumber(13, "n"),
          BbanStructureEntry.nationalCheckDigit(2, "n"))
      
      structures[org.iban4j.CountryCode.NL()] =
        BbanStructure(
          BbanStructureEntry.bankCode(4, "a"), BbanStructureEntry.accountNumber(10, "n"))
      
      structures[org.iban4j.CountryCode.NO()] =
        BbanStructure(
          BbanStructureEntry.bankCode(4, "n"),
          BbanStructureEntry.accountNumber(6, "n"),
          BbanStructureEntry.nationalCheckDigit(1, "n"))
      
      structures[org.iban4j.CountryCode.PK()] =
        BbanStructure(
          BbanStructureEntry.bankCode(4, "c"), BbanStructureEntry.accountNumber(16, "n"))
      
      structures[org.iban4j.CountryCode.PS()] =
        BbanStructure(
          BbanStructureEntry.bankCode(4, "a"), BbanStructureEntry.accountNumber(21, "c"))
      
      structures[org.iban4j.CountryCode.PL()] =
        BbanStructure(
          BbanStructureEntry.bankCode(3, "n"),
          BbanStructureEntry.branchCode(4, "n"),
          BbanStructureEntry.nationalCheckDigit(1, "n"),
          BbanStructureEntry.accountNumber(16, "n"))
      
      structures[org.iban4j.CountryCode.PT()] =
        BbanStructure(
          BbanStructureEntry.bankCode(4, "n"),
          BbanStructureEntry.branchCode(4, "n"),
          BbanStructureEntry.accountNumber(11, "n"),
          BbanStructureEntry.nationalCheckDigit(2, "n"))
      
      structures[org.iban4j.CountryCode.RO()] =
        BbanStructure(
          BbanStructureEntry.bankCode(4, "a"), BbanStructureEntry.accountNumber(16, "c"))
      
      structures[org.iban4j.CountryCode.QA()] =
        BbanStructure(
          BbanStructureEntry.bankCode(4, "a"), BbanStructureEntry.accountNumber(21, "c"))
      
      structures[org.iban4j.CountryCode.SC()] =
        BbanStructure(
          BbanStructureEntry.bankCode(4, "a"),
          BbanStructureEntry.branchCode(4, "n"),
          BbanStructureEntry.accountNumber(16, "n"),
          BbanStructureEntry.accountType(3, "a"))
      
      structures[org.iban4j.CountryCode.SM()] =
        BbanStructure(
          BbanStructureEntry.nationalCheckDigit(1, "a"),
          BbanStructureEntry.bankCode(5, "n"),
          BbanStructureEntry.branchCode(5, "n"),
          BbanStructureEntry.accountNumber(12, "c"))
      
      structures[org.iban4j.CountryCode.ST()] =
        BbanStructure(
          BbanStructureEntry.bankCode(4, "n"),
          BbanStructureEntry.branchCode(4, "n"),
          BbanStructureEntry.accountNumber(13, "n"))
      
      structures[org.iban4j.CountryCode.SA()] =
        BbanStructure(
          BbanStructureEntry.bankCode(2, "n"), BbanStructureEntry.accountNumber(18, "c"))
      
      structures[org.iban4j.CountryCode.RS()] =
        BbanStructure(
          BbanStructureEntry.bankCode(3, "n"),
          BbanStructureEntry.accountNumber(13, "n"),
          BbanStructureEntry.nationalCheckDigit(2, "n"))
      
      structures[org.iban4j.CountryCode.RU()] =
        BbanStructure(
          BbanStructureEntry.bankCode(9, "n"),
          BbanStructureEntry.branchCode(5, "n"),
          BbanStructureEntry.accountNumber(15, "c"))
      
      structures[org.iban4j.CountryCode.SK()] =
        BbanStructure(
          BbanStructureEntry.bankCode(4, "n"), BbanStructureEntry.accountNumber(16, "n"))
      
      structures[org.iban4j.CountryCode.SI()] =
        BbanStructure(
          BbanStructureEntry.bankCode(2, "n"),
          BbanStructureEntry.branchCode(3, "n"),
          BbanStructureEntry.accountNumber(8, "n"),
          BbanStructureEntry.nationalCheckDigit(2, "n"))
      
      structures[org.iban4j.CountryCode.SV()] =
        BbanStructure(
          BbanStructureEntry.bankCode(4, "a"), BbanStructureEntry.accountNumber(20, "n"))
      
      structures[org.iban4j.CountryCode.ES()] =
        BbanStructure(
          BbanStructureEntry.bankCode(4, "n"),
          BbanStructureEntry.branchCode(4, "n"),
          BbanStructureEntry.nationalCheckDigit(2, "n"),
          BbanStructureEntry.accountNumber(10, "n"))
      
      structures[org.iban4j.CountryCode.SE()] =
        BbanStructure(
          BbanStructureEntry.bankCode(3, "n"), BbanStructureEntry.accountNumber(17, "n"))
      
      structures[org.iban4j.CountryCode.CH()] =
        BbanStructure(
          BbanStructureEntry.bankCode(5, "n"), BbanStructureEntry.accountNumber(12, "c"))
      
      structures[org.iban4j.CountryCode.TN()] =
        BbanStructure(
          BbanStructureEntry.bankCode(2, "n"),
          BbanStructureEntry.branchCode(3, "n"),
          BbanStructureEntry.accountNumber(15, "c"))
      
      structures[org.iban4j.CountryCode.TR()] =
        BbanStructure(
          BbanStructureEntry.bankCode(5, "n"),
          BbanStructureEntry.nationalCheckDigit(1, "c"),
          BbanStructureEntry.accountNumber(16, "c"))
      
      structures[org.iban4j.CountryCode.UA()] =
        BbanStructure(
          BbanStructureEntry.bankCode(6, "n"), BbanStructureEntry.accountNumber(19, "n"))
      
      // UK and its sub-territories (see https://www.iban.com/structure)
      structures[org.iban4j.CountryCode.GB()] = BbanStructure.UNITED_KINGDOM_STRUCTURE
      structures[org.iban4j.CountryCode.IM()] = BbanStructure.UNITED_KINGDOM_STRUCTURE
      structures[org.iban4j.CountryCode.GG()] = BbanStructure.UNITED_KINGDOM_STRUCTURE
      structures[org.iban4j.CountryCode.JE()] = BbanStructure.UNITED_KINGDOM_STRUCTURE
      
      structures[org.iban4j.CountryCode.AE()] =
        BbanStructure(
          BbanStructureEntry.bankCode(3, "n"), BbanStructureEntry.accountNumber(16, "c"))
      
      structures[org.iban4j.CountryCode.VA()] =
        BbanStructure(
          BbanStructureEntry.bankCode(3, "n"), BbanStructureEntry.accountNumber(15, "n"))
      
      structures[org.iban4j.CountryCode.VG()] =
        BbanStructure(
          BbanStructureEntry.bankCode(4, "a"), BbanStructureEntry.accountNumber(16, "n"))
      
      structures[org.iban4j.CountryCode.TL()] =
        BbanStructure(
          BbanStructureEntry.bankCode(3, "n"),
          BbanStructureEntry.accountNumber(14, "n"),
          BbanStructureEntry.nationalCheckDigit(2, "n"))
      
      structures[org.iban4j.CountryCode.XK()] =
        BbanStructure(
          BbanStructureEntry.bankCode(2, "n"),
          BbanStructureEntry.branchCode(2, "n"),
          BbanStructureEntry.accountNumber(10, "n"),
          BbanStructureEntry.nationalCheckDigit(2, "n"))
      
      structures[org.iban4j.CountryCode.IQ()] =
        BbanStructure(
          BbanStructureEntry.bankCode(4, "a"),
          BbanStructureEntry.branchCode(3, "n"),
          BbanStructureEntry.accountNumber(12, "n"))
      
      structures[org.iban4j.CountryCode.CV()] =
        BbanStructure(
          BbanStructureEntry.bankCode(4, "n"),
          BbanStructureEntry.branchCode(4, "n"),
          BbanStructureEntry.accountNumber(13, "c"))
      
      structures[org.iban4j.CountryCode.OM()] =
        BbanStructure(
          BbanStructureEntry.bankCode(3, "n"), BbanStructureEntry.accountNumber(16, "c"))
      
      structures[org.iban4j.CountryCode.BI()] =
        BbanStructure(
          BbanStructureEntry.bankCode(5, "n"),
          BbanStructureEntry.branchCode(5, "n"),
          BbanStructureEntry.accountNumber(13, "n"))
//    }
    //some initialization
  }()

    /**
     * @param countryCode the country code.
     * @return BbanStructure for specified country or null if country is not supported.
     */
    public static func forCountry(_ countryCode : org.iban4j.CountryCode) -> BbanStructure? {
      if structures.isEmpty {_ = BbanStructure()}
      let result = try? structures.get(countryCode);
      return result
    }
    
    /**
     * Checks whether national Check digit is mandatory for specific country
     *
     * @param countryCode the country code
     * @return true/false
     */
    public static func hasNationalCheckDigit(_ countryCode : org.iban4j.CountryCode) -> Bool {
      if let bbanStructure = forCountry (countryCode) {
        for next in bbanStructure.getEntries() {
          switch next.getEntryType() {
          case org.iban4j.bban.BbanEntryType.national_check_digit : return true
          default: break
          }
        }
        return false
      }
      else {
        return false
      }
      // nice functional Java impl:
      /*
      final Optional<BbanStructure> bbanStructure = Optional.ofNullable(forCountry(countryCode));
      return bbanStructure
        .map(
          structure ->
          structure.getEntries().stream()
            .anyMatch(e -> BbanEntryType.national_check_digit.equals(e.getEntryType())))
        .orElse(false);
       */
    }
    
    public static func supportedCountries() -> [org.iban4j.CountryCode] {
      return Array(structures.keys)
    }
    
    public func getEntries() -> [BbanStructureEntry] {
      return Array(self.entries)
    }
    
    /**
     * Returns the length of bban.
     *
     * @return int length
     */
    public func getBbanLength() -> Int{
      var length = 0;
      
      for entry in self.entries {
        length += entry.getLength();
      }
      
      return length;
    }
  }
}
