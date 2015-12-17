import Accelerate
import UIKit

// Return VImageBuffer of size. Data is not allocated
public func vImageBufferWithSize(size: CGSize) -> vImage_Buffer {
    return vImage_Buffer(
        data: nil,
        height: UInt(size.height),
        width: UInt(size.width),
        rowBytes: Int(4 * size.width))
}

// Return VImageBuffer of size, initialized with data
public func VImageBufferWithData(data: NSData, size: CGSize) -> vImage_Buffer {
    var buffer = vImageBufferWithSize(size)
    buffer.data = unsafeBitCast(data.bytes, UnsafeMutablePointer<Void>.self)
    return buffer
}

// Retrieve image from VImageBuffer
public func imageFromVImageBuffer(var buffer: vImage_Buffer) -> UIImage? {
    guard let rgb = CGColorSpaceCreateDeviceRGB() else {return nil}
    var format = vImage_CGImageFormat(
        bitsPerComponent: 8,
        bitsPerPixel: 32,
        colorSpace: Unmanaged.passRetained(rgb),
        bitmapInfo: CGBitmapInfo(rawValue: CGImageAlphaInfo.First.rawValue),
        version: 0,
        decode: nil,
        renderingIntent: CGColorRenderingIntent.RenderingIntentDefault)
    var error = vImage_Error()
    if let unmanagedImage = vImageCreateCGImageFromBuffer(&buffer, &format, nil, nil, vImage_Flags(kvImageNoFlags), &error) {
        return UIImage(CGImage: unmanagedImage.takeRetainedValue())
    } else {
        print("Error converting vImage buffer to CGImageRef: \(vImage_Error.self)")
        return nil
    }
}

// Create VImageBuffer from image
public func vImageBufferWithImage(image: UIImage) -> vImage_Buffer? {
    guard let rgb = CGColorSpaceCreateDeviceRGB() else {return nil}
    guard let cgImage = image.CGImage else {return nil}
    var format = vImage_CGImageFormat(
        bitsPerComponent: 8,
        bitsPerPixel: 32,
        colorSpace: Unmanaged.passRetained(rgb),
        bitmapInfo: CGBitmapInfo(rawValue: CGImageAlphaInfo.First.rawValue),
        version: 0,
        decode: nil,
        renderingIntent: CGColorRenderingIntent.RenderingIntentDefault)
    let bufferPtr = UnsafeMutablePointer<vImage_Buffer>.alloc(1); defer{free(bufferPtr)}
    vImageBuffer_InitWithCGImage(bufferPtr, &format, nil, cgImage, vImage_Flags(kvImageNoFlags))
    let buffer = bufferPtr.memory
    return buffer
}

// Retrieve image bytes as NSData
public func bytesFromImage(image: UIImage ) -> NSData? {
    guard let buffer = vImageBufferWithImage(image) else {return nil}
    return NSData(bytes: unsafeBitCast(buffer, UnsafePointer<Void>.self), length: Int(vImagePixelCount(buffer.rowBytes) * buffer.height))
}

// Create image from bytes
public func imageFromBytes(data: NSData, size: CGSize) -> UIImage? {
    let buffer = VImageBufferWithData(data, size: size)
    return imageFromVImageBuffer(buffer)
}

// Convert kernel to NSData
public func dataFromInt16Kernel(var source: [Int16]) -> NSData {
    return NSData(bytes:&source, length: sizeof(Int16) * source.count)
}

// Convert NSData to kernel
public func kernelFromData(source: NSData) -> [Int16] {
    let count = source.length / sizeof(Int16)
    var array = [Int16](count: count, repeatedValue:0)
    source.getBytes(&array, length:source.length)
    return array
}

// Compute a likely divisor from the seat of one's pants
public func likelyDivisor(kernel: [Int16]) -> Int32 {
    var sum = 0; for each in kernel {sum += Int(each)}
    if sum == 0 {return Int32(1)}
    return Int32(sum)
}
