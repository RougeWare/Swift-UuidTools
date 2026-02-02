//
//  UUID + constants.swift
//
//
//  Created by Ky on 2024-05-28.
//

import Foundation



public extension UUID {
    /// Some example UUID. This is never guaranteed to be the same
    static let example = Self()
    
    /// The "nil" UUID (`00000000-0000-0000-0000-000000000000`), often used to represent "no value" or as a placeholder.
    static let null = Self(uuid: uuid_t(0,0,0,0, 0,0, 0,0, 0,0, 0,0,0,0,0,0))
}
