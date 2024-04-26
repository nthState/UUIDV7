//
//  Copyright © nthState Ltd. 2024. All rights reserved.
//

import Foundation

extension UInt64 {
  // Correctly generate Data representation in big endian format
  internal var bigEndianData: Data {
    var bigEndianValue = self.bigEndian
    return Data(bytes: &bigEndianValue, count: MemoryLayout<UInt64>.size)
  }
}
