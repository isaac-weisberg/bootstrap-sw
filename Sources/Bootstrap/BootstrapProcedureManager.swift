public class BootstrapProcedureManager {
    internal var state: State = .pending
    internal var successHandler: (() -> Void)?
    internal var failureHandler: ((Error?) -> Void)?

    internal init() {

    }

    public func succeed() {
        guard state.isPending else {
            return
        }
        successHandler?()
    }

    public func fail(with error: Error? = nil) {
        guard state.isPending else {
            return
        }

        failureHandler?(error)
    }
}
