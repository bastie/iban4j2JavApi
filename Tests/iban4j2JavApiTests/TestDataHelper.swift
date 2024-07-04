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
          .countryCode(CountryCode.AL())
          .bankCode("212")
          .branchCode("1100")
          .accountNumber("0000000235698741")
          .nationalCheckDigit("9")
          .build()
        elem.1 =
        "AL47212110090000000235698741"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.AD())
          .bankCode("0001")
          .branchCode("2030")
          .accountNumber("200359100100")
          .build()
        elem.1 =
        "AD1200012030200359100100"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.AO())
          .bankCode("0006")
          .branchCode("0000")
          .accountNumber("53518203301")
          .nationalCheckDigit("69")
          .build()
        elem.1 =
        "AO06000600005351820330169"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.AT())
          .bankCode("19043")
          .accountNumber("00234573201")
          .build()
        elem.1 =
        "AT611904300234573201"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.AZ())
          .bankCode("NABZ")
          .accountNumber("00000000137010001944")
          .build()
        elem.1 =
        "AZ21NABZ00000000137010001944"
        result.insert(elem, at: result.count)
      }
      
      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.BH())
          .bankCode("SCBL")
          .accountNumber("BHD18903608801")
          .build()
        elem.1 =
        "BH72SCBLBHD18903608801"
        result.insert(elem, at: result.count)
      }
      
      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.BE())
          .bankCode("539")
          .accountNumber("0075470")
          .nationalCheckDigit("34")
          .build()
        elem.1 =
        "BE68539007547034"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.BA())
          .bankCode("129")
          .branchCode("007")
          .accountNumber("94010284")
          .nationalCheckDigit("94")
          .build()
        elem.1 =
        "BA391290079401028494"
        result.insert(elem, at: result.count)
      }
      
      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.BR())
          .bankCode("00360305")
          .branchCode("00001")
          .accountNumber("0009795493")
          .accountType("P")
          .ownerAccountType("1")
          .build()
        elem.1 =
        "BR9700360305000010009795493P1"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.BG())
          .bankCode("BNBG")
          .branchCode("9661")
          .accountNumber("20345678")
          .accountType("10")
          .build()
        elem.1 =
        "BG80BNBG96611020345678"
        result.insert(elem, at: result.count)
      }
      
      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.BL())
          .bankCode("12345")
          .branchCode("12345")
          .accountNumber("123456789AB")
          .nationalCheckDigit("13")
          .build()
        elem.1 =
        "BL391234512345123456789AB13"
        result.insert(elem, at: result.count)
      }
            
      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.BY())
          .bankCode("NBRB")
          .branchCode("3600")
          .accountNumber("900000002Z00AB00")
          .build()
        elem.1 =
        "BY13NBRB3600900000002Z00AB00"
        result.insert(elem, at: result.count)
      }
      
      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.CR())
          .bankCode("0152")
          .accountNumber("02001026284066")
          .build()
        elem.1 =
        "CR05015202001026284066"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.HR())
          .bankCode("1001005")
          .accountNumber("1863000160")
          .build()
        elem.1 =
        "HR1210010051863000160"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.CY())
          .bankCode("002")
          .branchCode("00128")
          .accountNumber("0000001200527600")
          .build()
        elem.1 =
        "CY17002001280000001200527600"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.CZ())
          .bankCode("0800")
          .accountNumber("0000192000145399")
          .build()
        elem.1 =
        "CZ6508000000192000145399"
        result.insert(elem, at: result.count)
      }
      
      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.DK())
          .bankCode("0040")
          .accountNumber("0440116243")
          .build()
        elem.1 =
        "DK5000400440116243"
        result.insert(elem, at: result.count)
      }
      
      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.DO())
          .bankCode("BAGR")
          .accountNumber("00000001212453611324")
          .build()
        elem.1 =
        "DO28BAGR00000001212453611324"
        result.insert(elem, at: result.count)
      }
      
      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.EE())
          .bankCode("22")
          .branchCode("00")
          .accountNumber("22102014568")
          .nationalCheckDigit("5")
          .build()
        elem.1 =
        "EE382200221020145685"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.EG())
          .bankCode("0019")
          .branchCode("0005")
          .accountNumber("00000000263180002")
          .build()
        elem.1 =
        "EG380019000500000000263180002"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.FI())
          .bankCode("123456")
          .accountNumber("0000078")
          .nationalCheckDigit("5")
          .build()
        elem.1 =
        "FI2112345600000785"
        result.insert(elem, at: result.count)
      }
      
      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.AX())
          .bankCode("987654")
          .accountNumber("0002033")
          .nationalCheckDigit("5")
          .build()
        elem.1 =
        "AX7898765400020335"
        result.insert(elem, at: result.count)
      }
      
      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.FR())
          .bankCode("20041")
          .branchCode("01005")
          .accountNumber("0500013M026")
          .nationalCheckDigit("06")
          .build()
        elem.1 =
        "FR1420041010050500013M02606"
        result.insert(elem, at: result.count)
      }
      
      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.GE())
          .bankCode("NB")
          .accountNumber("0000000101904917")
          .build()
        elem.1 =
        "GE29NB0000000101904917"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.GF())
          .bankCode("12345")
          .branchCode("12345")
          .accountNumber("123456789AB")
          .nationalCheckDigit("13")
          .build()
        elem.1 =
        "GF121234512345123456789AB13"
        result.insert(elem, at: result.count)}
      
      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.DE())
          .bankCode("37040044")
          .accountNumber("0532013000")
          .build()
        elem.1 =
        "DE89370400440532013000"
        result.insert(elem, at: result.count)
      }
      
      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.GI())
          .bankCode("NWBK")
          .accountNumber("000000007099453")
          .build()
        elem.1 =
        "GI75NWBK000000007099453"
        result.insert(elem, at: result.count)
      }
      
      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.GP())
          .bankCode("12345")
          .branchCode("12345")
          .accountNumber("123456789AB")
          .nationalCheckDigit("13")
          .build()
        elem.1 =
        "GP791234512345123456789AB13"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.GR())
          .bankCode("011")
          .branchCode("0125")
          .accountNumber("0000000012300695")
          .build()
        elem.1 =
        "GR1601101250000000012300695"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.GT())
          .bankCode("TRAJ")
          .accountNumber("01020000001210029690")
          .build()
        elem.1 =
        "GT82TRAJ01020000001210029690"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.HU())
          .bankCode("117")
          .branchCode("7301")
          .accountNumber("6111110180000000")
          .nationalCheckDigit("0")
          .build()
        elem.1 =
        "HU42117730161111101800000000"
        result.insert(elem, at: result.count)
      }
      
      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.IS())
          .bankCode("01")
          .branchCode("59")
          .accountType("26")
          .accountNumber("007654")
          .identificationNumber("5510730339")
          .build()
        elem.1 =
        "IS140159260076545510730339"
        result.insert(elem, at: result.count)
      }
      
      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.IE())
          .bankCode("AIBK")
          .branchCode("931152")
          .accountNumber("12345678")
          .build()
        elem.1 =
        "IE29AIBK93115212345678"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.IL())
          .bankCode("010")
          .branchCode("800")
          .accountNumber("0000099999999")
          .build()
        elem.1 =
        "IL620108000000099999999"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.IT())
          .bankCode("05428")
          .branchCode("11101")
          .nationalCheckDigit("X")
          .accountNumber("000000123456")
          .build()
        elem.1 =
        "IT60X0542811101000000123456"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.JO())
          .bankCode("CBJO")
          .branchCode("0010")
          .accountNumber("000000000131000302")
          .build()
        elem.1 =
        "JO94CBJO0010000000000131000302"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.KZ())
          .bankCode("125")
          .accountNumber("KZT5004100100")
          .build()
        elem.1 =
        "KZ86125KZT5004100100"
        result.insert(elem, at: result.count)
      }
      
      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.KW())
          .bankCode("CBKU")
          .accountNumber("0000000000001234560101")
          .build()
        elem.1 =
        "KW81CBKU0000000000001234560101"
        result.insert(elem, at: result.count)
      }
      
      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.LC())
          .bankCode("HEMM")
          .accountNumber("000100010012001200023015")
          .build()
        elem.1 =
        "LC55HEMM000100010012001200023015"
        result.insert(elem, at: result.count)
      }
      
      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.LV())
          .bankCode("BANK")
          .accountNumber("0000435195001")
          .build()
        elem.1 =
        "LV80BANK0000435195001"
        result.insert(elem, at: result.count)
      }
      
      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.LB())
          .bankCode("0999")
          .accountNumber("00000001001901229114")
          .build()
        elem.1 =
        "LB62099900000001001901229114"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.LI())
          .bankCode("08810")
          .accountNumber("0002324013AA")
          .build()
        elem.1 =
        "LI21088100002324013AA"
        result.insert(elem, at: result.count)
      }
      
      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.LT())
          .bankCode("10000")
          .accountNumber("11101001000")
          .build()
        elem.1 =
        "LT121000011101001000"
        result.insert(elem, at: result.count)
      }
      
      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.LU())
          .bankCode("001")
          .accountNumber("9400644750000")
          .build()
        elem.1 =
        "LU280019400644750000"
        result.insert(elem, at: result.count)
      }
      
      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.MF())
          .bankCode("12345")
          .branchCode("12345")
          .accountNumber("123456789AB")
          .nationalCheckDigit("13")
          .build()
        elem.1 =
        "MF551234512345123456789AB13"
        result.insert(elem, at: result.count)
      }
      
      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.MK())
          .bankCode("250")
          .accountNumber("1200000589")
          .nationalCheckDigit("84")
          .build()
        elem.1 =
        "MK07250120000058984"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.MT())
          .bankCode("MALT")
          .branchCode("01100")
          .accountNumber("0012345MTLCAST001S")
          .build()
        elem.1 =
        "MT84MALT011000012345MTLCAST001S"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.MR())
          .bankCode("00020")
          .branchCode("00101")
          .accountNumber("00001234567")
          .nationalCheckDigit("53")
          .build()
        elem.1 =
        "MR1300020001010000123456753"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.MU())
          .bankCode("BOMM01")
          .branchCode("01")
          .accountNumber("101030300200000MUR")
          .build()
        elem.1 =
        "MU17BOMM0101101030300200000MUR"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.MD())
          .bankCode("AG")
          .accountNumber("000225100013104168")
          .build()
        elem.1 =
        "MD24AG000225100013104168"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.MC())
          .bankCode("11222")
          .branchCode("00001")
          .accountNumber("01234567890")
          .nationalCheckDigit("30")
          .build()
        elem.1 =
        "MC5811222000010123456789030"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.ME())
          .bankCode("505")
          .accountNumber("0000123456789")
          .nationalCheckDigit("51")
          .build()
        elem.1 =
        "ME25505000012345678951"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.MQ())
          .bankCode("12345")
          .branchCode("12345")
          .accountNumber("123456789AB")
          .nationalCheckDigit("13")
          .build()
        elem.1 =
        "MQ221234512345123456789AB13"
        result.insert(elem, at: result.count)
      }
      
      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.NC())
          .bankCode("12345")
          .branchCode("12345")
          .accountNumber("123456789AB")
          .nationalCheckDigit("13")
          .build()
        elem.1 =
        "NC551234512345123456789AB13"
        result.insert(elem, at: result.count)
      }
      
      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.NL())
          .bankCode("ABNA")
          .accountNumber("0417164300")
          .build()
        elem.1 =
        "NL91ABNA0417164300"
        result.insert(elem, at: result.count)
      }
      
      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.NO())
          .bankCode("8601")
          .accountNumber("111794")
          .nationalCheckDigit("7")
          .build()
        elem.1 =
        "NO9386011117947"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.PF())
          .bankCode("12345")
          .branchCode("12345")
          .accountNumber("123456789AB")
          .nationalCheckDigit("13")
          .build()
        elem.1 =
        "PF281234512345123456789AB13"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.PK())
          .bankCode("SCBL")
          .accountNumber("0000001123456702")
          .build()
        elem.1 =
        "PK36SCBL0000001123456702"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.PM())
          .bankCode("12345")
          .branchCode("12345")
          .accountNumber("123456789AB")
          .nationalCheckDigit("13")
          .build()
        elem.1 =
        "PM071234512345123456789AB13"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.PS())
          .bankCode("PALS")
          .accountNumber("000000000400123456702")
          .build()
        elem.1 =
        "PS92PALS000000000400123456702"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.PL())
          .bankCode("109")
          .branchCode("0101")
          .accountNumber("0000071219812874")
          .nationalCheckDigit("4")
          .build()
        elem.1 =
        "PL61109010140000071219812874"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.PT())
          .bankCode("0002")
          .branchCode("0123")
          .accountNumber("12345678901")
          .nationalCheckDigit("54")
          .build()
        elem.1 =
        "PT50000201231234567890154"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.RE())
          .bankCode("12345")
          .branchCode("12345")
          .accountNumber("123456789AB")
          .nationalCheckDigit("13")
          .build()
        elem.1 =
        "RE131234512345123456789AB13"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.RO())
          .bankCode("AAAA")
          .accountNumber("1B31007593840000")
          .build()
        elem.1 =
        "RO49AAAA1B31007593840000"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.QA())
          .bankCode("DOHB")
          .accountNumber("00001234567890ABCDEFG")
          .build()
        elem.1 =
        "QA58DOHB00001234567890ABCDEFG"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.SC())
          .bankCode("SSCB")
          .branchCode("1101")
          .accountNumber("0000000000001497")
          .accountType("USD")
          .build()
        elem.1 =
        "SC18SSCB11010000000000001497USD"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.SM())
          .bankCode("03225")
          .branchCode("09800")
          .accountNumber("000000270100")
          .nationalCheckDigit("U")
          .build()
        elem.1 =
        "SM86U0322509800000000270100"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.ST())
          .bankCode("0001")
          .branchCode("0001")
          .accountNumber("0051845310112")
          .build()
        elem.1 =
        "ST68000100010051845310112"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.SA())
          .bankCode("80")
          .accountNumber("000000608010167519")
          .build()
        elem.1 =
        "SA0380000000608010167519"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.RS())
          .bankCode("260")
          .branchCode("26")
          .accountNumber("0056010016113")
          .nationalCheckDigit("79")
          .build()
        elem.1 =
        "RS35260005601001611379"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.RU())
          .bankCode("044525600")
          .branchCode("40702")
          .accountNumber("810412345678901")
          .build()
        elem.1 =
        "RU0204452560040702810412345678901"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.SK())
          .bankCode("1200")
          .accountNumber("0000198742637541")
          .build()
        elem.1 =
        "SK3112000000198742637541"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.SV())
          .bankCode("CENR")
          .accountNumber("00000000000000700025")
          .build()
        elem.1 =
        "SV62CENR00000000000000700025"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.SI())
          .bankCode("26")
          .branchCode("330")
          .accountNumber("00120390")
          .nationalCheckDigit("86")
          .build()
        elem.1 =
        "SI56263300012039086"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.ES())
          .bankCode("2100")
          .branchCode("0418")
          .accountNumber("0200051332")
          .nationalCheckDigit("45")
          .build()
        elem.1 =
        "ES9121000418450200051332"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.SE())
          .bankCode("500")
          .accountNumber("00000058398257466")
          .build()
        elem.1 =
        "SE4550000000058398257466"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.CH())
          .bankCode("00762")
          .accountNumber("011623852957")
          .build()
        elem.1 =
        "CH9300762011623852957"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.TF())
          .bankCode("12345")
          .branchCode("12345")
          .accountNumber("123456789AB")
          .nationalCheckDigit("13")
          .build()
        elem.1 =
        "TF891234512345123456789AB13"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.TN())
          .bankCode("10")
          .branchCode("006")
          .accountNumber("035183598478831")
          .build()
        elem.1 =
        "TN5910006035183598478831"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.TR())
          .bankCode("00061")
          .accountNumber("0519786457841326")
          .nationalCheckDigit("0")
          .build()
        elem.1 =
        "TR330006100519786457841326"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.AE())
          .bankCode("033")
          .accountNumber("1234567890123456")
          .build()
        elem.1 =
        "AE070331234567890123456"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.GB())
          .bankCode("NWBK")
          .branchCode("601613")
          .accountNumber("31926819")
          .build()
        elem.1 =
        "GB29NWBK60161331926819"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.IM())
          .bankCode("HBUK")
          .branchCode("401276")
          .accountNumber("12345678")
          .build()
        elem.1 =
        "IM20HBUK40127612345678"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.GG())
          .bankCode("INGB")
          .branchCode("238859")
          .accountNumber("12345678")
          .build()
        elem.1 =
        "GG65INGB23885912345678"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.JE())
          .bankCode("DEUT")
          .branchCode("405081")
          .accountNumber("12345678")
          .build()
        elem.1 =
        "JE51DEUT40508112345678"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.VA())
          .bankCode("001")
          .accountNumber("123000012345678")
          .build()
        elem.1 =
        "VA59001123000012345678"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.VG())
          .bankCode("VPVG")
          .accountNumber("0000012345678901")
          .build()
        elem.1 =
        "VG96VPVG0000012345678901"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.TL())
          .bankCode("008")
          .accountNumber("00123456789101")
          .nationalCheckDigit("57")
          .build()
        elem.1 =
        "TL380080012345678910157"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.WF())
          .bankCode("12345")
          .branchCode("12345")
          .accountNumber("123456789AB")
          .nationalCheckDigit("13")
          .build()
        elem.1 =
        "WF621234512345123456789AB13"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.XK())
          .bankCode("10")
          .branchCode("00")
          .accountNumber("0000000000")
          .nationalCheckDigit("53")
          .build()
        elem.1 =
        "XK051000000000000053"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.IR())
          .bankCode("017")
          .accountNumber("0000000000123456789")
          .build()
        elem.1 =
        "IR200170000000000123456789"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.FO())
          .bankCode("5432")
          .accountNumber("038889994")
          .nationalCheckDigit("4")
          .build()
        elem.1 =
        "FO9754320388899944"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.GL())
          .bankCode("6471")
          .accountNumber("0001000206")
          .build()
        elem.1 =
        "GL8964710001000206"
        result.insert(elem, at: result.count)
      }
      
      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.UA())
          .bankCode("354347")
          .accountNumber("0006762462054925026")
          .build()
        elem.1 =
        "UA573543470006762462054925026"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.YT())
          .bankCode("12345")
          .branchCode("12345")
          .accountNumber("123456789AB")
          .nationalCheckDigit("13")
          .build()
        elem.1 =
        "YT021234512345123456789AB13"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.IQ())
          .bankCode("NBIQ")
          .branchCode("850")
          .accountNumber("123456789012")
          .build()
        elem.1 =
        "IQ98NBIQ850123456789012"
        result.insert(elem, at: result.count)
      }

      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.GA())
          .bankCode("40001")
          .branchCode("09080")
          .accountNumber("0008120005890")
          .build()
        elem.1 =
        "GA2140001090800008120005890"
        result.insert(elem, at: result.count)
      }
      
      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.CV())
          .bankCode("0002")
          .branchCode("0000")
          .accountNumber("0311180710148")
          .build()
        elem.1 =
        "CV64000200000311180710148"
        result.insert(elem, at: result.count)
      }
      
      do {
        var elem : (Iban, String)
        elem.0 =
        try! Builder()
          .countryCode(CountryCode.OM())
          .bankCode("028")
          .accountNumber("12345678901")
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
          .countryCode(CountryCode.BI())
          .bankCode("10000")
          .branchCode("10001")
          .accountNumber("0000332045181")
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
