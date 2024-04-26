//
//  Copyright © nthState Ltd. 2024. All rights reserved.
//

@testable import UUIDV7
import XCTest

final class UUIDv7GeneratorTests: XCTestCase {

  func testGeneratedUUIDv7IsValidFormat() {
    let uuid = UUID.uuidV7String()

    print("UUID: \(uuid)")

    let uuidPattern = "^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$"
    let regex = try? NSRegularExpression(pattern: uuidPattern, options: [])

    let range = NSRange(location: 0, length: uuid.count)
    let matches = regex?.numberOfMatches(in: uuid, options: [], range: range)

    XCTAssertEqual(matches, 1, "Generated UUIDv7 should match the expected format")
  }

  func testGeneratedUUIDv7IsDifferentEachTime() {
    let uuid1 = UUID.uuidV7String()
    let uuid2 = UUID.uuidV7String()

    print("UUID:1 \(uuid1)")
    print("UUID:2 \(uuid2)")

    XCTAssertNotEqual(uuid1, uuid2, "Generated UUIDv7 should be different each time")
  }

  func testGeneratedUUIDv7IsLexicallyTimeSortable() {
    let uuid1 = UUID.uuidV7String()
    Thread.sleep(forTimeInterval: 0.05) // Wait for a few milliseconds
    let uuid2 = UUID.uuidV7String()

    print("UUID:1 \(uuid1)")
    print("UUID:2 \(uuid2)")

    // Directly compare the string representations
    XCTAssertLessThan(uuid1, uuid2, "UUIDv7s should be lexically time-sortable")
  }
}
