import XCTest
@testable import Nami

final class NamiTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Nami().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
