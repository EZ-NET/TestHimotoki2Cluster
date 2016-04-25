//
//  Test.swift
//  TestHimotoki2
//
//  Created by Tomohiro Kumagai on 4/25/16.
//  Copyright © 2016 EasyStyle G.K. All rights reserved.
//

import Himotoki

protocol ClusterInterface {
    
    var type : Int { get }
    var title: String { get }
}

class Cluster : ClusterInterface {
    
    private var source: ClusterInterface
    
    required init<T:ClusterInterface>(source: T) {
        
        self.source = source
    }
    
    var type: Int {
        
        return source.type
    }
    
    var title: String {
        
        return source.title
    }
}

extension Cluster : Decodable {
    
    static func decode(e: Extractor) throws -> Self {
        
        let type = try! e.value("type") as Int

        switch type {
            
        case 0:
            return self.init(source: B(e: e))
        case 1:
            return self.init(source: C(e: e))
        case 2:
            return self.init(source: A(e: e))
            
        default:
            fatalError()
        }
    }
    
}

extension Cluster : CustomDebugStringConvertible {
    
    var debugDescription: String {
        
        return String(self.source)
    }
}

class A: ClusterInterface {
    
    var type : Int = 0
    var title: String = ""
    
    init (e: Extractor) {
        type = try! e <| "type"
        title = try! e <| "title"
    }
}

class B: ClusterInterface {
    
    var type : Int = 0
    var title: String = ""
    var total : Double = 0.0
    
    required init(e: Extractor) {
        type = try! e <| "type"
        title = try! e <| "title"
        total = try! e <| "total"
    }
}

class C: ClusterInterface {
    
    var type : Int = 0
    var title: String = ""
    var link : String = ""

    required init(e: Extractor) {
        type = try! e <| "type"
        title = try! e <| "title"
        link = try! e <| "link"
    }
}
