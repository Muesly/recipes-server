@testable import RecipesServer
import Hummingbird
import HummingbirdTesting
import XCTest

final class RecipesServerTests: XCTestCase {
    func testRecipesServer() async throws {
        let app = buildApplication(configuration: .init())
        try await app.test(.router) { client in
            try await client.execute(uri: "/", method: .get) { response in
                XCTAssertEqual(response.status, .ok)
                XCTAssertEqual(String(buffer: response.body), "Some recipes")
            }
        }
    }
}
