/*
 * SPDX-FileCopyrightText: 2024 - Sebastian Ritter <bastie@users.noreply.github.com>
 * SPDX-License-Identifier: MIT
 */
public enum org {
  
  
  // TODO: java.util.Random implementation needed
  public struct Random {
    
    public init () {}
    public init (_ ignored : Int) {}
    public func nextInt(_ maxPlus1 : Int) -> Int {
      return Int.random(in: 0..<maxPlus1)
    }
    public func nextInt () -> Int {
      return nextInt(32)
    }
  }

}

extension Character {
  
  
  public static func getNumericValue (_ char : Character) -> Int {
    //  ('' through '\uFF3A' and '\uFF41' through '\uFF5A')
    switch char {
    case "0" : return 0
    case "1" : return 1
    case "2" : return 2
    case "3" : return 3
    case "4" : return 4
    case "5" : return 5
    case "6" : return 6
    case "7" : return 7
    case "8" : return 8
    case "9" : return 9
    case "A", "a", "\u{FF21}", "\u{FF41}" : return 10
    case "B", "b", "\u{FF22}", "\u{FF42}" : return 11
    case "C", "c", "\u{FF23}", "\u{FF43}" : return 12
    case "D", "d", "\u{FF24}", "\u{FF44}" : return 13
    case "E", "e", "\u{FF25}", "\u{FF45}" : return 14
    case "F", "f", "\u{FF26}", "\u{FF46}" : return 15
    case "G", "g", "\u{FF27}", "\u{FF47}" : return 16
    case "H", "h", "\u{FF28}", "\u{FF48}" : return 17
    case "I", "i", "\u{FF29}", "\u{FF49}" : return 18
    case "J", "j", "\u{FF2A}", "\u{FF4A}" : return 19
    case "K", "k", "\u{FF2B}", "\u{FF4B}" : return 20
    case "L", "l", "\u{FF2C}", "\u{FF4C}" : return 21
    case "M", "m", "\u{FF2D}", "\u{FF4D}" : return 22
    case "N", "n", "\u{FF2E}", "\u{FF4E}" : return 23
    case "O", "o", "\u{FF2F}", "\u{FF4F}" : return 24
    case "P", "p", "\u{FF30}", "\u{FF50}" : return 25
    case "Q", "q", "\u{FF31}", "\u{FF51}" : return 26
    case "R", "r", "\u{FF32}", "\u{FF52}" : return 27
    case "S", "s", "\u{FF33}", "\u{FF53}" : return 28
    case "T", "t", "\u{FF34}", "\u{FF54}" : return 29
    case "U", "u", "\u{FF35}", "\u{FF55}" : return 30
    case "V", "v", "\u{FF36}", "\u{FF56}" : return 31
    case "W", "w", "\u{FF37}", "\u{FF57}" : return 32
    case "X", "x", "\u{FF38}", "\u{FF58}" : return 33
    case "Y", "y", "\u{FF39}", "\u{FF59}" : return 34
    case "Z", "z", "\u{FF3A}", "\u{FF5A}" : return 35
    default:
      if let number = char.wholeNumberValue {
        return number
      }
      return -1
    }
  }
}
