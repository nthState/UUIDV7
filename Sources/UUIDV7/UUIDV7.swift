//
//  Copyright © nthState Ltd. 2024. All rights reserved.
//

import Foundation

public extension UUID {

  /// Generate a UUID Version 7 string
  /// - Parameter withHyphens: Format the string with hypens
  /// - Returns: A UUID Version 7 string
  static func uuidV7String(withHyphens: Bool = true) -> String {
    let timestamp = Date().timeIntervalSince1970
    let unixTimeMilliseconds = UInt64(timestamp * 1000)
    let timeBytes = unixTimeMilliseconds.bigEndianData.suffix(6) // First 6 bytes for the timestamp

    // Prepare the random part (10 bytes to complete the UUID)
    let randomBytes = Data((0..<10).map { _ in UInt8.random(in: 0...255) })

    // Combine parts
    var uuidBytes = Data()
    uuidBytes.append(contentsOf: timeBytes)
    uuidBytes.append(contentsOf: randomBytes)

    // Ensure we have a total of 16 bytes
    assert(uuidBytes.count == 16, "UUID must be exactly 16 bytes")

    // Set version (7) in the version byte
    uuidBytes[6] = (uuidBytes[6] & 0x0F) | 0x70

    // Set the UUID variant (10xx for standard UUIDs)
    uuidBytes[8] = (uuidBytes[8] & 0x3F) | 0x80

    // Convert to hexadecimal string
    let uuidString = uuidBytes.map { String(format: "%02x", $0) }.joined()

    return withHyphens ? uuidString.insertHyphens() : uuidString
  }
}
