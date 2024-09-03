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

extension org.iban4j{
  
  /**
   * Country Code Enum
   *
   * <a href="http://en.wikipedia.org/wiki/ISO_3166-1">ISO 3166-1</a> country code.
   */
  public enum CountryCode : Hashable, CustomStringConvertible, Sendable {

    case AD(name:String="Andorra", alpha3:String="AND")
    case AE(name:String="United Arab Emirates", alpha3:String="ARE")
    case AF(name:String="Afghanistan", alpha3:String="AFG")
    case AG(name:String="Antigua and Barbuda", alpha3:String="ATG")
    case AI(name:String="Anguilla", alpha3:String="AIA")
    case AL(name:String="Albania", alpha3:String="ALB")
    case AM(name:String="Armenia", alpha3:String="ARM")
    case AO(name:String="Angola", alpha3:String="AGO")
    case AQ(name:String="Antarctica", alpha3:String="ATA")
    case AR(name:String="Argentina", alpha3:String="ARG")
    case AS(name:String="American Samoa", alpha3:String="ASM")
    case AT(name:String="Austria", alpha3:String="AUT")
    case AU(name:String="Australia", alpha3:String="AUS")
    case AW(name:String="Aruba", alpha3:String="ABW")
    case AX(name:String="\u{212B}land Islands", alpha3:String="ALA")
    case AZ(name:String="Azerbaijan", alpha3:String="AZE")
    
    case BA(name:String="Bosnia and Herzegovina", alpha3:String="BIH")
    case BB(name:String="Barbados", alpha3:String="BRB")
    case BD(name:String="Bangladesh", alpha3:String="BGD")
    case BE(name:String="Belgium", alpha3:String="BEL")
    case BF(name:String="Burkina Faso", alpha3:String="BFA")
    case BG(name:String="Bulgaria", alpha3:String="BGR")
    case BH(name:String="Bahrain", alpha3:String="BHR")
    case BI(name:String="Burundi", alpha3:String="BDI")
    case BJ(name:String="Benin", alpha3:String="BEN")
    case BL(name:String="Saint Barth\u{00E9}lemy", alpha3:String="BLM")
    case BM(name:String="Bermuda", alpha3:String="BMU")
    case BN(name:String="Brunei Darussalam", alpha3:String="BRN")
    case BO(name:String="Plurinational State of Bolivia", alpha3:String="BOL")
    case BQ(name:String="Bonaire, Sint Eustatius and Saba", alpha3:String="BES")
    case BR(name:String="Brazil", alpha3:String="BRA")
    case BS(name:String="Bahamas", alpha3:String="BHS")
    case BT(name:String="Bhutan", alpha3:String="BTN")
    case BV(name:String="Bouvet Island", alpha3:String="BVT")
    case BW(name:String="Botswana", alpha3:String="BWA")
    case BY(name:String="Belarus", alpha3:String="BLR")
    case BZ(name:String="Belize", alpha3:String="BLZ")
    
    case CA(name:String="Canada", alpha3:String="CAN")
    case CC(name:String="Cocos Islands", alpha3:String="CCK")
    case CD(name:String="The Democratic Republic of the Congo", alpha3:String="COD")
    case CF(name:String="Central African Republic", alpha3:String="CAF")
    case CG(name:String="Congo", alpha3:String="COG")
    case CH(name:String="Switzerland", alpha3:String="CHE")
    case CI(name:String="C\u{00F4}te d'Ivoire", alpha3:String="CIV")
    case CK(name:String="Cook Islands", alpha3:String="COK")
    case CL(name:String="Chile", alpha3:String="CHL")
    case CM(name:String="Cameroon", alpha3:String="CMR")
    case CN(name:String="China", alpha3:String="CHN")
    case CO(name:String="Colombia", alpha3:String="COL")
    case CR(name:String="Costa Rica", alpha3:String="CRI")
    case CU(name:String="Cuba", alpha3:String="CUB")
    case CV(name:String="Cape Verde", alpha3:String="CPV")
    case CW(name:String="Cura\u{00E7a}o", alpha3:String="CUW")
    case CX(name:String="Christmas Island", alpha3:String="CXR")
    case CY(name:String="Cyprus", alpha3:String="CYP")
    case CZ(name:String="Czech Republic", alpha3:String="CZE")
    
    case DE(name:String="Germany", alpha3:String="DEU")
    case DJ(name:String="Djibouti", alpha3:String="DJI")
    case DK(name:String="Denmark", alpha3:String="DNK")
    case DM(name:String="Dominica", alpha3:String="DMA")
    case DO(name:String="Dominican Republic", alpha3:String="DOM")
    case DZ(name:String="Algeria", alpha3:String="DZA")
    
