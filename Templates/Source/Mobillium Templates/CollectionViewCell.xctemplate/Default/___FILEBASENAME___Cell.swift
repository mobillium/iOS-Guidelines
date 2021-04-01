//___FILEHEADER___

import UIKit

class ___VARIABLE_moduleName___Cell: UICollectionViewCell, ReusableView {
    
    weak var viewModel: ___VARIABLE_moduleName___CellProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureContents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureContents()
    }
    
    private func configureContents() {
        
    }
    
    func set(viewModel: ___VARIABLE_moduleName___CellProtocol) {
        self.viewModel = viewModel
        
    }
    
}
