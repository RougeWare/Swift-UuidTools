//
//  Test null UUID.swift
//  kyuuid
//
//  Created by Ky on 2026-01-30.
//

import Foundation
import Testing

import UuidTools



struct Test_nullUuid {
    
    @Test("UUID.null should be the all‑zero value")
    func isAllZero() async throws {
        let expected = UUID(uuid: uuid_t(0,0,0,0, 0,0, 0,0, 0,0, 0,0,0,0,0,0))
        #expect(UUID.null == expected)
    }
    
    
    @Test("UUID.null canonical string representation")
    func stringRepresentation_canonical() async throws {
        #expect(UUID.null.uuidString == "00000000-0000-0000-0000-000000000000")
        #expect(UUID.null.format(as: .standard) == "00000000-0000-0000-0000-000000000000")
    }
    
    
    @Test("UUID.null base-64 string representations")
    func stringRepresentation() async throws {
        #expect(UUID.null.format(as: .base64) == "AAAAAAAAAAAAAAAAAAAAAA==")
        #expect(UUID.null.format(as: .truncatedBase64) == "AAAAAAAAAAAAAAAAAAAAAA")
    }
}
