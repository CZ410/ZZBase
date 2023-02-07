//
//  Data+ZZ.swift
//  ZZBase
//
//  Created by Czz on 2023/1/6.
//

import Foundation
import CommonCrypto

public extension Data{
    
    var bytes: [UInt8] {
        return [UInt8](self)
    }
    
    var zz_md2: String{
        var digest = [UInt8](repeating: 0, count: Int(CC_MD2_DIGEST_LENGTH))
        CC_MD2(bytes, CC_LONG(bytes.count - 1), &digest)
        return digest.reduce("") { $0 + String(format:"%02X", $1) }
    }
    
    var zz_md2Data: Data{
        var digest = [UInt8](repeating: 0, count: Int(CC_MD2_DIGEST_LENGTH))
        CC_MD2(bytes, CC_LONG(bytes.count - 1), &digest)
        return Data(bytes: digest, count: Int(CC_MD2_DIGEST_LENGTH))
    }
    
    var zz_md4: String{
        var digest = [UInt8](repeating: 0, count: Int(CC_MD4_DIGEST_LENGTH))
        CC_MD4(bytes, CC_LONG(bytes.count - 1), &digest)
        return digest.reduce("") { $0 + String(format:"%02X", $1) }
    }
    
    var zz_md4Data: Data{
        var digest = [UInt8](repeating: 0, count: Int(CC_MD4_DIGEST_LENGTH))
        CC_MD4(bytes, CC_LONG(bytes.count - 1), &digest)
        return Data(bytes: digest, count: Int(CC_MD4_DIGEST_LENGTH))
    }
    
    var zz_md5: String{
        var digest = [UInt8](repeating: 0, count: Int(CC_MD5_DIGEST_LENGTH))
        CC_MD5(bytes, CC_LONG(bytes.count - 1), &digest)
        return digest.reduce("") { $0 + String(format:"%02X", $1) }
    }
    
    var zz_md5Data: Data{
        var digest = [UInt8](repeating: 0, count: Int(CC_MD5_DIGEST_LENGTH))
        CC_MD5(bytes, CC_LONG(bytes.count - 1), &digest)
        return Data(bytes: digest, count: Int(CC_MD5_DIGEST_LENGTH))
    }
    
    var zz_utf8Str: String{
        guard self.count > 0 else { return "" }
        return String(data: self, encoding: .utf8) ?? ""
    }
}
