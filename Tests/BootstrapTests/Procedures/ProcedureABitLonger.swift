import Bootstrap
import Dispatch

class ProcedureABitLonger: Procedure {
    func initiate(with manager: ProcedureManager) {
        DispatchQueue.global(qos: .userInitiated).async {
            print("The 'ASDF Super Deluxe' framework is fully initiated.")
            manager.succeed()
        }
    }
}
