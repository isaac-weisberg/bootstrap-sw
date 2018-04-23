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

    public func bootstrap(_ procedures: [Procedure], delegatingTo delegate: BootstrapDelegate) {
        let bootstrapQueue = DispatchQueue(label: "com.isaac-weisberg.bootstrap", qos: .userInteractive, attributes: [ .concurrent ])
        let group = DispatchGroup()

        procedures.forEach { procedure in
            let manager = ProcedureManager()

            manager.successHandler = {
                group.leave()
            }
            manager.failureHandler = { error in
                if delegate.shouldFatalOut(with: procedure, managedBy: manager, failingWith: error) {
                    fatalError("Death by bootstrap with \(procedure) managedBy \(manager) because of \(String(describing: error))")
                }
                group.leave()
            }

            group.enter()
            bootstrapQueue.async {
                procedure.initiate(with: manager)
            }
        }

        group.notify(qos: .default, flags: [], queue: .main) {
            delegate.bootstrappingSucceeded()
        }
    }
}
