//
//  JWTCreator.swift
//  testApp
//
//  Created by Kolya Stypanovych on 14.08.2020.
//

import SwiftJWT


struct MyClaims: Claims {
    let uid: String
    let identity: String
}

class JWTCreator {
    static func getJWTToken() -> String? {
        let claim = MyClaims(uid: "12345", identity: "12345")
        let data = "$SECRET$".data(using: .utf8)?.base64EncodedData()
        let jwtStringer = JWTSigner.hs256(key: data!)
        var jwt = JWT(claims: claim)
        let token = try? jwt.sign(using: jwtStringer)
        return token
    }
}
