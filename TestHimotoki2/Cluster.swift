//
//  Test.swift
//  TestHimotoki2
//
//  Created by Tomohiro Kumagai on 4/25/16.
//  Copyright © 2016 EasyStyle G.K. All rights reserved.
//

import Himotoki

protocol NantokaClusterInterface {
    
    var type : Int { get }
    var title: String { get }
}

class NantokaCluster : NantokaClusterInterface {
    
    private var source: NantokaClusterInterface
    
    required init<T:NantokaClusterInterface>(source: T) {
        
        self.source = source
    }
    
    var type: Int {
        
        return source.type
    }
    
    var title: String {
        
        return source.title
    }
}

extension NantokaCluster : Decodable {
    
    static func decode(e: Extractor) throws -> Self {
        
        let type = try! e.value("type") as Int

        switch type {
            
        case 0:
            return self.init(source: ClusterB(e: e))
        case 1:
            return self.init(source: ClusterC(e: e))
        case 2:
            return self.init(source: ClusterA(e: e))
            
        default:
            fatalError()
        }
    }
    
}

extension NantokaCluster : CustomDebugStringConvertible {
    
    var debugDescription: String {
        
        return String(self.source)
    }
}

class ClusterA: NantokaClusterInterface {
    
    var type : Int = 0
    var title: String = ""
    
    init (e: Extractor) {
        type = try! e <| "type"
        title = try! e <| "title"
    }
}

class ClusterB: NantokaClusterInterface {
    
    var type : Int = 0
    var title: String = ""
    var total : Double = 0.0
    
    required init(e: Extractor) {
        type = try! e <| "type"
        title = try! e <| "title"
        total = try! e <| "total"
    }
}

class ClusterC: NantokaClusterInterface {
    
    var type : Int = 0
    var title: String = ""
    var link : String = ""

    required init(e: Extractor) {
        type = try! e <| "type"
        title = try! e <| "title"
        link = try! e <| "link"
    }
}
