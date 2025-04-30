//
//  Overture.swift
//  PopularMoviesBrowser
//
//  Created by Stanislav Vorozhtsov on 30/4/25.
//

import Foundation
precedencegroup ForwardCompositionPrecedence {
  associativity: left
}

infix operator >>>: ForwardCompositionPrecedence

@inline(__always)
public func >>> <A, B, C>(f: @escaping (A) -> B, g: @escaping (B) -> C) -> (A) -> C {
  return { a in
    return g(f(a))
  }
}

@inline(__always)
public func >>> <A, B, C>(f: @escaping (A) throws -> B, g: @escaping (B) throws -> C) -> (A) throws -> C {
  return { a in
    return try g(try f(a))
  }
}

public func >>> <A, B, C, D>(f: @escaping (A, D) throws -> B, g: @escaping (B) throws -> C) -> (A, D) throws -> C {
  return { a, d in
    return try g(try f(a, d))
  }
}
