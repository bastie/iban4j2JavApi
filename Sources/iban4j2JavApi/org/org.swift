/*
 * SPDX-FileCopyrightText: 2024 - Sebastian Ritter <bastie@users.noreply.github.com>
 * SPDX-License-Identifier: Apache-2.0
 */
public enum org {
  
  
  // TODO: java.util.Random implementation needed
  public struct Random {
    
    public init () {}
    public init (_ ignored : Int) {}
    public func nextInt(_ maxPlus1 : Int) -> Int {
      return Int.random(in: Int.min...maxPlus1)
    }
    public func nextInt () -> Int {
      return Int.random(in: Int.min...Int.max)
    }
  }

}


