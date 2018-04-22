import Bootstrap
#if os(Linux)
    import Dispatch
#endif

class ProcedureKindaLong: Procedure {
    func initiate(with manager: ProcedureManager) {
        DispatchQueue.global(qos: .userInteractive).asyncAfter(deadline: .now() + 0.2) {
            print("Successfully sent some initial Boogle Analytics info.")
            manager.succeed()
        }
    }
}