    case EC(name:String="Ecuador", alpha3:String="ECU")
    case EE(name:String="Estonia", alpha3:String="EST")
    case EG(name:String="Egypt", alpha3:String="EGY")
    case EH(name:String="Western Sahara", alpha3:String="ESH")
    case ER(name:String="Eritrea", alpha3:String="ERI")
    case ES(name:String="Spain", alpha3:String="ESP")
    case ET(name:String="Ethiopia", alpha3:String="ETH")
    
    case FI(name:String="Finland", alpha3:String="FIN")
    case FJ(name:String="Fiji", alpha3:String="FJI")
    case FK(name:String="Falkland Islands", alpha3:String="FLK")
    case FM(name:String="Federated States of Micronesia", alpha3:String="FSM")
    case FO(name:String="Faroe Islands", alpha3:String="FRO")
    case FR(name:String="France", alpha3:String="FRA")
    
    case GA(name:String="Gabon", alpha3:String="GAB")
    case GB(name:String="United Kingdom", alpha3:String="GBR")
    case GD(name:String="Grenada", alpha3:String="GRD")
    case GE(name:String="Georgia", alpha3:String="GEO")
    case GF(name:String="French Guiana", alpha3:String="GUF")
    case GG(name:String="Guernsey", alpha3:String="GGY")
    case GH(name:String="Ghana", alpha3:String="GHA")
    case GI(name:String="Gibraltar", alpha3:String="GIB")
    case GL(name:String="Greenland", alpha3:String="GRL")
    case GM(name:String="Gambia", alpha3:String="GMB")
    case GN(name:String="Guinea", alpha3:String="GIN")
    case GP(name:String="Guadeloupe", alpha3:String="GLP")
    case GQ(name:String="Equatorial Guinea", alpha3:String="GNQ")
    case GR(name:String="Greece", alpha3:String="GRC")
    case GS(name:String="South Georgia and the South Sandwich Islands", alpha3:String="SGS")
    case GT(name:String="Guatemala", alpha3:String="GTM")
    case GU(name:String="Guam", alpha3:String="GUM")
    case GW(name:String="Guinea-Bissau", alpha3:String="GNB")
    case GY(name:String="Guyana", alpha3:String="GUY")

    case HK(name:String="Hong Kong", alpha3:String="HKG")
    case HM(name:String="Heard Island and McDonald Islands", alpha3:String="HMD")
    case HN(name:String="Honduras", alpha3:String="HND")
    case HR(name:String="Croatia", alpha3:String="HRV")
    case HT(name:String="Haiti", alpha3:String="HTI")
    case HU(name:String="Hungary", alpha3:String="HUN")
        
    case ID(name:String="Indonesia", alpha3:String="IDN")
    case IE(name:String="Ireland", alpha3:String="IRL")
    case IL(name:String="Israel", alpha3:String="ISR")
    case IM(name:String="Isle of Man", alpha3:String="IMN")
    case IN(name:String="India", alpha3:String="IND")
    case IO(name:String="British Indian Ocean Territory", alpha3:String="IOT")
    case IQ(name:String="Iraq", alpha3:String="IRQ")
    case IR(name:String="Islamic Republic of Iran", alpha3:String="IRN")
    case IS(name:String="Iceland", alpha3:String="ISL")
    case IT(name:String="Italy", alpha3:String="ITA")

    case JE(name:String="Jersey", alpha3:String="JEY")
    case JM(name:String="Jamaica", alpha3:String="JAM")
    case JO(name:String="Jordan", alpha3:String="JOR")
    case JP(name:String="Japan", alpha3:String="JPN")
    
    case KE(name:String="Kenya", alpha3:String="KEN")
    case KG(name:String="Kyrgyzstan", alpha3:String="KGZ")
    case KH(name:String="Cambodia", alpha3:String="KHM")
    case KI(name:String="Kiribati", alpha3:String="KIR")
    case KM(name:String="Comoros", alpha3:String="COM")
    case KN(name:String="Saint Kitts and Nevis", alpha3:String="KNA")
    case KP(name:String="Democratic People's Republic of Korea", alpha3:String="PRK")
    case KR(name:String="Republic of Korea", alpha3:String="KOR")
    case KW(name:String="Kuwait", alpha3:String="KWT")
    case KY(name:String="Cayman Islands", alpha3:String="CYM")
    case KZ(name:String="Kazakhstan", alpha3:String="KAZ")
        
