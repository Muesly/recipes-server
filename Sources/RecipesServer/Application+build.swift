import Hummingbird

func buildApplication(configuration: ApplicationConfiguration) -> some ApplicationProtocol {
    let router = Router()
    router.get("/") { _, _ in
        return "Some recipes"
    }

    let app = Application(
        router: router,
        configuration: configuration
    )
    return app
}
