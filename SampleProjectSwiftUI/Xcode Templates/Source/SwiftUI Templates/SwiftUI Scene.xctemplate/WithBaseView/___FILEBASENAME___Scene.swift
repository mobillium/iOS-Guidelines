//___FILEHEADER___

import Combine
import SwiftUI

struct ___VARIABLE_moduleName___Scene<ViewModel: ___VARIABLE_moduleName___SceneModel>: View {
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        BaseScene(content: {
            Text("___VARIABLE_moduleName___")
        }, viewModel: viewModel)
    }
}

struct ___VARIABLE_moduleName___Scene_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = ___VARIABLE_moduleName___SceneModel()
        return ___VARIABLE_moduleName___Scene(viewModel: viewModel)
    }
}
