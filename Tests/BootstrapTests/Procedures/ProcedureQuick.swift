import Bootstrap

class ProcedureQuick: Procedure {
    func initiated(with manager: ProcedureManager) {
        let s = "3 + 7 = \(3 + 7)"
        print(s)
        manager.succeed()
    }
}