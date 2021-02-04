//___FILEHEADER___

protocol ___VARIABLE_moduleName___Route {
    func present___VARIABLE_moduleName___()
}

extension ___VARIABLE_moduleName___Route where Self: RouterProtocol {
    
    func present___VARIABLE_moduleName___() {
        let router = ___VARIABLE_moduleName___Router()
        let viewModel = ___VARIABLE_moduleName___ViewModel(router: router)
        let viewController = ___VARIABLE_moduleName___ViewController(viewModel: viewModel)
        
        let transition = ModalTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
