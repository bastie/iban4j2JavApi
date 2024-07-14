iban4j2JavApi 
=============

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://raw.githubusercontent.com/bastie/iban4j2JavApi/master/LICENSE.txt)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fbastie%2Fiban4j2JavApi%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/bastie/iban4j2JavApi)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fbastie%2Fiban4j2JavApi%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/bastie/iban4j2JavApi)

A Swift library for generation and validation of the International Bank Account
Numbers (<a href="http://en.wikipedia.org/wiki/ISO_13616" target="_blank">IBAN ISO_13616</a>) and Business Identifier
Codes (<a href="http://en.wikipedia.org/wiki/ISO_9362" target="_blank">BIC ISO_9362</a>) based on great projekt iban4j.


#### Iban quick examples:

```swift
  // How to generate Iban
  do {
    let iban = try org.iban4j.Builder()
      .countryCode(org.iban4j.CountryCode.AT())
      .bankCode("19043")
      .accountNumber("00234573201")
      .build();
  }
  
  // How to create Iban object from String
  let iban = IBAN(from: "DE89370400440532013000")
  
  // How to create Iban object from formatted String
  let iban = IBAN(from: "DE89 3704 0044 0532 0130 00");
  
  // How to generate random Iban
  do {
    try Iban.random(org.iban4j.CountryCode.AT())
    try Iban.random()
    try org.iban4j.Builder()
      .countryCode(org.iban4j.CountryCode.AT())
      .bankCode("19043")
      .buildRandom()
  }
  
  // How to validate Iban
    if let _ = IBAN(from: "DE89370400440532013000", withValidation: true),
       let _ = IBAN(from: "DE89 3704 0044 0532 0130 00", withValidation: true){
      // valid
    }
    else {
      // invalid
    }
```

#### Bic quick examples:

```swift
  // How to create Bic object from String
  let bic = try Bic.valueOf("DEUTDEFF");


  // How to validate Bic
  do {
    try BicUtil.validate("DEUTDEFF500");
    // valid
  } catch {
    // invalid
  }
```

#### Enable left padding examples:

```swift
  // How to left pad('account number', 'bank code' and 'branch code') with zero
  let iban1 = try org.iban4j.Builder()
    .leftPadding(true)
    .countryCode(CountryCode.DE())
    .bankCode("66280099")
    .accountNumber("123456700")
    .build();

  // How to change default padding character ('0') with other
  let iban2 = try org.iban4j.Builder()
    .leftPadding(true)
    .paddingCharacter("1")
    .countryCode(CountryCode.DE())
    .bankCode("66280099")
    .accountNumber("123456700")
    .build();
  
```



#### References

- http://en.wikipedia.org/wiki/ISO_13616
- http://en.wikipedia.org/wiki/ISO_9362
- https://www.ecb.europa.eu/paym/retpaym/paymint/sepa/shared/pdf/iban_registry.pdf

## Thanks to

* Artur Mkrtchyan [iban4j](https://github.com/arturmkrtchyan/iban4j)


## License

Java iban4j is copyright 2015 Artur Mkrtchyan.
Ported to Swift by Sebastian Ritter.

Licensed under the Apache License, Version 2.0: http://www.apache.org/licenses/LICENSE-2.0

