import Foundation
import UIKit

class ArticleListVC: UIViewController {
    var presenter: ArticleListPresenter?

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    private lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.style = .gray
        activityIndicator.isHidden = true
        return activityIndicator
    }()

    override func loadView() {
        view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = .white

        view.addSubview(tableView)
        view.addSubview(activityIndicator)

        let safeLayoutGuide = view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: safeLayoutGuide.leadingAnchor, constant: 0.0),
            tableView.trailingAnchor.constraint(equalTo: safeLayoutGuide.trailingAnchor, constant: 0.0),
            tableView.topAnchor.constraint(equalTo: safeLayoutGuide.topAnchor, constant: 0.0),
            tableView.bottomAnchor.constraint(equalTo: safeLayoutGuide.bottomAnchor, constant: 0.0),
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0.0),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0.0)
        ])
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Swift News"
        presenter?.viewLoaded()
    }

    func showLoading() {
        tableView.isHidden = true
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
    }

    func hideLoading() {
        tableView.isHidden = false
        activityIndicator.isHidden = true
        activityIndicator.stopAnimating()
    }
}
