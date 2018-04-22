import Bootstrap
#if os(Linux)
    import Dispatch
#endif

class ProcedureABitLonger: Procedure {
    func initiated(with manager: ProcedureManager) {
        DispatchQueue.global(qos: .userInitiated).async {
            print("The 'ASDF Super Deluxe' framework is fully initiated.")
            manager.succeed()
        }
    }
}