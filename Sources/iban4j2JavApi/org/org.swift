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
