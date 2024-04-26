//
//  Copyright © nthState Ltd. 2024. All rights reserved.
//

import Foundation

extension String {
  internal func insertHyphens() -> String {
    let pattern = "(.{8})(.{4})(.{4})(.{4})(.{12})"
    let regex = try? NSRegularExpression(pattern: pattern, options: [])
    let range = NSRange(location: 0, length: count)

    return regex?.stringByReplacingMatches(in: self, options: [], range: range, withTemplate: "$1-$2-$3-$4-$5") ?? self
  }
}
