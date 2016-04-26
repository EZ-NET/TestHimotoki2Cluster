//
//  main.swift
//  TestHimotoki2
//
//  Created by Tomohiro Kumagai on 4/25/16.
//  Copyright © 2016 EasyStyle G.K. All rights reserved.
//

import Himotoki

let json0: [String : AnyJSON] = [ "type" : 0, "title" : "TITLE 0", "total" : 0.5, "link" : "LINK" ]
let json1: [String : AnyJSON] = [ "type" : 1, "title" : "TITLE 1", "total" : 1.8, "link" : "LINK" ]
let json2: [String : AnyJSON] = [ "type" : 2, "title" : "TITLE 2", "total" : 2.3, "link" : "LINK" ]

print()
print("TEST : NantokaCluster")
print()

do {
    
    let instance0 = try! decodeValue(json0) as NantokaCluster
    let instance1 = try! decodeValue(json1) as NantokaCluster
    let instance2 = try! decodeValue(json2) as NantokaCluster
    
    debugPrint(instance0.dynamicType, instance0, instance0.title)   // TestHimotoki2.NantokaCluster TestHimotoki2.ClusterB "TITLE 0"
    debugPrint(instance1.dynamicType, instance1, instance1.title)   // TestHimotoki2.NantokaCluster TestHimotoki2.ClusterC "TITLE 1"
    debugPrint(instance2.dynamicType, instance2, instance2.title)   // TestHimotoki2.NantokaCluster TestHimotoki2.ClusterA "TITLE 2"
}

print()
print("TEST : CustomDecodable")
print()

do {

    let instance0 = try! decodeValue(json0) as CustomDecodable<A>
    let instance1 = try! decodeValue(json1) as CustomDecodable<A>
    let instance2 = try! decodeValue(json2) as CustomDecodable<A>
    
    debugPrint(instance0.value.dynamicType, instance0, instance0.value.title)   // TestHimotoki2Cluster.B TestHimotoki2Cluster.B "TITLE 0"
    debugPrint(instance1.value.dynamicType, instance1, instance1.value.title)   // TestHimotoki2Cluster.C TestHimotoki2Cluster.C "TITLE 1"
    debugPrint(instance2.value.dynamicType, instance2, instance2.value.title)   // TestHimotoki2Cluster.A TestHimotoki2Cluster.A "TITLE 2"
}
