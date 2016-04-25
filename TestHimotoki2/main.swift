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

let instance0 = try! decodeValue(json0) as Cluster
let instance1 = try! decodeValue(json1) as Cluster
let instance2 = try! decodeValue(json2) as Cluster

debugPrint(instance0.dynamicType, instance0, instance0.title)   // TestHimotoki2.Cluster TestHimotoki2.B "TITLE 0"
debugPrint(instance1.dynamicType, instance1, instance1.title)   // TestHimotoki2.Cluster TestHimotoki2.C "TITLE 1"
debugPrint(instance2.dynamicType, instance2, instance2.title)   // TestHimotoki2.Cluster TestHimotoki2.A "TITLE 2"
