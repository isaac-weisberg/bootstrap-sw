internal extension BootstrapProcedureManager {
    internal enum State {
        case pending
        case succeeded
        case failed(Error)

        var isPending: Bool {
            if case .pending = self {
                return true
            }
            return false
        }

        var isSucceeded: Bool {
            if case .succeeded = self {
                return true
            }
            return false
        }

        var isFailed: Bool {
            if case .failed = self {
                return true
            }
            return false
        }
    }
}
