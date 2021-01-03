import XCTest
import SuperString
// swiftlint:disable
final class SuperStringTests: XCTestCase {
    func testKebabcased() {
        let inputPairs: [(input: String, expected: String)] = [
            (input: "this is a test", expected: "this-is-a-test"),
            (input: "this is A test", expected: "this-is--a-test"),
            (input: "ThisIsATest", expected: "this-is-a-test"),
            (input: "ThisIs a Test", expected: "this-is-a--test"),
        ]
        for inputPair in inputPairs {
            XCTAssertEqual(inputPair.input.kebabcased(), inputPair.expected)
        }
    }

    func testSnakecased() {
        let inputPairs: [(input: String, expected: String)] = [
            (input: "this is a test", expected: "this_is_a_test"),
            (input: "this is A test", expected: "this_is__a_test"),
            (input: "ThisIsATest", expected: "this_is_a_test"),
            (input: "ThisIs a Test", expected: "this_is_a__test"),
        ]
        for inputPair in inputPairs {
            XCTAssertEqual(inputPair.input.snakecased(), inputPair.expected)
        }
    }

    static var allTests = [
        ("testKebabcased", testKebabcased),
        ("testSnakecased", testSnakecased),
    ]
}
