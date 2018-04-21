public protocol BootstrapResultsDelegate: class {
    func bootstrappingSucceeded()

    func shouldFatalOut(with procedure: BootstrapProcedure, managedBy manager: BootstrapProcedureManager, failingWith error: Error?) -> Bool
}