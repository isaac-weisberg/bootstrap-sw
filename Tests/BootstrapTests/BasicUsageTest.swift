import XCTest
@testable import Bootstrap

class BasicUsageTest: XCTestCase, BootstrapDelegate {
    var exp: XCTestExpectation?

    func testBasicUsage() {
        exp = expectation(description: "Should be fulfilled once all procedures complete")

        Bootstrap.shared.bootstrap([
            ProcedureQuick(),
            ProcedureABitLonger()
        ], delegatingTo: self)

        waitForExpectations(timeout: 20.0)
    }

    func bootstrappingSucceeded() {
        exp?.fulfill()
    }

    func shouldFatalOut(with procedure: Procedure, managedBy manager: ProcedureManager, failingWith error: Error?) -> Bool {
        exp?.fulfill()
        return false
    }

    static let allTests = [
        ("testBasicUsage", testBasicUsage)
    ]
}