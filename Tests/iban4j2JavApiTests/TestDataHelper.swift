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

import Foundation
import JavApi
import iban4j2JavApi

extension org.iban4j {
  
  final class TestDataHelper {
    public static let defaultExceptionMessage = "Expected doThing() to throw, but it didn't";
    
    public static func getIbanData() -> [(Iban,String)] {
      
      var result : [(Iban,String)] = []
      
      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.AL())
          .setBankCode("212")
          .setBranchCode("1100")
          .setAccountNumber("0000000235698741")
          .setNationalCheckDigit("9")
          .build()
        elem.1 =
        "AL47212110090000000235698741"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.AD())
          .setBankCode("0001")
          .setBranchCode("2030")
          .setAccountNumber("200359100100")
          .build()
        elem.1 =
        "AD1200012030200359100100"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.AO())
          .setBankCode("0006")
          .setBranchCode("0000")
          .setAccountNumber("53518203301")
          .setNationalCheckDigit("69")
          .build()
        elem.1 =
        "AO06000600005351820330169"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.AT())
          .setBankCode("19043")
          .setAccountNumber("00234573201")
          .build()
        elem.1 =
        "AT611904300234573201"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.AZ())
          .setBankCode("NABZ")
          .setAccountNumber("00000000137010001944")
          .build()
        elem.1 =
        "AZ21NABZ00000000137010001944"
        result.insert(elem, at: result.count)
      }
      
      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.BH())
          .setBankCode("SCBL")
          .setAccountNumber("BHD18903608801")
          .build()
        elem.1 =
        "BH72SCBLBHD18903608801"
        result.insert(elem, at: result.count)
      }
      
      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.BE())
          .setBankCode("539")
          .setAccountNumber("0075470")
          .setNationalCheckDigit("34")
          .build()
        elem.1 =
        "BE68539007547034"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.BA())
          .setBankCode("129")
          .setBranchCode("007")
          .setAccountNumber("94010284")
          .setNationalCheckDigit("94")
          .build()
        elem.1 =
        "BA391290079401028494"
        result.insert(elem, at: result.count)
      }
      
      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.BR())
          .setBankCode("00360305")
          .setBranchCode("00001")
          .setAccountNumber("0009795493")
          .setAccountType("P")
          .setOwnerAccountType("1")
          .build()
        elem.1 =
        "BR9700360305000010009795493P1"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.BG())
          .setBankCode("BNBG")
          .setBranchCode("9661")
          .setAccountNumber("20345678")
          .setAccountType("10")
          .build()
        elem.1 =
        "BG80BNBG96611020345678"
        result.insert(elem, at: result.count)
      }
      
      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.BL())
          .setBankCode("12345")
          .setBranchCode("12345")
          .setAccountNumber("123456789AB")
          .setNationalCheckDigit("13")
          .build()
        elem.1 =
        "BL391234512345123456789AB13"
        result.insert(elem, at: result.count)
      }
            
      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.BY())
          .setBankCode("NBRB")
          .setBranchCode("3600")
          .setAccountNumber("900000002Z00AB00")
          .build()
        elem.1 =
        "BY13NBRB3600900000002Z00AB00"
        result.insert(elem, at: result.count)
      }
      
      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.CR())
          .setBankCode("0152")
          .setAccountNumber("02001026284066")
          .build()
        elem.1 =
        "CR05015202001026284066"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.HR())
          .setBankCode("1001005")
          .setAccountNumber("1863000160")
          .build()
        elem.1 =
        "HR1210010051863000160"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.CY())
          .setBankCode("002")
          .setBranchCode("00128")
          .setAccountNumber("0000001200527600")
          .build()
        elem.1 =
        "CY17002001280000001200527600"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.CZ())
          .setBankCode("0800")
          .setAccountNumber("0000192000145399")
          .build()
        elem.1 =
        "CZ6508000000192000145399"
        result.insert(elem, at: result.count)
      }
      
      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.DK())
          .setBankCode("0040")
          .setAccountNumber("0440116243")
          .build()
        elem.1 =
        "DK5000400440116243"
        result.insert(elem, at: result.count)
      }
      
      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.DO())
          .setBankCode("BAGR")
          .setAccountNumber("00000001212453611324")
          .build()
        elem.1 =
        "DO28BAGR00000001212453611324"
        result.insert(elem, at: result.count)
      }
      
      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.EE())
          .setBankCode("22")
          .setBranchCode("00")
          .setAccountNumber("22102014568")
          .setNationalCheckDigit("5")
          .build()
        elem.1 =
        "EE382200221020145685"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.EG())
          .setBankCode("0019")
          .setBranchCode("0005")
          .setAccountNumber("00000000263180002")
          .build()
        elem.1 =
        "EG380019000500000000263180002"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.FI())
          .setBankCode("123456")
          .setAccountNumber("0000078")
          .setNationalCheckDigit("5")
          .build()
        elem.1 =
        "FI2112345600000785"
        result.insert(elem, at: result.count)
      }
      
      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.AX())
          .setBankCode("987654")
          .setAccountNumber("0002033")
          .setNationalCheckDigit("5")
          .build()
        elem.1 =
        "AX7898765400020335"
        result.insert(elem, at: result.count)
      }
      
      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.FR())
          .setBankCode("20041")
          .setBranchCode("01005")
          .setAccountNumber("0500013M026")
          .setNationalCheckDigit("06")
          .build()
        elem.1 =
        "FR1420041010050500013M02606"
        result.insert(elem, at: result.count)
      }
      
      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.GE())
          .setBankCode("NB")
          .setAccountNumber("0000000101904917")
          .build()
        elem.1 =
        "GE29NB0000000101904917"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.GF())
          .setBankCode("12345")
          .setBranchCode("12345")
          .setAccountNumber("123456789AB")
          .setNationalCheckDigit("13")
          .build()
        elem.1 =
        "GF121234512345123456789AB13"
        result.insert(elem, at: result.count)}
      
      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.DE())
          .setBankCode("37040044")
          .setAccountNumber("0532013000")
          .build()
        elem.1 =
        "DE89370400440532013000"
        result.insert(elem, at: result.count)
      }
      
      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.GI())
          .setBankCode("NWBK")
          .setAccountNumber("000000007099453")
          .build()
        elem.1 =
        "GI75NWBK000000007099453"
        result.insert(elem, at: result.count)
      }
      
      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.GP())
          .setBankCode("12345")
          .setBranchCode("12345")
          .setAccountNumber("123456789AB")
          .setNationalCheckDigit("13")
          .build()
        elem.1 =
        "GP791234512345123456789AB13"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.GR())
          .setBankCode("011")
          .setBranchCode("0125")
          .setAccountNumber("0000000012300695")
          .build()
        elem.1 =
        "GR1601101250000000012300695"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.GT())
          .setBankCode("TRAJ")
          .setAccountNumber("01020000001210029690")
          .build()
        elem.1 =
        "GT82TRAJ01020000001210029690"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.HU())
          .setBankCode("117")
          .setBranchCode("7301")
          .setAccountNumber("6111110180000000")
          .setNationalCheckDigit("0")
          .build()
        elem.1 =
        "HU42117730161111101800000000"
        result.insert(elem, at: result.count)
      }
      
      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.IS())
          .setBankCode("01")
          .setBranchCode("59")
          .setAccountType("26")
          .setAccountNumber("007654")
          .setIdentificationNumber("5510730339")
          .build()
        elem.1 =
        "IS140159260076545510730339"
        result.insert(elem, at: result.count)
      }
      
      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.IE())
          .setBankCode("AIBK")
          .setBranchCode("931152")
          .setAccountNumber("12345678")
          .build()
        elem.1 =
        "IE29AIBK93115212345678"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.IL())
          .setBankCode("010")
          .setBranchCode("800")
          .setAccountNumber("0000099999999")
          .build()
        elem.1 =
        "IL620108000000099999999"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.IT())
          .setBankCode("05428")
          .setBranchCode("11101")
          .setNationalCheckDigit("X")
          .setAccountNumber("000000123456")
          .build()
        elem.1 =
        "IT60X0542811101000000123456"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.JO())
          .setBankCode("CBJO")
          .setBranchCode("0010")
          .setAccountNumber("000000000131000302")
          .build()
        elem.1 =
        "JO94CBJO0010000000000131000302"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.KZ())
          .setBankCode("125")
          .setAccountNumber("KZT5004100100")
          .build()
        elem.1 =
        "KZ86125KZT5004100100"
        result.insert(elem, at: result.count)
      }
      
      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.KW())
          .setBankCode("CBKU")
          .setAccountNumber("0000000000001234560101")
          .build()
        elem.1 =
        "KW81CBKU0000000000001234560101"
        result.insert(elem, at: result.count)
      }
      
      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.LC())
          .setBankCode("HEMM")
          .setAccountNumber("000100010012001200023015")
          .build()
        elem.1 =
        "LC55HEMM000100010012001200023015"
        result.insert(elem, at: result.count)
      }
      
      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.LV())
          .setBankCode("BANK")
          .setAccountNumber("0000435195001")
          .build()
        elem.1 =
        "LV80BANK0000435195001"
        result.insert(elem, at: result.count)
      }
      
      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.LB())
          .setBankCode("0999")
          .setAccountNumber("00000001001901229114")
          .build()
        elem.1 =
        "LB62099900000001001901229114"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.LI())
          .setBankCode("08810")
          .setAccountNumber("0002324013AA")
          .build()
        elem.1 =
        "LI21088100002324013AA"
        result.insert(elem, at: result.count)
      }
      
      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.LT())
          .setBankCode("10000")
          .setAccountNumber("11101001000")
          .build()
        elem.1 =
        "LT121000011101001000"
        result.insert(elem, at: result.count)
      }
      
      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.LU())
          .setBankCode("001")
          .setAccountNumber("9400644750000")
          .build()
        elem.1 =
        "LU280019400644750000"
        result.insert(elem, at: result.count)
      }
      
      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.MF())
          .setBankCode("12345")
          .setBranchCode("12345")
          .setAccountNumber("123456789AB")
          .setNationalCheckDigit("13")
          .build()
        elem.1 =
        "MF551234512345123456789AB13"
        result.insert(elem, at: result.count)
      }
      
      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.MK())
          .setBankCode("250")
          .setAccountNumber("1200000589")
          .setNationalCheckDigit("84")
          .build()
        elem.1 =
        "MK07250120000058984"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.MT())
          .setBankCode("MALT")
          .setBranchCode("01100")
          .setAccountNumber("0012345MTLCAST001S")
          .build()
        elem.1 =
        "MT84MALT011000012345MTLCAST001S"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.MR())
          .setBankCode("00020")
          .setBranchCode("00101")
          .setAccountNumber("00001234567")
          .setNationalCheckDigit("53")
          .build()
        elem.1 =
        "MR1300020001010000123456753"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.MU())
          .setBankCode("BOMM01")
          .setBranchCode("01")
          .setAccountNumber("101030300200000MUR")
          .build()
        elem.1 =
        "MU17BOMM0101101030300200000MUR"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.MD())
          .setBankCode("AG")
          .setAccountNumber("000225100013104168")
          .build()
        elem.1 =
        "MD24AG000225100013104168"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.MC())
          .setBankCode("11222")
          .setBranchCode("00001")
          .setAccountNumber("01234567890")
          .setNationalCheckDigit("30")
          .build()
        elem.1 =
        "MC5811222000010123456789030"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.ME())
          .setBankCode("505")
          .setAccountNumber("0000123456789")
          .setNationalCheckDigit("51")
          .build()
        elem.1 =
        "ME25505000012345678951"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.MQ())
          .setBankCode("12345")
          .setBranchCode("12345")
          .setAccountNumber("123456789AB")
          .setNationalCheckDigit("13")
          .build()
        elem.1 =
        "MQ221234512345123456789AB13"
        result.insert(elem, at: result.count)
      }
      
      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.NC())
          .setBankCode("12345")
          .setBranchCode("12345")
          .setAccountNumber("123456789AB")
          .setNationalCheckDigit("13")
          .build()
        elem.1 =
        "NC551234512345123456789AB13"
        result.insert(elem, at: result.count)
      }
      
      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.NL())
          .setBankCode("ABNA")
          .setAccountNumber("0417164300")
          .build()
        elem.1 =
        "NL91ABNA0417164300"
        result.insert(elem, at: result.count)
      }
      
      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.NO())
          .setBankCode("8601")
          .setAccountNumber("111794")
          .setNationalCheckDigit("7")
          .build()
        elem.1 =
        "NO9386011117947"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.PF())
          .setBankCode("12345")
          .setBranchCode("12345")
          .setAccountNumber("123456789AB")
          .setNationalCheckDigit("13")
          .build()
        elem.1 =
        "PF281234512345123456789AB13"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.PK())
          .setBankCode("SCBL")
          .setAccountNumber("0000001123456702")
          .build()
        elem.1 =
        "PK36SCBL0000001123456702"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.PM())
          .setBankCode("12345")
          .setBranchCode("12345")
          .setAccountNumber("123456789AB")
          .setNationalCheckDigit("13")
          .build()
        elem.1 =
        "PM071234512345123456789AB13"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.PS())
          .setBankCode("PALS")
          .setAccountNumber("000000000400123456702")
          .build()
        elem.1 =
        "PS92PALS000000000400123456702"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.PL())
          .setBankCode("109")
          .setBranchCode("0101")
          .setAccountNumber("0000071219812874")
          .setNationalCheckDigit("4")
          .build()
        elem.1 =
        "PL61109010140000071219812874"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.PT())
          .setBankCode("0002")
          .setBranchCode("0123")
          .setAccountNumber("12345678901")
          .setNationalCheckDigit("54")
          .build()
        elem.1 =
        "PT50000201231234567890154"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.RE())
          .setBankCode("12345")
          .setBranchCode("12345")
          .setAccountNumber("123456789AB")
          .setNationalCheckDigit("13")
          .build()
        elem.1 =
        "RE131234512345123456789AB13"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.RO())
          .setBankCode("AAAA")
          .setAccountNumber("1B31007593840000")
          .build()
        elem.1 =
        "RO49AAAA1B31007593840000"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.QA())
          .setBankCode("DOHB")
          .setAccountNumber("00001234567890ABCDEFG")
          .build()
        elem.1 =
        "QA58DOHB00001234567890ABCDEFG"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.SC())
          .setBankCode("SSCB")
          .setBranchCode("1101")
          .setAccountNumber("0000000000001497")
          .setAccountType("USD")
          .build()
        elem.1 =
        "SC18SSCB11010000000000001497USD"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.SM())
          .setBankCode("03225")
          .setBranchCode("09800")
          .setAccountNumber("000000270100")
          .setNationalCheckDigit("U")
          .build()
        elem.1 =
        "SM86U0322509800000000270100"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.ST())
          .setBankCode("0001")
          .setBranchCode("0001")
          .setAccountNumber("0051845310112")
          .build()
        elem.1 =
        "ST68000100010051845310112"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.SA())
          .setBankCode("80")
          .setAccountNumber("000000608010167519")
          .build()
        elem.1 =
        "SA0380000000608010167519"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.RS())
          .setBankCode("260")
          .setBranchCode("26")
          .setAccountNumber("0056010016113")
          .setNationalCheckDigit("79")
          .build()
        elem.1 =
        "RS35260005601001611379"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.RU())
          .setBankCode("044525600")
          .setBranchCode("40702")
          .setAccountNumber("810412345678901")
          .build()
        elem.1 =
        "RU0204452560040702810412345678901"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.SK())
          .setBankCode("1200")
          .setAccountNumber("0000198742637541")
          .build()
        elem.1 =
        "SK3112000000198742637541"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.SV())
          .setBankCode("CENR")
          .setAccountNumber("00000000000000700025")
          .build()
        elem.1 =
        "SV62CENR00000000000000700025"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.SI())
          .setBankCode("26")
          .setBranchCode("330")
          .setAccountNumber("00120390")
          .setNationalCheckDigit("86")
          .build()
        elem.1 =
        "SI56263300012039086"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.ES())
          .setBankCode("2100")
          .setBranchCode("0418")
          .setAccountNumber("0200051332")
          .setNationalCheckDigit("45")
          .build()
        elem.1 =
        "ES9121000418450200051332"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.SE())
          .setBankCode("500")
          .setAccountNumber("00000058398257466")
          .build()
        elem.1 =
        "SE4550000000058398257466"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.CH())
          .setBankCode("00762")
          .setAccountNumber("011623852957")
          .build()
        elem.1 =
        "CH9300762011623852957"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.TF())
          .setBankCode("12345")
          .setBranchCode("12345")
          .setAccountNumber("123456789AB")
          .setNationalCheckDigit("13")
          .build()
        elem.1 =
        "TF891234512345123456789AB13"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.TN())
          .setBankCode("10")
          .setBranchCode("006")
          .setAccountNumber("035183598478831")
          .build()
        elem.1 =
        "TN5910006035183598478831"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.TR())
          .setBankCode("00061")
          .setAccountNumber("0519786457841326")
          .setNationalCheckDigit("0")
          .build()
        elem.1 =
        "TR330006100519786457841326"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.AE())
          .setBankCode("033")
          .setAccountNumber("1234567890123456")
          .build()
        elem.1 =
        "AE070331234567890123456"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.GB())
          .setBankCode("NWBK")
          .setBranchCode("601613")
          .setAccountNumber("31926819")
          .build()
        elem.1 =
        "GB29NWBK60161331926819"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.IM())
          .setBankCode("HBUK")
          .setBranchCode("401276")
          .setAccountNumber("12345678")
          .build()
        elem.1 =
        "IM20HBUK40127612345678"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.GG())
          .setBankCode("INGB")
          .setBranchCode("238859")
          .setAccountNumber("12345678")
          .build()
        elem.1 =
        "GG65INGB23885912345678"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.JE())
          .setBankCode("DEUT")
          .setBranchCode("405081")
          .setAccountNumber("12345678")
          .build()
        elem.1 =
        "JE51DEUT40508112345678"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.VA())
          .setBankCode("001")
          .setAccountNumber("123000012345678")
          .build()
        elem.1 =
        "VA59001123000012345678"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.VG())
          .setBankCode("VPVG")
          .setAccountNumber("0000012345678901")
          .build()
        elem.1 =
        "VG96VPVG0000012345678901"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.TL())
          .setBankCode("008")
          .setAccountNumber("00123456789101")
          .setNationalCheckDigit("57")
          .build()
        elem.1 =
        "TL380080012345678910157"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.WF())
          .setBankCode("12345")
          .setBranchCode("12345")
          .setAccountNumber("123456789AB")
          .setNationalCheckDigit("13")
          .build()
        elem.1 =
        "WF621234512345123456789AB13"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.XK())
          .setBankCode("10")
          .setBranchCode("00")
          .setAccountNumber("0000000000")
          .setNationalCheckDigit("53")
          .build()
        elem.1 =
        "XK051000000000000053"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.IR())
          .setBankCode("017")
          .setAccountNumber("0000000000123456789")
          .build()
        elem.1 =
        "IR200170000000000123456789"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.FO())
          .setBankCode("5432")
          .setAccountNumber("038889994")
          .setNationalCheckDigit("4")
          .build()
        elem.1 =
        "FO9754320388899944"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.GL())
          .setBankCode("6471")
          .setAccountNumber("0001000206")
          .build()
        elem.1 =
        "GL8964710001000206"
        result.insert(elem, at: result.count)
      }
      
      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.UA())
          .setBankCode("354347")
          .setAccountNumber("0006762462054925026")
          .build()
        elem.1 =
        "UA573543470006762462054925026"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.YT())
          .setBankCode("12345")
          .setBranchCode("12345")
          .setAccountNumber("123456789AB")
          .setNationalCheckDigit("13")
          .build()
        elem.1 =
        "YT021234512345123456789AB13"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.IQ())
          .setBankCode("NBIQ")
          .setBranchCode("850")
          .setAccountNumber("123456789012")
          .build()
        elem.1 =
        "IQ98NBIQ850123456789012"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.GA())
          .setBankCode("40001")
          .setBranchCode("09080")
          .setAccountNumber("0008120005890")
          .build()
        elem.1 =
        "GA2140001090800008120005890"
        result.insert(elem, at: result.count)
      }
      
      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.CV())
          .setBankCode("0002")
          .setBranchCode("0000")
          .setAccountNumber("0311180710148")
          .build()
        elem.1 =
        "CV64000200000311180710148"
        result.insert(elem, at: result.count)
      }
      
      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.OM())
          .setBankCode("028")
          .setAccountNumber("12345678901")
          .leftPadding(true)
          .build()
        elem.1 =
        "OM040280000012345678901"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .setCountryCode(CountryCode.BI())
          .setBankCode("10000")
          .setBranchCode("10001")
          .setAccountNumber("0000332045181")
          .build()
        elem.1 =
        "BI4210000100010000332045181"
        result.insert(elem, at: result.count)
      }
      
      return result
    }
    
    public static func getBicData() -> [String]{
      return [
          "DEUTDEFF",
          "DEUTDEFF500",
          "NEDSZAJJXXX",
          "DABADKKK",
          "UNCRIT2B912",
          "DSBACNBXSHA",
          "BNORPHMM"
        ]
    }
  }
}
