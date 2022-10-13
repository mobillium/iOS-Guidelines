//___FILEHEADER___

import SwiftUI

public struct ___VARIABLE_moduleName___View: View {
    
    var viewModel: any ___VARIABLE_moduleName___ViewProtocol
    
    public var body: some View {
        Text("___VARIABLE_moduleName___")
    }
    
    public init(viewModel: any ___VARIABLE_moduleName___ViewProtocol) {
        self.viewModel = viewModel
    }
}

struct ___VARIABLE_moduleName___View_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = ___VARIABLE_moduleName___ViewModel()
        let view = ___VARIABLE_moduleName___View(viewModel: viewModel)
        return view
    }
}