    case LA(name:String="Lao People's Democratic Republic", alpha3:String="LAO")
    case LB(name:String="Lebanon", alpha3:String="LBN")
    case LC(name:String="Saint Lucia", alpha3:String="LCA")
    case LI(name:String="Liechtenstein", alpha3:String="LIE")
    case LK(name:String="Sri Lanka", alpha3:String="LKA")
    case LR(name:String="Liberia", alpha3:String="LBR")
    case LS(name:String="Lesotho", alpha3:String="LSO")
    case LT(name:String="Lithuania", alpha3:String="LTU")
    case LU(name:String="Luxembourg", alpha3:String="LUX")
    case LV(name:String="Latvia", alpha3:String="LVA")
    case LY(name:String="Libya", alpha3:String="LBY")
    
    case MA(name:String="Morocco", alpha3:String="MAR")
    case MC(name:String="Monaco", alpha3:String="MCO")
    case MD(name:String="Republic of Moldova", alpha3:String="MDA")
    case ME(name:String="Montenegro", alpha3:String="MNE")
    case MF(name:String="Saint Martin", alpha3:String="MAF")
    case MG(name:String="Madagascar", alpha3:String="MDG")
    case MH(name:String="Marshall Islands", alpha3:String="MHL")
    case MK(name:String="The former Yugoslav Republic of Macedonia", alpha3:String="MKD")
    case ML(name:String="Mali", alpha3:String="MLI")
    case MM(name:String="Myanmar", alpha3:String="MMR")
    case MN(name:String="Mongolia", alpha3:String="MNG")
    case MO(name:String="Macao", alpha3:String="MAC")
    case MP(name:String="Northern Mariana Islands", alpha3:String="MNP")
    case MQ(name:String="Martinique", alpha3:String="MTQ")
    case MR(name:String="Mauritania", alpha3:String="MRT")
    case MS(name:String="Montserrat", alpha3:String="MSR")
    case MT(name:String="Malta", alpha3:String="MLT")
    case MU(name:String="Mauritius", alpha3:String="MUS")
    case MV(name:String="Maldives", alpha3:String="MDV")
    case MW(name:String="Malawi", alpha3:String="MWI")
    case MX(name:String="Mexico", alpha3:String="MEX")
    case MY(name:String="Malaysia", alpha3:String="MYS")
    case MZ(name:String="Mozambique", alpha3:String="MOZ")
    
    case NA(name:String="Namibia", alpha3:String="NAM")
    case NC(name:String="New Caledonia", alpha3:String="NCL")
    case NE(name:String="Niger", alpha3:String="NER")
    case NF(name:String="Norfolk Island", alpha3:String="NFK")
    case NG(name:String="Nigeria", alpha3:String="NGA")
    case NI(name:String="Nicaragua", alpha3:String="NIC")
    case NL(name:String="Netherlands", alpha3:String="NLD")
    case NO(name:String="Norway", alpha3:String="NOR")
    case NP(name:String="Nepal", alpha3:String="NPL")
    case NR(name:String="Nauru", alpha3:String="NRU")
    case NU(name:String="Niue", alpha3:String="NIU")
    case NZ(name:String="New Zealand", alpha3:String="NZL")

    case OM(name:String="Oman", alpha3:String="OMN")

    case PA(name:String="Panama", alpha3:String="PAN")
    case PE(name:String="Peru", alpha3:String="PER")
    case PF(name:String="French Polynesia", alpha3:String="PYF")
    case PG(name:String="Papua New Guinea", alpha3:String="PNG")
    case PH(name:String="Philippines", alpha3:String="PHL")
    case PK(name:String="Pakistan", alpha3:String="PAK")
    case PL(name:String="Poland", alpha3:String="POL")
    case PM(name:String="Saint Pierre and Miquelon", alpha3:String="SPM")
    case PN(name:String="Pitcairn", alpha3:String="PCN")
    case PR(name:String="Puerto Rico", alpha3:String="PRI")
    case PS(name:String="Occupied Palestinian Territory", alpha3:String="PSE")
    case PT(name:String="Portugal", alpha3:String="PRT")
    case PW(name:String="Palau", alpha3:String="PLW")
    case PY(name:String="Paraguay", alpha3:String="PRY")
    
    case QA(name:String="Qatar", alpha3:String="QAT")
    
