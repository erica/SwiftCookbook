//: [Previous](@previous)

import Foundation
import MobileCoreServices

//: ### Unretained Values

enum Error: ErrorType {case NoMatchingExtension}

//: Recipe 3-4
//: Copy returns +1, so take retained value
public func PreferredFileExtensionForUTI(uti: String) throws -> String {
    if let result = UTTypeCopyPreferredTagWithClass(uti, kUTTagClassFilenameExtension) {
        return result.takeRetainedValue() as String
    }
    throw Error.NoMatchingExtension
}

//: Find lots more UTIs here: https://developer.apple.com/library/ios/documentation/Miscellaneous/Reference/UTIRef/Articles/System-DeclaredUniformTypeIdentifiers.html
let shouldBeJPEG = try! PreferredFileExtensionForUTI("public.jpeg")
let shouldBeAIFF = try! PreferredFileExtensionForUTI("public.aiff-audio")

//: [Next](@next)
