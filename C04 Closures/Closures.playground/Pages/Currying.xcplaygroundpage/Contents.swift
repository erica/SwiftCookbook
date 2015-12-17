//: [Previous](@previous)

import UIKit
import Accelerate

// NOTE: CURRYING TO BE REMOVED IN SWIFT 3.0
// NOTE: VAR PARAMETERS TO BE REMOVED IN SWIFT 3.0 (func var and guard var)

//: ### Currying: Image Processing
//: Make sure to look in the sources and resources folders for this page

// Convolve a kernel with an image
public func convolve(var kernel: [Int16])(_ image: UIImage) -> UIImage? {

    // Establish input and output buffers
    guard var inVBuffer = vImageBufferWithImage(image) else {return nil}
    var outVBuffer = vImageBufferWithSize(image.size)
    
    // Populate output buffer
    let byteCount = Int(vImagePixelCount(outVBuffer.rowBytes) * outVBuffer.height)
    outVBuffer.data = malloc(byteCount); defer{free(outVBuffer.data)}
    
    // Perform convolution
    var backColor: [UInt8] = [0xFF, 0, 0, 0]
    let kernelSize: UInt32 = UInt32(sqrt(Double(kernel.count)))
    let error = vImageConvolve_ARGB8888(
        &inVBuffer, &outVBuffer, nil,
        vImagePixelCount(0), vImagePixelCount(0),
        &kernel, kernelSize, kernelSize,
        likelyDivisor(kernel), // can just sub 1 if needed
        &backColor, vImage_Flags(kvImageBackgroundColorFill))

    // Return results
    if error == kvImageNoError {
        return imageFromVImageBuffer(outVBuffer)
    } else {
        print("Error convolving image")
        return nil
    }
}

//: Build partially-applied curried functions
//: Recipe 4-7
public var embossKernel: [Int16] = [
    -2, -1, 0,
    -1, 1, 1,
    0, 1, 2]
public let Emboss = convolve(embossKernel)
public var sharpenKernel: [Int16] = [
    0,  -1, 0,
    -1,  8, -1,
    0,  -1, 0
]
public let sharpen = convolve(sharpenKernel)
public var blur3Kernel: [Int16] = [Int16](count: 9, repeatedValue:1)
public let blur3 = convolve(blur3Kernel)
public var blur5Kernel: [Int16] = [Int16](count: 25, repeatedValue:1)
public let blur5 = convolve(blur5Kernel)
public var blur7Kernel: [Int16] = [Int16](count: 49, repeatedValue:1)
public let blur7 = convolve(blur7Kernel)
public var gauss5Kernel: [Int16] = [
    1,  4,  6,  4, 1,
    4, 16, 24, 16, 4,
    6, 24, 36, 24, 6,
    4, 16, 24, 16, 4,
    1,  4,  6,  4, 1
]
public let gauss5 = convolve(gauss5Kernel)

//: Convolve!
let image = UIImage(named:"landscape600")!

sharpen(image)
Emboss(image)
blur5(image)
gauss5(image)

//: [Next](@next)