    case RE(name:String="R\u{00E9}union", alpha3:String="REU")
    case RO(name:String="Romania", alpha3:String="ROU")
    case RS(name:String="Serbia", alpha3:String="SRB")
    case RU(name:String="Russian Federation", alpha3:String="RUS")
    case RW(name:String="Rwanda", alpha3:String="RWA")
        
    case SA(name:String="Saudi Arabia", alpha3:String="SAU")
    case SB(name:String="Solomon Islands", alpha3:String="SLB")
    case SC(name:String="Seychelles", alpha3:String="SYC")
    case SD(name:String="Sudan", alpha3:String="SDN")
    case SE(name:String="Sweden", alpha3:String="SWE")
    case SG(name:String="Singapore", alpha3:String="SGP")
    case SH(name:String="Saint Helena, Ascension and Tristan da Cunha", alpha3:String="SHN")
    case SI(name:String="Slovenia", alpha3:String="SVN")
    case SJ(name:String="Svalbard and Jan Mayen", alpha3:String="SJM")
    case SK(name:String="Slovakia", alpha3:String="SVK")
    case SL(name:String="Sierra Leone", alpha3:String="SLE")
    case SM(name:String="San Marino", alpha3:String="SMR")
    case SN(name:String="Senegal", alpha3:String="SEN")
    case SO(name:String="Somalia", alpha3:String="SOM")
    case SR(name:String="Suriname", alpha3:String="SUR")
    case SS(name:String="South Sudan", alpha3:String="SSD")
    case ST(name:String="Sao Tome and Principe", alpha3:String="STP")
    case SV(name:String="El Salvador", alpha3:String="SLV")
    case SX(name:String="Sint Maarten", alpha3:String="SXM")
    case SY(name:String="Syrian Arab Republic", alpha3:String="SYR")
    case SZ(name:String="Swaziland", alpha3:String="SWZ")
    
    case TC(name:String="Turks and Caicos Islands", alpha3:String="TCA")
    case TD(name:String="Chad", alpha3:String="TCD")
    case TF(name:String="French Southern Territories", alpha3:String="ATF")
    case TG(name:String="Togo", alpha3:String="TGO")
    case TH(name:String="Thailand", alpha3:String="THA")
    case TJ(name:String="Tajikistan", alpha3:String="TJK")
    case TK(name:String="Tokelau", alpha3:String="TKL")
    case TL(name:String="Timor-Leste", alpha3:String="TLS")
    case TM(name:String="Turkmenistan", alpha3:String="TKM")
    case TN(name:String="Tunisia", alpha3:String="TUN")
    case TO(name:String="Tonga", alpha3:String="TON")
    case TR(name:String="Turkey", alpha3:String="TUR")
    case TT(name:String="Trinidad and Tobago", alpha3:String="TTO")
    case TV(name:String="Tuvalu", alpha3:String="TUV")
    case TW(name:String="Taiwan, Province of China", alpha3:String="TWN")
    case TZ(name:String="United Republic of Tanzania", alpha3:String="TZA")

    case UA(name:String="Ukraine", alpha3:String="UKR")
    case UG(name:String="Uganda", alpha3:String="UGA")
    case UM(name:String="United States Minor Outlying Islands", alpha3:String="UMI")
    case US(name:String="United States", alpha3:String="USA")
    case UY(name:String="Uruguay", alpha3:String="URY")
    case UZ(name:String="Uzbekistan", alpha3:String="UZB")
    
    case VA(name:String="Holy See", alpha3:String="VAT")
    case VC(name:String="Saint Vincent and the Grenadines", alpha3:String="VCT")
    case VE(name:String="Bolivarian Republic of Venezuela", alpha3:String="VEN")
    case VG(name:String="British Virgin Islands", alpha3:String="VGB")
    case VI(name:String="Virgin Islands, U.S.", alpha3:String="VIR")
    case VN(name:String="Viet Nam", alpha3:String="VNM")
    case VU(name:String="Vanuatu", alpha3:String="VUT")
    
    case WF(name:String="Wallis and Futuna", alpha3:String="WLF")
    case WS(name:String="Samoa", alpha3:String="WSM")
    
    case XK(name:String="Kosovo", alpha3:String="UNK")
    
    case YE(name:String="Yemen", alpha3:String="YEM")
    case YT(name:String="Mayotte", alpha3:String="MYT")
    
    case ZA(name:String="South Africa", alpha3:String="ZAF")
    case ZM(name:String="Zambia", alpha3:String="ZMB")
    case ZW(name:String="Zimbabwe", alpha3:String="ZWE")
    

