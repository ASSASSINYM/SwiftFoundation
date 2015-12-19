//
//  JSONSerialization.swift
//  SwiftFoundation
//
//  Created by Alsey Coleman Miller on 12/19/15.
//  Copyright © 2015 PureSwift. All rights reserved.
//

/// JSON Serialization engine type.
public protocol JSONSerializationType {
    
    typealias WritingOptions
    
    /// Serializes a ```JSON.Object``` to 
    static func serialize(object: JSON.Object, options: WritingOptions) -> String
    
    static func serialize(array: JSON.Array, options: WritingOptions) -> String
    
    static func parse(string: String) -> JSON.Value?
}

public extension JSON.Value {
    
    /// Deserialize JSON from a string.
    public init?<T: JSONSerializationType>(string: Swift.String, _ engine: T.Type) {
        
        guard let parsedJSON = engine.parse(string)
            else { return nil }
        
        self = parsedJSON
    }
    
    /// Convenience method for serializing JSON.
    public func toString<T: JSONSerializationType>(options: T.WritingOptions, _ engine: T.Type) -> Swift.String? {
        
        switch self {
            
        case let .Array(value): return engine.serialize(value, options: options)
        case let .Object(value): return engine.serialize(value, options: options)
        default:  return nil
        }
    }
}