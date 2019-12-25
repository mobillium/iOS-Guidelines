//___FILEHEADER___

import Foundation

class ___VARIABLE_moduleName___Presenter: ___VARIABLE_moduleName___PresenterProtocol {
    
    private unowned let view: ___VARIABLE_moduleName___ViewProtocol
    private let interactor: ___VARIABLE_moduleName___InteractorProtocol
    private let router: ___VARIABLE_moduleName___RouterProtocol
    
    init(view: ___VARIABLE_moduleName___ViewProtocol,
         interactor: ___VARIABLE_moduleName___InteractorProtocol,
         router: ___VARIABLE_moduleName___RouterProtocol) {
        
        self.view = view
        self.interactor = interactor
        self.router = router
        self.interactor.delegate = self
    }
}
