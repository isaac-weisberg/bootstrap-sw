public protocol BootstrapDelegate: class {
    func bootstrappingSucceeded()

    func shouldFatalOut(with procedure: Procedure, managedBy manager: ProcedureManager, failingWith error: Error?) -> Bool
}
