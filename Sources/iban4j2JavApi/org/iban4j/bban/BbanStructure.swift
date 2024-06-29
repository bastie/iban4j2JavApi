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
  
  /** Class that represents BBAN structure */
  public class BbanStructure {
    
    private static var structures : [CountryCode: BbanStructure] = [:]
    private static var needInit : Bool = true
    
    private let entries : [BbanStructureEntry];
    
    private init(_ entries : BbanStructureEntry...) {
      self.entries = entries;
      if BbanStructure.needInit {
        BbanStructure.staticBlock()
        BbanStructure.needInit = false
      }
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
    
    private static func staticBlock (){
      
      structures[CountryCode.AL()] =
        BbanStructure(
          BbanStructureEntry.bankCode(3, "n"),
          BbanStructureEntry.branchCode(4, "n"),
          BbanStructureEntry.nationalCheckDigit(1, "n"),
          BbanStructureEntry.accountNumber(16, "c"))
      
      structures[CountryCode.AD()] =
        BbanStructure(
          BbanStructureEntry.bankCode(4, "n"),
          BbanStructureEntry.branchCode(4, "n"),
          BbanStructureEntry.accountNumber(12, "c"))
      
      structures[CountryCode.AO()] =
        BbanStructure(
          BbanStructureEntry.bankCode(4, "n"),
          BbanStructureEntry.branchCode(4, "n"),
          BbanStructureEntry.accountNumber(11, "n"),
          BbanStructureEntry.nationalCheckDigit(2, "n"))
      
      structures[CountryCode.AT()] =
        BbanStructure(
          BbanStructureEntry.bankCode(5, "n"), BbanStructureEntry.accountNumber(11, "n"))
      
      structures[CountryCode.AZ()] =
        BbanStructure(
          BbanStructureEntry.bankCode(4, "a"), BbanStructureEntry.accountNumber(20, "c"))
      
      structures[CountryCode.BH()] =
        BbanStructure(
          BbanStructureEntry.bankCode(4, "a"), BbanStructureEntry.accountNumber(14, "c"))
      
      structures[CountryCode.BE()] =
        BbanStructure(
          BbanStructureEntry.bankCode(3, "n"),
          BbanStructureEntry.accountNumber(7, "n"),
          BbanStructureEntry.nationalCheckDigit(2, "n"))
      
      structures[CountryCode.BA()] =
        BbanStructure(
          BbanStructureEntry.bankCode(3, "n"),
          BbanStructureEntry.branchCode(3, "n"),
          BbanStructureEntry.accountNumber(8, "n"),
          BbanStructureEntry.nationalCheckDigit(2, "n"))
      
      structures[CountryCode.BR()] =
        BbanStructure(
          BbanStructureEntry.bankCode(8, "n"),
          BbanStructureEntry.branchCode(5, "n"),
          BbanStructureEntry.accountNumber(10, "n"),
          BbanStructureEntry.accountType(1, "a"),
          BbanStructureEntry.ownerAccountNumber(1, "c"))
      
      structures[CountryCode.BG()] =
        BbanStructure(
          BbanStructureEntry.bankCode(4, "a"),
          BbanStructureEntry.branchCode(4, "n"),
          BbanStructureEntry.accountType(2, "n"),
          BbanStructureEntry.accountNumber(8, "c"))
      
      structures[CountryCode.BY()] =
        BbanStructure(
          BbanStructureEntry.bankCode(4, "c"),
          BbanStructureEntry.branchCode(4, "n"),
          BbanStructureEntry.accountNumber(16, "c"))
      
      structures[CountryCode.CR()] =
        BbanStructure(
          BbanStructureEntry.bankCode(4, "n"), BbanStructureEntry.accountNumber(14, "n"))
      
      structures[CountryCode.DE()] =
        BbanStructure(
          BbanStructureEntry.bankCode(8, "n"), BbanStructureEntry.accountNumber(10, "n"))
      
      structures[CountryCode.HR()] =
        BbanStructure(
          BbanStructureEntry.bankCode(7, "n"), BbanStructureEntry.accountNumber(10, "n"))
      
      structures[CountryCode.CY()] =
        BbanStructure(
          BbanStructureEntry.bankCode(3, "n"),
          BbanStructureEntry.branchCode(5, "n"),
          BbanStructureEntry.accountNumber(16, "c"))
      
      structures[CountryCode.CZ()] =
        BbanStructure(
          BbanStructureEntry.bankCode(4, "n"), BbanStructureEntry.accountNumber(16, "n"))
      
      structures[CountryCode.DK()] =
        BbanStructure(
          BbanStructureEntry.bankCode(4, "n"), BbanStructureEntry.accountNumber(10, "n"))
      
      structures[CountryCode.DO()] =
        BbanStructure(
          BbanStructureEntry.bankCode(4, "c"), BbanStructureEntry.accountNumber(20, "n"))
      
      structures[CountryCode.EE()] =
        BbanStructure(
          BbanStructureEntry.bankCode(2, "n"),
          BbanStructureEntry.branchCode(2, "n"),
          BbanStructureEntry.accountNumber(11, "n"),
          BbanStructureEntry.nationalCheckDigit(1, "n"))
      
      structures[CountryCode.EG()] =
        BbanStructure(
          BbanStructureEntry.bankCode(4, "n"),
          BbanStructureEntry.branchCode(4, "n"),
          BbanStructureEntry.accountNumber(17, "n"))
      
      structures[CountryCode.FO()] =
        BbanStructure(
          BbanStructureEntry.bankCode(4, "n"),
          BbanStructureEntry.accountNumber(9, "n"),
          BbanStructureEntry.nationalCheckDigit(1, "n"))
      
      // Finland and its sub-territory (see https://www.iban.com/structure)
      structures[CountryCode.FI()] = BbanStructure.FINLAND_STRUCTURE
      structures[CountryCode.AX()] = BbanStructure.FINLAND_STRUCTURE
      
      // France and its sub-territories (see https://www.iban.com/structure)
      structures[CountryCode.FR()] = BbanStructure.FRENCH_STRUCTURE
      structures[CountryCode.GF()] = BbanStructure.FRENCH_STRUCTURE
      structures[CountryCode.GP()] = BbanStructure.FRENCH_STRUCTURE
      structures[CountryCode.MQ()] = BbanStructure.FRENCH_STRUCTURE
      structures[CountryCode.RE()] = BbanStructure.FRENCH_STRUCTURE
      structures[CountryCode.PF()] = BbanStructure.FRENCH_STRUCTURE
      structures[CountryCode.TF()] = BbanStructure.FRENCH_STRUCTURE
      structures[CountryCode.YT()] = BbanStructure.FRENCH_STRUCTURE
      structures[CountryCode.NC()] = BbanStructure.FRENCH_STRUCTURE
      structures[CountryCode.BL()] = BbanStructure.FRENCH_STRUCTURE
      structures[CountryCode.MF()] = BbanStructure.FRENCH_STRUCTURE
      structures[CountryCode.PM()] = BbanStructure.FRENCH_STRUCTURE
      structures[CountryCode.WF()] = BbanStructure.FRENCH_STRUCTURE
      
      structures[CountryCode.GA()] =
        BbanStructure(
          BbanStructureEntry.bankCode(5, "n"),
          BbanStructureEntry.branchCode(5, "n"),
          BbanStructureEntry.accountNumber(13, "c"))
      
      structures[CountryCode.GE()] =
        BbanStructure(
          BbanStructureEntry.bankCode(2, "a"), BbanStructureEntry.accountNumber(16, "n"))
      
      structures[CountryCode.GI()] =
        BbanStructure(
          BbanStructureEntry.bankCode(4, "a"), BbanStructureEntry.accountNumber(15, "c"))
      
      structures[CountryCode.GL()] =
        BbanStructure(
          BbanStructureEntry.bankCode(4, "n"), BbanStructureEntry.accountNumber(10, "n"))
      
      structures[CountryCode.GR()] =
        BbanStructure(
          BbanStructureEntry.bankCode(3, "n"),
          BbanStructureEntry.branchCode(4, "n"),
          BbanStructureEntry.accountNumber(16, "c"))
      
      structures[CountryCode.GT()] =
        BbanStructure(
          BbanStructureEntry.bankCode(4, "c"), BbanStructureEntry.accountNumber(20, "c"))
      
      structures[CountryCode.HU()] =
        BbanStructure(
          BbanStructureEntry.bankCode(3, "n"),
          BbanStructureEntry.branchCode(4, "n"),
          BbanStructureEntry.accountNumber(16, "n"),
          BbanStructureEntry.nationalCheckDigit(1, "n"))
      
      structures[CountryCode.IS()] =
        BbanStructure(
          BbanStructureEntry.bankCode(2, "n"),
          BbanStructureEntry.branchCode(2, "n"),
          BbanStructureEntry.accountType(2, "n"),
          BbanStructureEntry.accountNumber(6, "n"),
          BbanStructureEntry.identificationNumber(10, "n"))
      
      structures[CountryCode.IE()] =
        BbanStructure(
          BbanStructureEntry.bankCode(4, "a"),
          BbanStructureEntry.branchCode(6, "n"),
          BbanStructureEntry.accountNumber(8, "n"))
      
      structures[CountryCode.IL()] =
        BbanStructure(
          BbanStructureEntry.bankCode(3, "n"),
          BbanStructureEntry.branchCode(3, "n"),
          BbanStructureEntry.accountNumber(13, "n"))
      
      structures[CountryCode.IR()] =
        BbanStructure(
          BbanStructureEntry.bankCode(3, "n"), BbanStructureEntry.accountNumber(19, "n"))
      
      structures[CountryCode.IT()] =
        BbanStructure(
          BbanStructureEntry.nationalCheckDigit(1, "a"),
          BbanStructureEntry.bankCode(5, "n"),
          BbanStructureEntry.branchCode(5, "n"),
          BbanStructureEntry.accountNumber(12, "c"))
      
      structures[CountryCode.JO()] =
        BbanStructure(
          BbanStructureEntry.bankCode(4, "a"),
          BbanStructureEntry.branchCode(4, "n"),
          BbanStructureEntry.accountNumber(18, "c"))
      
      structures[CountryCode.KZ()] =
        BbanStructure(
          BbanStructureEntry.bankCode(3, "n"), BbanStructureEntry.accountNumber(13, "c"))
      
      structures[CountryCode.KW()] =
        BbanStructure(
          BbanStructureEntry.bankCode(4, "a"), BbanStructureEntry.accountNumber(22, "c"))
      
      structures[CountryCode.LC()] =
        BbanStructure(
          BbanStructureEntry.bankCode(4, "a"), BbanStructureEntry.accountNumber(24, "c"))
      
      structures[CountryCode.LV()] =
        BbanStructure(
          BbanStructureEntry.bankCode(4, "a"), BbanStructureEntry.accountNumber(13, "c"))
      
      structures[CountryCode.LB()] =
        BbanStructure(
          BbanStructureEntry.bankCode(4, "n"), BbanStructureEntry.accountNumber(20, "c"))
      
      structures[CountryCode.LI()] =
        BbanStructure(
          BbanStructureEntry.bankCode(5, "n"), BbanStructureEntry.accountNumber(12, "c"))
      
      structures[CountryCode.LT()] =
        BbanStructure(
          BbanStructureEntry.bankCode(5, "n"), BbanStructureEntry.accountNumber(11, "n"))
      
      structures[CountryCode.LU()] =
        BbanStructure(
          BbanStructureEntry.bankCode(3, "n"), BbanStructureEntry.accountNumber(13, "c"))
      
      structures[CountryCode.MK()] =
        BbanStructure(
          BbanStructureEntry.bankCode(3, "n"),
          BbanStructureEntry.accountNumber(10, "c"),
          BbanStructureEntry.nationalCheckDigit(2, "n"))
      
      structures[CountryCode.MT()] =
        BbanStructure(
          BbanStructureEntry.bankCode(4, "a"),
          BbanStructureEntry.branchCode(5, "n"),
          BbanStructureEntry.accountNumber(18, "c"))
      
      structures[CountryCode.MR()] =
        BbanStructure(
          BbanStructureEntry.bankCode(5, "n"),
          BbanStructureEntry.branchCode(5, "n"),
          BbanStructureEntry.accountNumber(11, "n"),
          BbanStructureEntry.nationalCheckDigit(2, "n"))
      
      structures[CountryCode.MU()] =
        BbanStructure(
          BbanStructureEntry.bankCode(6, "c"),
          BbanStructureEntry.branchCode(2, "n"),
          BbanStructureEntry.accountNumber(18, "c"))
      
      structures[CountryCode.MD()] =
        BbanStructure(
          BbanStructureEntry.bankCode(2, "c"), BbanStructureEntry.accountNumber(18, "c"))
      
      structures[CountryCode.MC()] =
        BbanStructure(
          BbanStructureEntry.bankCode(5, "n"),
          BbanStructureEntry.branchCode(5, "n"),
          BbanStructureEntry.accountNumber(11, "c"),
          BbanStructureEntry.nationalCheckDigit(2, "n"))
      
      structures[CountryCode.ME()] =
        BbanStructure(
          BbanStructureEntry.bankCode(3, "n"),
          BbanStructureEntry.accountNumber(13, "n"),
          BbanStructureEntry.nationalCheckDigit(2, "n"))
      
      structures[CountryCode.NL()] =
        BbanStructure(
          BbanStructureEntry.bankCode(4, "a"), BbanStructureEntry.accountNumber(10, "n"))
      
      structures[CountryCode.NO()] =
        BbanStructure(
          BbanStructureEntry.bankCode(4, "n"),
          BbanStructureEntry.accountNumber(6, "n"),
          BbanStructureEntry.nationalCheckDigit(1, "n"))
      
      structures[CountryCode.PK()] =
        BbanStructure(
          BbanStructureEntry.bankCode(4, "c"), BbanStructureEntry.accountNumber(16, "n"))
      
      structures[CountryCode.PS()] =
        BbanStructure(
          BbanStructureEntry.bankCode(4, "a"), BbanStructureEntry.accountNumber(21, "c"))
      
      structures[CountryCode.PL()] =
        BbanStructure(
          BbanStructureEntry.bankCode(3, "n"),
          BbanStructureEntry.branchCode(4, "n"),
          BbanStructureEntry.nationalCheckDigit(1, "n"),
          BbanStructureEntry.accountNumber(16, "n"))
      
      structures[CountryCode.PT()] =
        BbanStructure(
          BbanStructureEntry.bankCode(4, "n"),
          BbanStructureEntry.branchCode(4, "n"),
          BbanStructureEntry.accountNumber(11, "n"),
          BbanStructureEntry.nationalCheckDigit(2, "n"))
      
      structures[CountryCode.RO()] =
        BbanStructure(
          BbanStructureEntry.bankCode(4, "a"), BbanStructureEntry.accountNumber(16, "c"))
      
      structures[CountryCode.QA()] =
        BbanStructure(
          BbanStructureEntry.bankCode(4, "a"), BbanStructureEntry.accountNumber(21, "c"))
      
      structures[CountryCode.SC()] =
        BbanStructure(
          BbanStructureEntry.bankCode(4, "a"),
          BbanStructureEntry.branchCode(4, "n"),
          BbanStructureEntry.accountNumber(16, "n"),
          BbanStructureEntry.accountType(3, "a"))
      
      structures[CountryCode.SM()] =
        BbanStructure(
          BbanStructureEntry.nationalCheckDigit(1, "a"),
          BbanStructureEntry.bankCode(5, "n"),
          BbanStructureEntry.branchCode(5, "n"),
          BbanStructureEntry.accountNumber(12, "c"))
      
      structures[CountryCode.ST()] =
        BbanStructure(
          BbanStructureEntry.bankCode(4, "n"),
          BbanStructureEntry.branchCode(4, "n"),
          BbanStructureEntry.accountNumber(13, "n"))
      
      structures[CountryCode.SA()] =
        BbanStructure(
          BbanStructureEntry.bankCode(2, "n"), BbanStructureEntry.accountNumber(18, "c"))
      
      structures[CountryCode.RS()] =
        BbanStructure(
          BbanStructureEntry.bankCode(3, "n"),
          BbanStructureEntry.accountNumber(13, "n"),
          BbanStructureEntry.nationalCheckDigit(2, "n"))
      
      structures[CountryCode.RU()] =
        BbanStructure(
          BbanStructureEntry.bankCode(9, "n"),
          BbanStructureEntry.branchCode(5, "n"),
          BbanStructureEntry.accountNumber(15, "c"))
      
      structures[CountryCode.SK()] =
        BbanStructure(
          BbanStructureEntry.bankCode(4, "n"), BbanStructureEntry.accountNumber(16, "n"))
      
      structures[CountryCode.SI()] =
        BbanStructure(
          BbanStructureEntry.bankCode(2, "n"),
          BbanStructureEntry.branchCode(3, "n"),
          BbanStructureEntry.accountNumber(8, "n"),
          BbanStructureEntry.nationalCheckDigit(2, "n"))
      
      structures[CountryCode.SV()] =
        BbanStructure(
          BbanStructureEntry.bankCode(4, "a"), BbanStructureEntry.accountNumber(20, "n"))
      
      structures[CountryCode.ES()] =
        BbanStructure(
          BbanStructureEntry.bankCode(4, "n"),
          BbanStructureEntry.branchCode(4, "n"),
          BbanStructureEntry.nationalCheckDigit(2, "n"),
          BbanStructureEntry.accountNumber(10, "n"))
      
      structures[CountryCode.SE()] =
        BbanStructure(
          BbanStructureEntry.bankCode(3, "n"), BbanStructureEntry.accountNumber(17, "n"))
      
      structures[CountryCode.CH()] =
        BbanStructure(
          BbanStructureEntry.bankCode(5, "n"), BbanStructureEntry.accountNumber(12, "c"))
      
      structures[CountryCode.TN()] =
        BbanStructure(
          BbanStructureEntry.bankCode(2, "n"),
          BbanStructureEntry.branchCode(3, "n"),
          BbanStructureEntry.accountNumber(15, "c"))
      
      structures[CountryCode.TR()] =
        BbanStructure(
          BbanStructureEntry.bankCode(5, "n"),
          BbanStructureEntry.nationalCheckDigit(1, "c"),
          BbanStructureEntry.accountNumber(16, "c"))
      
      structures[CountryCode.UA()] =
        BbanStructure(
          BbanStructureEntry.bankCode(6, "n"), BbanStructureEntry.accountNumber(19, "n"))
      
      // UK and its sub-territories (see https://www.iban.com/structure)
      structures[CountryCode.GB()] = BbanStructure.UNITED_KINGDOM_STRUCTURE
      structures[CountryCode.IM()] = BbanStructure.UNITED_KINGDOM_STRUCTURE
      structures[CountryCode.GG()] = BbanStructure.UNITED_KINGDOM_STRUCTURE
      structures[CountryCode.JE()] = BbanStructure.UNITED_KINGDOM_STRUCTURE
      
      structures[CountryCode.AE()] =
        BbanStructure(
          BbanStructureEntry.bankCode(3, "n"), BbanStructureEntry.accountNumber(16, "c"))
      
      structures[CountryCode.VA()] =
        BbanStructure(
          BbanStructureEntry.bankCode(3, "n"), BbanStructureEntry.accountNumber(15, "n"))
      
      structures[CountryCode.VG()] =
        BbanStructure(
          BbanStructureEntry.bankCode(4, "a"), BbanStructureEntry.accountNumber(16, "n"))
      
      structures[CountryCode.TL()] =
        BbanStructure(
          BbanStructureEntry.bankCode(3, "n"),
          BbanStructureEntry.accountNumber(14, "n"),
          BbanStructureEntry.nationalCheckDigit(2, "n"))
      
      structures[CountryCode.XK()] =
        BbanStructure(
          BbanStructureEntry.bankCode(2, "n"),
          BbanStructureEntry.branchCode(2, "n"),
          BbanStructureEntry.accountNumber(10, "n"),
          BbanStructureEntry.nationalCheckDigit(2, "n"))
      
      structures[CountryCode.IQ()] =
        BbanStructure(
          BbanStructureEntry.bankCode(4, "a"),
          BbanStructureEntry.branchCode(3, "n"),
          BbanStructureEntry.accountNumber(12, "n"))
      
      structures[CountryCode.CV()] =
        BbanStructure(
          BbanStructureEntry.bankCode(4, "n"),
          BbanStructureEntry.branchCode(4, "n"),
          BbanStructureEntry.accountNumber(13, "c"))
      
      structures[CountryCode.OM()] =
        BbanStructure(
          BbanStructureEntry.bankCode(3, "n"), BbanStructureEntry.accountNumber(16, "c"))
      
      structures[CountryCode.BI()] =
        BbanStructure(
          BbanStructureEntry.bankCode(5, "n"),
          BbanStructureEntry.branchCode(5, "n"),
          BbanStructureEntry.accountNumber(13, "n"))
    }

    /**
     * @param countryCode the country code.
     * @return BbanStructure for specified country or null if country is not supported.
     */
    public static func forCountry(_ countryCode : CountryCode) -> BbanStructure? {
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
    public static func hasNationalCheckDigit(_ countryCode : CountryCode) -> Bool {
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
    
    public static func supportedCountries() -> [CountryCode] {
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
      
      for entry in entries {
        length += entry.getLength();
      }
      
      return length;
    }
  }
}
