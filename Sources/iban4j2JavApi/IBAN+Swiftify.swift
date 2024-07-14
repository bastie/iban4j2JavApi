/*
 * SPDX-FileCopyrightText: 2024 - Sebastian Ritter <bastie@users.noreply.github.com>
 * SPDX-License-Identifier: MIT
 */

/// Representation of IBAN
public struct IBAN {
  
  /// The wrapped value of org.iban4j.Iban?
  public let value : org.iban4j.Iban?
  
  /// Construct new IBAN ``from`` given String with or without prevalidation. Per default validation is true and returns ``nil`` if validate fails.
  ///
  /// - Parameters:
  ///    - from: formated or unformated IBAN
  /// - Parameters:
  ///    - withValidation: validate IBAN before creation of instance (default value is ``true``)
  ///
  /// - Returns: instance or ``nil`` if validation is activated and fails
  public init? (from: String, withValidation: Bool = true) {
    do {
      if from.contains(" ") {
        if withValidation {
          try org.iban4j.IbanUtil.validate(from, .Default)
        }
        value = try org.iban4j.Iban.valueOf(from, .Default)
      }
      else {
        if withValidation {
          try org.iban4j.IbanUtil.validate(from)
        }
        value = try org.iban4j.Iban.valueOf(from)
      }
    }
    catch {
      return nil
    }
  }
  
  /// The Bank Identifier Code (BIC) from IBAN
  /// - Returns: BIC as Optional
  public func bankcode () -> String? {
    return value?.getBankCode()
  }
  
  /// The account number from IBAN
  /// - Returns: account number as Optional
  public func accountnumber () -> String? {
    return value?.getAccountNumber()
  }
}
