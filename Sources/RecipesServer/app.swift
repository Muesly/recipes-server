import ArgumentParser

@main
struct HummingbirdArguments: AsyncParsableCommand {
    @Option(name: .shortAndLong)
    var hostname: String = "127.0.0.1"

    @Option(name: .shortAndLong)
    var port: Int = 8080

    func run() async throws {
        let app = buildApplication(
            configuration: .init(
                address: .hostname(self.hostname, port: self.port),
                serverName: "Recipes"
            )
        )
        try await app.runService()
    }
}
