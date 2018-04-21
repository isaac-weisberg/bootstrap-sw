#if os(Linux)
    import Dispatch
#else
    import Foundation
#endif

public extension Bootstrap {
    public static let shared = Bootstrap() 
}

public class Bootstrap {
    private init() {  }

    public func bootstrap(_ procedures: [BootstrapProcedure], delegatingTo delegate: BootstrapResultsDelegate) {
        let bootstrapQueue = DispatchQueue(label: "com.isaac-weisberg.bootstrap", qos: .userInitiated, attributes: [ .concurrent ])
        let group = DispatchGroup()

        procedures.forEach { procedure in
            let manager = BootstrapProcedureManager()

            manager.successHandler = {
                group.leave()
            }
            manager.failureHandler = { error in
                if delegate.shouldFatalOut(with: procedure, managedBy: manager, failingWith: error) {
                    fatalError("Death by bootstrap with \(procedure) managedBy \(manager) because of \(String(describing: error))")
                }
            }

            group.enter()
            bootstrapQueue.async {
                procedure.initiated(with: manager)
            }
        }

        group.notify(qos: .default, flags: [], queue: .main) {
            delegate.bootstrappingSucceeded()
        }
    }
}
