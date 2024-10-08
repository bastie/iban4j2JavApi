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

import XCTest
import Foundation
import JavApi

@testable import iban4j2JavApi

extension org.iban4j {
  
  public class IbanTest : XCTestCase{
    
    public func test_ReadmeSnippets() throws {
      // How to generate Iban
      do {
        let iban = try org.iban4j.Builder()
          .setCountryCode(org.iban4j.CountryCode.AT())
          .setBankCode("19043")
          .setAccountNumber("00234573201")
          .build();
        
        XCTAssertNotNil(iban)
      }
      
      // How to create Iban object from String
      do {
        let iban = try Iban.valueOf("DE89370400440532013000");
        XCTAssertNotNil(iban)
      }
      
      // How to create Iban object from formatted String
      do {
        let iban = try Iban.valueOf("DE89 3704 0044 0532 0130 00", IbanFormat.Default);
        XCTAssertNotNil(iban)
      }
      
      // How to generate random Iban
      do {
        XCTAssertNoThrow(
          try Iban.random(org.iban4j.CountryCode.AT())
        )
        XCTAssertNoThrow(
          try Iban.random()
        )
        XCTAssertNoThrow(
          try org.iban4j.Builder()
            .setCountryCode(org.iban4j.CountryCode.AT())
            .setBankCode("19043")
            .buildRandom()
        )
      }
      
      // How to validate Iban
      do {
        try IbanUtil.validate("AT611904300234573201");
        try IbanUtil.validate("DE89 3704 0044 0532 0130 00", IbanFormat.Default);
        // valid
      } catch {
        // invalid
      }

      // How to left pad('account number', 'bank code' and 'branch code') with zero
      let iban1 = try org.iban4j.Builder()
        .leftPadding(true)
        .setCountryCode(CountryCode.DE())
        .setBankCode("66280099")
        .setAccountNumber("123456700")
        .build();
      XCTAssertNotNil(iban1)
      
      // How to change default padding character ('0') with other
      let iban2 = try org.iban4j.Builder()
        .leftPadding(true)
        .paddingCharacter("1")
        .setCountryCode(CountryCode.DE())
        .setBankCode("66280099")
        .setAccountNumber("123456700")
        .build();
      XCTAssertNotNil(iban2)
    }
    
    public func testRomanNumericIBANThrowsError () throws {
      XCTAssertThrowsError(
        try org.iban4j.Builder()
          .setCountryCode(org.iban4j.CountryCode.AT())
          .setBankCode("1904\u{217B}")
          .setAccountNumber("00234573201")
          .build()
      )
    }
  }

  private func assertIbanUtilRandomWithSeedEquals(_ expected : String, _ seed : Int) {
    let generated : Iban = try! Iban.random(java.util.Random(seed));
    XCTAssertEqual(expected, generated.toFormattedString(),
      "expect that creating an IBAN with seed '\(seed)' is deterministic"
    )
  }
  
  public func testIbanConstructionSeeded() {
      assertIbanUtilRandomWithSeedEquals("FR46 1918 2083 691H JENI SJS3 364", 1)
      assertIbanUtilRandomWithSeedEquals("LC94 QKBB C1OY WHST MPQA 7GVB 4WBX VTP0", 2)
      assertIbanUtilRandomWithSeedEquals("DK23 0882 2804 1804 23", 3)
  }
  private static func assertIbanBuilderRandomWithSeedEquals(_ expected : String, _ seed : Int) {
    let generated : Iban = try! Builder(java.util.Random(seed)).buildRandom()
    let actual : String = generated.toFormattedString()
    XCTAssertEqual(expected, actual, "expect that creating an IBAN with seed '\(seed)' is deterministic")
  }
  

  public func testIbanBuilderConstructionSeeded() {
    org.iban4j.assertIbanBuilderRandomWithSeedEquals("FR46 1918 2083 691H JENI SJS3 364", 1)
    org.iban4j.assertIbanBuilderRandomWithSeedEquals("LC94 QKBB C1OY WHST MPQA 7GVB 4WBX VTP0", 2)
    org.iban4j.assertIbanBuilderRandomWithSeedEquals("DK23 0882 2804 1804 23", 3)
    org.iban4j.assertIbanBuilderRandomWithSeedEquals("BY38 LPL2 0836 1HJE NISJ S339 QZGT", 1)
    org.iban4j.assertIbanBuilderRandomWithSeedEquals("IE70 QKBB 0988 8722 1186 81", 2)
    org.iban4j.assertIbanBuilderRandomWithSeedEquals("MC38 0882 8280 41ER G8WO UQNL Y52", 3)
  }


