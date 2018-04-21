internal extension BootstrapProcedureManager {
    internal enum State {
        case pending
        case succeeded
        case failed(Error)
    }
}
