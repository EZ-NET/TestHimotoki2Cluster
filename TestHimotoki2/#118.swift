//
//  188.swift
//  TestHimotoki2Cluster
//
//  Created by Tomohiro Kumagai on 4/26/16.
//  Copyright © 2016 EasyStyle G.K. All rights reserved.
//

import Himotoki

class A: CustomDecodableType {
    var type : Int = 0
    var title: String = ""
    
    init (e: Extractor) {
        type = try! e <| "type"
        title = try! e <| "title"
    }
    
    static func decode(e: Extractor) throws -> A {
        let type : Int = try e <| "type"
        switch type {
        case 0:
            return B(e: e)
        case 1:
            return C(e: e)
        case 2:
            return A(e: e)
        default:
            fatalError()
        }
    }
}

class B: A {
    var total : Double = 0.0
    override init(e: Extractor) {
        total = try! e <| "total"
        super.init(e: e)
    }
}

class C: A {
    var link : String = ""
    override init(e: Extractor) {
        link = try! e <| "link"
        super.init(e: e)
    }
}