//___FILEHEADER___

import UIKit

final class ___VARIABLE_moduleName___Builder {
    
    static func make() -> ___VARIABLE_moduleName___ViewController {
        let storyboard = UIStoryboard(name: "___VARIABLE_moduleName___", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "___VARIABLE_moduleName___ViewController") as! ___VARIABLE_moduleName___ViewController
        let router = ___VARIABLE_moduleName___Router(view: view)
        let presenter = ___VARIABLE_moduleName___Presenter(view: view,
                                           interactor:     ___VARIABLE_moduleName___Interactor(),
                                           router: router)
        view.presenter = presenter
        return view
    }
}