    /**
     * Get the country name.
     *
     * @return The country name.
     */
    public func getName () -> String {
      let m = Mirror(reflecting: self).children
      for case let (_, value) in m {
        let tupel : (name:String,alpha3:String) = value as! (String, String)
        return tupel.name
      }
      return "" // NullPattern
    }
    
    /**
     * Get the <a href="http://en.wikipedia.org/wiki/ISO_3166-1_alpha-2">ISO 3166-1 alpha-2</a> code.
     *
     * @return The <a href="http://en.wikipedia.org/wiki/ISO_3166-1_alpha-2">ISO 3166-1 alpha-2</a> code.
     */
    public func getAlpha2() -> String {
      let m = Mirror(reflecting: self).children
      for case let (key?, _) in m {
        return key
      }
      return "" // NullPattern
    }
    
    /**
     * Get the <a href="http://en.wikipedia.org/wiki/ISO_3166-1_alpha-3">ISO 3166-1 alpha-3</a> code.
     *
     * @return The <a href="http://en.wikipedia.org/wiki/ISO_3166-1_alpha-3">ISO 3166-1 alpha-3</a> code.
     */
    public func getAlpha3() -> String{
      let m = Mirror(reflecting: self).children
      for case let (_, value) in m {
        let tupel : (name:String,alpha3:String) = value as! (String, String)
        return tupel.alpha3
      }
      return "" // NullPattern
    }
    
    /**
     * Get a CountryCode that corresponds to the given ISO 3166-1
     * <a href="http://en.wikipedia.org/wiki/ISO_3166-1_alpha-2">alpha-2</a> or
     * <a href="http://en.wikipedia.org/wiki/ISO_3166-1_alpha-3">alpha-3</a> code.
     *
     * @param code An ISO 3166-1 <a href="http://en.wikipedia.org/wiki/ISO_3166-1_alpha-2">alpha-2</a> or
     *             <a href="http://en.wikipedia.org/wiki/ISO_3166-1_alpha-3">alpha-3</a> code.
     * @return A CountryCode instance, or null if not found.
     */
    public static func getByCode(_ code : String) -> CountryCode? {
      switch (code.count) {
      case 2:
        return getByAlpha2Code(code.uppercased());
        
      case 3:
        return getByAlpha3Code(code.uppercased());
        
      default:
        return nil;
      }
    }
    
    /**
     * Get a CountryCode that corresponds to the given ISO 3166-1
     * <a href="http://en.wikipedia.org/wiki/ISO_3166-1_alpha-2">alpha-2</a> or
     * <a href="http://en.wikipedia.org/wiki/ISO_3166-1_alpha-3">alpha-3</a> code.
     *
     * @param code An ISO 3166-1 <a href="http://en.wikipedia.org/wiki/ISO_3166-1_alpha-2">alpha-2</a> or
     *             <a href="http://en.wikipedia.org/wiki/ISO_3166-1_alpha-3">alpha-3</a> code.
     * @return A CountryCode instance, or null if not found.
     */
    public static func getByCode (_ code : String?) -> CountryCode? {
      if let code {
        return getByCode(code)
      }
      return nil
    }
    
    /**
     * Get a CountryCode that corresponds to the given ISO 3166-1
     * <a href="http://en.wikipedia.org/wiki/ISO_3166-1_alpha-2">alpha-2</a> code.
     *
     * @param code An ISO 3166-1 <a href="http://en.wikipedia.org/wiki/ISO_3166-1_alpha-2">alpha-2</a> code.
     * @return A CountryCode instance, or null if not found.
     */
    private static func getByAlpha2Code(_ code : String) -> CountryCode? {
      for cc in self.allCases {
        if code == cc.getAlpha2() {
          return cc
        }
      }
      return nil;
    }
    
    /**
     * Get a CountryCode that corresponds to the given ISO 3166-1
     * <a href="http://en.wikipedia.org/wiki/ISO_3166-1_alpha-3">alpha-3</a> code.
     *
     * @param code An ISO 3166-1 <a href="http://en.wikipedia.org/wiki/ISO_3166-1_alpha-3">alpha-3</a> code.
     * @return A CountryCode instance, or null if not found.
     */
    private static func getByAlpha3Code(_ code : String) -> CountryCode? {
      for cc in self.allCases {
        let alpha3 = cc.getAlpha3()
        if code == alpha3 {
          return cc
        }
      }
      return nil
    }
    
    public func toString () -> String {
      return self.getName()
    }
    public var description: String {
      get {
        return self.toString()
      }
    }
  }
}
