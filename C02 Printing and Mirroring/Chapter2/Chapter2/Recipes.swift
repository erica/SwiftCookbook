/*

   http://ericasadun.com

*/

import Foundation

// Recipe 2-1

public class OutputStream: OutputStreamType {
    let stream: UnsafeMutablePointer<FILE> // Target stream
    var path: String? = nil // File path if used
    
    // Create with stream
    public init(_ stream: UnsafeMutablePointer<FILE>) {
    self.stream = stream
    }
    
    // Create with output file
    public init?(var path: String, append: Bool = false) {
    path = (path as NSString).stringByExpandingTildeInPath
    if append {
        stream = fopen(path, "a")
    } else {
        stream = fopen(path, "w")
    }
    if stream == nil {return nil}
    self.path = path
    }
    
    // stderr
    public static func stderr() -> OutputStream {
        return OutputStream(Darwin.stderr)
    }
    
    // stdout
    public static func stdout() -> OutputStream {
        return OutputStream(Darwin.stdout)
    }
    
    // Conform to OutputStreamType
    public func write(string: String) {
        fputs(string, stream)
    }
    
    // Clean up open FILE
    deinit {
        if path != nil {fclose(stream)}
    }
}

public var errStream = OutputStream.stderr()
public var stdStream = OutputStream.stdout()

// Recipe 2-2

internal func BuildSimpleTimeFormatter() -> NSDateFormatter {
    let dateFormatter = NSDateFormatter()
    // Alternatively pass mmssSSS. Extraneous punctuation is ignored
    dateFormatter.dateFormat = NSDateFormatter.dateFormatFromTemplate("mm:ss:SSS", options: 0, locale: NSLocale.currentLocale())
    return dateFormatter
}

internal let dateFormatter = BuildSimpleTimeFormatter()

public func SWLog(format: String, _ args: CVarArgType...) {
    #if DEBUG
        let timeString = dateFormatter.stringFromDate(NSDate())
        print("\(timeString)",  String(format: format, arguments: args), toStream: &errStream)
    #endif
}

// Recipe 2-3


postfix operator *** {}
public postfix func *** <T>(object: T) -> T {
    #if DEBUG
        print(object)
    #endif
    return object
}

postfix operator **** {}
public postfix func **** <T>(object: T) -> T {
    #if DEBUG
        debugPrint(object)
    #endif
    return object
}

// Recipe 2-4

// Thanks, Mike Ash

// Coerce to label/value output where possible
public protocol DefaultReflectable: CustomStringConvertible {}
extension DefaultReflectable {
    internal func DefaultDescription<T>(instance: T) -> String {
        let mirror = Mirror(reflecting: instance)
        let chunks = mirror.children.map({
            (label: String?, value: Any) -> String in
            if let label = label {
                return "\(label)=\(value)"
            } else {
                return "\(value)"
            }
        })
        if chunks.count > 0 {
            let chunksString = chunks.joinWithSeparator(", ")
            return "\(mirror.subjectType)(\(chunksString))"
        } else {
            return "\(instance)"
        }
    }
    
    // Conform to CustomStringConvertible
    public var description: String {return DefaultDescription(self)}
}

public class NonConformantClass {
    var x = 42; var y = "String"; var z = 22.5
}

public class ConformantClass: DefaultReflectable {
    var x = 42; var y = "String"; var z = 22.5
}

public func MirrorConformanceExamples() {
    print(NonConformantClass()) // Chapter2.NonConformantClass
    print(ConformantClass()) // ConformantClass(x=42, y=String, z=22.5)
}
