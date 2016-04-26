//
//  AnyDecodable.swift
//  TestHimotoki2Cluster
//
//  Created by Tomohiro Kumagai on 4/26/16.
//  Copyright © 2016 EasyStyle G.K. All rights reserved.
//

import Himotoki

protocol CustomDecodableType {
    
    associatedtype DecodeType
    
    static func decode(e: Extractor) throws -> DecodeType
}

struct CustomDecodable<T:CustomDecodableType where T.DecodeType == T> : Decodable {
    
    private var _value: Any
    
    private init(_ value: T) {
        
        _value = value
    }
    
    var value: T {
    
        return _value as! T
    }
    
    static func decode(e: Extractor) throws -> CustomDecodable {
        
        return try CustomDecodable(T.decode(e))
    }
}

extension CustomDecodable : CustomStringConvertible {
    
    var description: String {
        
        return String(_value)
    }
}

extension CustomDecodable : CustomDebugStringConvertible {
    
    var debugDescription: String {
        
        return String(reflecting: _value)
    }
}

extension CustomDecodable : CustomPlaygroundQuickLookable {
    
    func customPlaygroundQuickLook() -> PlaygroundQuickLook {
        
        return PlaygroundQuickLook(reflecting: _value)
    }
}
