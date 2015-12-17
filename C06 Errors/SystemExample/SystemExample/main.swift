//
//  main.swift
//  SystemExample
//
//  Created by Erica Sadun on 9/4/15.
//  Copyright © 2015 Erica Sadun. All rights reserved.
//

import Foundation

//: # Recipe 6-7
//: guard and defer


public struct ProcessError: ErrorType {let reason: String}

// Execute a system command return the results as a string
public func performSystemCommand(command: String) throws -> String {
    
    // Open a new process
    guard let fp: UnsafeMutablePointer<FILE> = popen(command, "r") else {
        throw ProcessError(reason: "Unable to open process")
    }; defer{pclose(fp)}
    
    // Read the process stream
    let buffer: UnsafeMutablePointer<UInt8> =
    UnsafeMutablePointer.alloc(1024); defer {buffer.dealloc(1024)}
    var bytes: [UInt8] = []
    repeat {
        let count: Int = fread(buffer, 1, 1024, fp)
        if count > 0 {
            bytes.appendContentsOf(
                Array(UnsafeBufferPointer(start:buffer, count:count)))
        }
    } while feof(fp) == 0
    
    guard let string =
        String(bytes: bytes, encoding: NSUTF8StringEncoding) else {
            throw ProcessError(reason:"Process returned unreadable data")
    }
    return string
}

print(try! performSystemCommand("/bin/ls ~"))
