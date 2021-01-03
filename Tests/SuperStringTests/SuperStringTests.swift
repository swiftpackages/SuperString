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
            (input: "ThisIs a Cool string", expected: "this-is-a--cool-string"),
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
            (input: "ThisIs a Cool string", expected: "this_is_a__cool_string"),
        ]
        for inputPair in inputPairs {
            XCTAssertEqual(inputPair.input.snakecased(), inputPair.expected)
        }
    }
    
    func testCamelcased() {
        let inputPairs: [(input: String, lower: String, upper: String)] = [
            (input: "this is a test", lower: "thisIsATest", upper: "ThisIsATest"),
            (input: "this is A test", lower: "thisIsATest", upper: "ThisIsATest"),
            (input: "ThisIsATest", lower: "thisIsATest", upper: "ThisIsATest"),
            (input: "ThisIs a Test", lower: "thisIsATest", upper: "ThisIsATest"),
            (input: "ThisIs a Cool string", lower: "thisIsACoolString", upper: "ThisIsACoolString"),
        ]
        for inputPair in inputPairs {
            XCTAssertEqual(inputPair.input.camelcased(), inputPair.lower)
            XCTAssertEqual(inputPair.input.camelcased(.upper), inputPair.upper)
        }
    }


    static var allTests = [
        ("testCamelcased", testCamelcased),
        ("testKebabcased", testKebabcased),
        ("testSnakecased", testSnakecased),
    ]
}
