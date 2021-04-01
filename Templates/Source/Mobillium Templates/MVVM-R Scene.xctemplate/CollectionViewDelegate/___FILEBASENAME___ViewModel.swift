//___FILEHEADER___

import Foundation

protocol ___VARIABLE_moduleName___ViewDataSource {
    func numberOfItemsAt(section: Int) -> Int
    func cellItemAt(indexPath: IndexPath) -> ___VARIABLE_cellName___Protocol
}

protocol ___VARIABLE_moduleName___ViewEventSource {}

protocol ___VARIABLE_moduleName___ViewProtocol: ___VARIABLE_moduleName___ViewDataSource, ___VARIABLE_moduleName___ViewEventSource {}

final class ___VARIABLE_moduleName___ViewModel: BaseViewModel<___VARIABLE_moduleName___Router>, ___VARIABLE_moduleName___ViewProtocol {
    
    func numberOfItemsAt(section: Int) -> Int {
        return cellItems.count
    }
    
    func cellItemAt(indexPath: IndexPath) -> ___VARIABLE_cellName___Protocol {
        return cellItems[indexPath.row]
    }
    
    private let cellItems: [___VARIABLE_cellName___Protocol] = []
    
}
