//___FILEHEADER___

import UIKit

final class ___VARIABLE_moduleName___ViewController: BaseViewController<___VARIABLE_moduleName___ViewModel> {
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(___VARIABLE_cellName___.self)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

// MARK: - UITableViewDataSource
extension ___VARIABLE_moduleName___ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItemsAt(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ___VARIABLE_cellName___ = tableView.dequeueReusableCell(for: indexPath)
        let cellItem = viewModel.cellItemAt(indexPath: indexPath)
        cell.set(viewModel: cellItem)
        return cell
    }
}
