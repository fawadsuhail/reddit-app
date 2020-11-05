import Foundation
import UIKit
import SDWebImage

struct ArticleDetailViewModel {
    var viewTitle: String
    var title: String
    var selftext: String?
    var thumbnail: String?
    var dateText: String
}

class ArticleDetailVC: UIViewController {
    var presenter: ArticleDetailPresenter?

    private lazy var scrollView: UIScrollView = {
        let subview = UIScrollView()
        subview.translatesAutoresizingMaskIntoConstraints = false
        return subview
    }()

    private lazy var scrollStackView: UIStackView = {
        let subview = UIStackView()
        subview.translatesAutoresizingMaskIntoConstraints = false
        subview.axis = .vertical
        subview.spacing = 10.0
        subview.isLayoutMarginsRelativeArrangement = true
        subview.layoutMargins = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
        return subview
    }()

    private lazy var imageView: UIImageView = {
        let subview = UIImageView()
        subview.translatesAutoresizingMaskIntoConstraints = false
        subview.contentMode = .scaleAspectFit
        return subview
    }()
    
    private lazy var titleLabel: UILabel = {
        let subview = UILabel()
        subview.translatesAutoresizingMaskIntoConstraints = false
        subview.textColor = .black
        subview.font = UIFont.preferredFont(forTextStyle: .headline)
        subview.textAlignment = .natural
        subview.numberOfLines = 0
        return subview
    }()

    private lazy var descriptionLabel: UILabel = {
        let subview = UILabel()
        subview.translatesAutoresizingMaskIntoConstraints = false
        subview.textColor = .black
        subview.font = UIFont.preferredFont(forTextStyle: .body)
        subview.textAlignment = .natural
        subview.numberOfLines = 0
        return subview
    }()

    private lazy var dateLabel: UILabel = {
        let subview = UILabel()
        subview.translatesAutoresizingMaskIntoConstraints = false
        subview.textColor = .black
        subview.font = UIFont.preferredFont(forTextStyle: .caption1)
        subview.textAlignment = .natural
        subview.numberOfLines = 0
        return subview
    }()

    override func loadView() {
        view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = .white

        scrollStackView.addArrangedSubview(imageView)
        scrollStackView.addArrangedSubview(titleLabel)
        scrollStackView.addArrangedSubview(dateLabel)
        scrollStackView.addArrangedSubview(descriptionLabel)

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
        presenter?.viewLoaded()
    }

    func update(with viewModel: ArticleDetailViewModel) {
        title = viewModel.viewTitle.removingPercentEncoding
        if let thumbnail = viewModel.thumbnail {
            imageView.isHidden = false
            imageView.sd_setImage(with: URL(string: thumbnail), completed: nil)
        } else {
            imageView.isHidden = true
        }
        titleLabel.text = viewModel.title.removingPercentEncoding
        dateLabel.text = viewModel.dateText
        descriptionLabel.text = viewModel.selftext?.removingPercentEncoding
    }
}
