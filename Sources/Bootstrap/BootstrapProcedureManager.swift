public class BootstrapProcedureManager {
    private weak var bootstrap

    internal var state: State = .pending

    public func succeed() {
        
    }

    public func fail(with error: Error? = nil) {

    }
}
