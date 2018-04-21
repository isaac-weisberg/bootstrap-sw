public protocol BootstrapProcedure: class {
    public func initiated(by manager: BootstrapProcedureManager)
}