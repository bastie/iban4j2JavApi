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
extension org.iban4j.bban {

  /**
   * Basic Bank Account Number Entry Types.
   */
  public enum BbanEntryType : Sendable {
         case bank_code
         case branch_code
         case account_number
         case national_check_digit
         case account_type
         case owner_account_number
         case identification_number
  }
}
