//___FILEHEADER___

import UIKit

public class ___VARIABLE_moduleName___Cell: UITableViewCell, ReusableView {
    
    weak var viewModel: ___VARIABLE_moduleName___CellProtocol?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureContents()
    }
    
    private func configureContents() {
        
    }
    
    public func set(viewModel: ___VARIABLE_moduleName___CellProtocol) {
        self.viewModel = viewModel
        
    }
    
}