  /*
   @DisplayName("Iban general test")
   final class IbanTest {
   
   @Test
   @DisplayName("IBANs With Same Data Should Be Equal")
   public void ibansWithSameDataShouldBeEqual() {
   final Iban iban1 = new Iban.Builder()
   .countryCode(CountryCode.AT)
   .bankCode("19041")
   .accountNumber("02345732012")
   .build();
   final Iban iban2 = new Iban.Builder()
   .countryCode(CountryCode.AT)
   .bankCode("19041")
   .accountNumber("02345732012")
   .build();
   
   assertThat(iban1, is(equalTo(iban2)));
   }
   
   @Test
   @DisplayName("ibansWithDifferentDataShouldNotBeEqual")
   public void ibansWithDifferentDataShouldNotBeEqual() {
   final Iban iban1 = new Iban.Builder()
   .countryCode(CountryCode.AT)
   .bankCode("19041")
   .accountNumber("02345732012")
   .build();
   final Iban iban2 = new Iban.Builder()
   .countryCode(CountryCode.AT)
   .bankCode("19041")
   .accountNumber("02345732011")
   .build();
   
   assertThat(iban1, is(not(equalTo(iban2))));
   }
   
   @Test
   @DisplayName("ibansWithStringValueAndIbanShouldNotBeEqual")
   public void ibansWithStringValueAndIbanShouldNotBeEqual() {
   final Iban iban1 = new Iban.Builder()
   .countryCode(CountryCode.AT)
   .bankCode("19043")
   .accountNumber("00234573201")
   .build();
   assertNotEquals(iban1, "AT611904300234573201");
   }
   
   @Test
   @DisplayName("ibanShouldReturnValidCountryCode")
   public void ibanShouldReturnValidCountryCode() {
   final Iban iban = new Iban.Builder()
   .countryCode(CountryCode.AT)
   .bankCode("19043")
   .accountNumber("00234573201")
   .build();
   assertThat(iban.getCountryCode(), is(equalTo(CountryCode.AT)));
   }
   
   @Test
   @DisplayName("ibanShouldReturnValidBankCode")
   public void ibanShouldReturnValidBankCode() {
   final Iban iban = new Iban.Builder()
   .countryCode(CountryCode.AT)
   .bankCode("19043")
   .accountNumber("00234573201")
   .build();
   assertThat(iban.getBankCode(), is(equalTo("19043")));
   }
   
   @Test
   @DisplayName("ibanShouldReturnValidAccountNumber")
   public void ibanShouldReturnValidAccountNumber() {
   final Iban iban = new Iban.Builder()
   .countryCode(CountryCode.AT)
   .bankCode("19043")
   .accountNumber("00234573201")
   .build();
   assertThat(iban.getAccountNumber(), is(equalTo("00234573201")));
   }
   
   @Test
   @DisplayName("ibanShouldReturnValidBranchCode")
   public void ibanShouldReturnValidBranchCode() {
   final Iban iban = new Iban.Builder()
   .countryCode(CountryCode.AD)
   .bankCode("0001")
   .branchCode("2030")
   .accountNumber("200359100100")
   .build();
   assertThat(iban.getBranchCode(), is(equalTo("2030")));
   }
   
   @Test
   @DisplayName("ibanShouldReturnValidNationalCheckDigit")
   public void ibanShouldReturnValidNationalCheckDigit() {
   final Iban iban = new Iban.Builder()
   .countryCode(CountryCode.AL)
   .bankCode("212")
   .branchCode("1100")
   .nationalCheckDigit("9")
   .accountNumber("0000000235698741")
   .build();
   assertThat(iban.getNationalCheckDigit(), is(equalTo("9")));
   }
   
   @Test
   @DisplayName("ibanShouldReturnValidAccountType")
   public void ibanShouldReturnValidAccountType() {
   final Iban iban = new Iban.Builder()
   .countryCode(CountryCode.BR)
   .bankCode("00360305")
   .branchCode("00001")
   .accountNumber("0009795493")
   .accountType("P")
   .ownerAccountType("1")
   .build();
   assertThat(iban.getAccountType(), is(equalTo("P")));
   }
   
   @Test
   @DisplayName("ibanShouldReturnValidOwnerAccountType")
   public void ibanShouldReturnValidOwnerAccountType() {
   final Iban iban = new Iban.Builder()
   .countryCode(CountryCode.BR)
   .bankCode("00360305")
   .branchCode("00001")
   .accountNumber("0009795493")
   .accountType("P")
   .ownerAccountType("1")
   .build();
   assertThat(iban.getOwnerAccountType(), is(equalTo("1")));
   }
   
   @Test
   @DisplayName("ibanShouldReturnValidIdentificationNumber")
   public void ibanShouldReturnValidIdentificationNumber() {
   final Iban iban = new Iban.Builder()
   .countryCode(CountryCode.IS)
   .bankCode("01")
   .branchCode("59")
   .accountType("26")
   .accountNumber("007654")
   .identificationNumber("5510730339")
   .build();
   assertThat(iban.getIdentificationNumber(), is(equalTo("5510730339")));
   }
   
   @Test
   @DisplayName("ibanShouldReturnValidBban")
   public void ibanShouldReturnValidBban() {
   final Iban iban = new Iban.Builder()
   .countryCode(CountryCode.AT)
   .bankCode("19043")
   .accountNumber("00234573201")
   .build();
   assertThat(iban.getBban(), is(equalTo("1904300234573201")));
   }
   
   @Test
   @DisplayName("ibanShouldReturnValidCheckDigit")
   public void ibanShouldReturnValidCheckDigit() {
   final Iban iban = new Iban.Builder()
   .countryCode(CountryCode.AT)
   .bankCode("19043")
   .accountNumber("00234573201")
   .build();
   
   assertThat(iban.getCheckDigit(), is(equalTo("61")));
   }
   
   @Test
   @DisplayName("ibansWithSameDataShouldHaveSameHashCode")
   public void ibansWithSameDataShouldHaveSameHashCode() {
   final Iban iban1 = new Iban.Builder()
   .countryCode(CountryCode.AT)
   .bankCode("19041")
   .accountNumber("02345732012")
   .build();
   final Iban iban2 = new Iban.Builder()
   .countryCode(CountryCode.AT)
   .bankCode("19041")
   .accountNumber("02345732012")
   .build();
   
   assertThat(iban1.hashCode(), is(equalTo(iban2.hashCode())));
   }
   
   @Test
   @DisplayName("ibansWithDifferentDataShouldNotHaveSameHashCode")
   public void ibansWithDifferentDataShouldNotHaveSameHashCode() {
   final Iban iban1 = new Iban.Builder()
   .countryCode(CountryCode.AT)
   .bankCode("19041")
   .accountNumber("02345732012")
   .build();
   final Iban iban2 = new Iban.Builder()
   .countryCode(CountryCode.AT)
   .bankCode("19041")
   .accountNumber("02345732011")
   .build();
   assertThat(iban1.hashCode(), is(not(equalTo(iban2.hashCode()))));
   }
   
   @Test
   @DisplayName("ibanToFormattedStringShouldHaveSpacesAfterEach4Character")
   public void ibanToFormattedStringShouldHaveSpacesAfterEach4Character() {
   final Iban iban = new Iban.Builder()
   .countryCode(CountryCode.AT)
   .bankCode("19041")
   .accountNumber("02345732012")
   .build();
   assertThat(iban.toFormattedString(), is(equalTo("AT14 1904 1023 4573 2012")));
   }
   
   @Test
   @DisplayName("ibanConstructionWithShortBankCodeShouldNotThrowExceptionIfValidationIsDisabled")
   public void ibanConstructionWithShortBankCodeShouldNotThrowExceptionIfValidationIsDisabled() {
   final Iban iban = new Iban.Builder()
   .countryCode(CountryCode.AT)
   .bankCode("1904")
   .accountNumber("A0234573201")
   .build(false);
   assertThat(iban.toFormattedString(), is(equalTo("AT40 1904 A023 4573 201")));
   }
   
   @Test
   @DisplayName("ibanConstructionWithNoneFormattingShouldReturnIban")
   public void ibanConstructionWithNoneFormattingShouldReturnIban() {
   final Iban iban = Iban.valueOf("AT611904300234573201", IbanFormat.None);
   assertThat(iban.toFormattedString(), is(equalTo("AT61 1904 3002 3457 3201")));
   }
   
   @Test
   @DisplayName("ibanConstructionWithDefaultFormattingShouldReturnIban")
   public void ibanConstructionWithDefaultFormattingShouldReturnIban() {
   final Iban iban = Iban.valueOf("AT61 1904 3002 3457 3201", IbanFormat.Default);
   assertThat(iban.toFormattedString(), is(equalTo("AT61 1904 3002 3457 3201")));
   }
   
   @Test
   @DisplayName("ibanConstruction with padding left zeros")
   public void ibanConstructionWithLeftZeroPadding() {
   final Iban iban = new Iban.Builder()
   .leftPadding(true)
   .countryCode(CountryCode.DE)
   .bankCode("66280099")
   .accountNumber("123456700")
   .build();
   assertThat(iban.toFormattedString(), is(equalTo("DE90 6628 0099 0123 4567 00")));
   }
   
   @Test
   public void ibanConstructionRandom() {
   for (int i = 0; i < 100; i++) {
   new Iban.Builder().buildRandom();
   assertNotNull(Iban.random());
   }
   }
   
   @Test
   public void ibanBuilderConstructionSeeded() {
   assertAll(
   () -> assertIbanBuilderRandomWithSeedEquals("FR46 1918 2083 691H JENI SJS3 364", 1),
   () -> assertIbanBuilderRandomWithSeedEquals("LC94 QKBB C1OY WHST MPQA 7GVB 4WBX VTP0", 2),
   () -> assertIbanBuilderRandomWithSeedEquals("DK23 0882 2804 1804 23", 3));
   }
   
   @Test
   public void ibanSeededExpectUtilAndBuilderGenerateTheSame() {
   for (int i = 0; i < 100; i++) {
   final Iban util = Iban.random(new Random(i));
   final Iban builder = new Iban.Builder(new Random(i)).buildRandom();
   assertEquals(
   util,
   builder,
   "expect that the same random IBAN is generated from both util and builder methods"
   );
   }
   }
   
   @Test
   public void ibanConstructionRandomAcctRetainsSpecifiedCountry() {
   Iban iban = new Iban.Builder().countryCode(CountryCode.AT).buildRandom();
   assertThat(iban.getCountryCode(), is(equalTo(CountryCode.AT)));
   
   iban = Iban.random(CountryCode.AT);
   assertThat(iban.getCountryCode(), is(equalTo(CountryCode.AT)));
   }
   
   @Test
   public void ibanConstructionRandomRetainsSpecifiedBankCode() {
   final Iban iban = new Iban.Builder()
   .leftPadding(true)
   .countryCode(CountryCode.DE)
   .bankCode("66280099")
   .accountNumber("123456700")
   .build();
   assertThat(iban.toFormattedString(), is(equalTo("DE90 6628 0099 0123 4567 00")));
   }
   
   @Test
   @DisplayName("ibanConstruction with padding non default character")
   public void ibanConstructionWithPaddingCharacter() {
   final Iban iban = new Iban.Builder()
   .leftPadding(true)
   .paddingCharacter('1')
   .countryCode(CountryCode.DE)
   .bankCode("66280099")
   .accountNumber("123456700")
   .build();
   assertThat(iban.toFormattedString(), is(equalTo("DE45 6628 0099 1123 4567 00")));
   }
   
   @Test
   public void ibanConstructionRandomDoesNotOverwriteBranchCode() {
   final Iban iban = new Iban.Builder()
   .countryCode(CountryCode.AL)
   .branchCode("1234")
   .buildRandom();
   assertThat(iban.getBranchCode(), is(equalTo("1234")));
   }
   
   @Test
   public void ibanConstructionRandomDoesNotOverwriteNationalCheckDigit() {
   final Iban iban = new Iban.Builder()
   .countryCode(CountryCode.AL)
   .nationalCheckDigit("1")
   .buildRandom();
   assertThat(iban.getNationalCheckDigit(), is(equalTo("1")));
   }
   
   @Test
   public void ibanConstructionRandomDoesNotOverwriteAccountType() {
   final Iban iban = new Iban.Builder()
   .countryCode(CountryCode.BR)
   .accountType("A")
   .buildRandom();
   assertThat(iban.getAccountType(), is(equalTo("A")));
   }
   
   @Test
   public void ibanConstructionRandomDoesNotOverwriteOwnerAccountType() {
   final Iban iban = new Iban.Builder()
   .countryCode(CountryCode.BR)
   .ownerAccountType("C")
   .buildRandom();
   assertThat(iban.getOwnerAccountType(), is(equalTo("C")));
   }
   
   @Test
   public void ibanConstructionRandomDoesNotOverwriteIdentificationNumber() {
   final Iban iban = new Iban.Builder()
   .countryCode(CountryCode.IS)
   .identificationNumber("1234567890")
   .buildRandom();
   assertThat(iban.getIdentificationNumber(), is(equalTo("1234567890")));
   }
   
   @Test
   public void ibanConstructionWithLackingNationalCheckDigitShouldThrowExceptionIfValidationRequested() {
   final IbanFormatException thrown = assertThrows(
   IbanFormatException.class,
   () -> new Iban.Builder()
   .countryCode(CountryCode.NO)
   .bankCode("4435")
   .accountNumber("0343730")
   .build(true),
   defaultExceptionMessage);
   assertThat(thrown.getMessage(), containsString("nationalCheckDigit is required; it cannot be null"));
   }
   }
   */
}
