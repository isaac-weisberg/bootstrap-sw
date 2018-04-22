import Bootstrap

class ProcedureQuick: Procedure {
    func initiate(with manager: ProcedureManager) {
        let s = "3 + 7 = \(3 + 7)"
        print(s)
        manager.succeed()
    }
}