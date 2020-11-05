import Foundation
import UIKit

class ArticleDetailVC: UIViewController {
    weak var presenter: ArticleDetailPresenter?

    private lazy var scrollView: UIScrollView = {
        let subview = UIScrollView()
        subview.translatesAutoresizingMaskIntoConstraints = false
        return subview
    }()

    private lazy var scrollStackView: UIStackView = {
        let subview = UIStackView()
        subview.translatesAutoresizingMaskIntoConstraints = false
        subview.axis = .vertical
        return subview
    }()

    private lazy var imageView: UIImageView = {
        let subview = UIImageView()
        subview.translatesAutoresizingMaskIntoConstraints = false
        subview.contentMode = .scaleAspectFit
        let heightConstraint = subview.heightAnchor.constraint(equalToConstant: 100.0)
        heightConstraint.priority = .defaultLow
        heightConstraint.isActive = true
        let widthConstraint = subview.widthAnchor.constraint(equalToConstant: 200.0)
        widthConstraint.priority = .defaultLow
        widthConstraint.isActive = true
        return subview
    }()
    

    override func loadView() {
        view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = .white

        scrollView.addSubview(scrollStackView)
        view.addSubview(scrollView)

        let safeLayoutGuide = view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            scrollStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0.0),
            scrollStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 0.0),
            scrollStackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0.0),
            scrollStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0.0),
            scrollStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0.0),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0.0),
            scrollView.topAnchor.constraint(equalTo: safeLayoutGuide.topAnchor, constant: 0.0),
            scrollView.bottomAnchor.constraint(equalTo: safeLayoutGuide.bottomAnchor, constant: 0.0)
        ])
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
