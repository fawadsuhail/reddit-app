import Foundation
import UIKit
import SDWebImage

struct ArticleListCellViewModel {
    var id: String
    var title: String
    var thumbnail: String?
}

class ArticleListCell: UITableViewCell {
    private lazy var titleLabel: UILabel = {
        let subview = UILabel()
        subview.translatesAutoresizingMaskIntoConstraints = false
        subview.textColor = .black
        subview.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        subview.textAlignment = .natural
        subview.numberOfLines = 0
        return subview
    }()

    private lazy var thumbnailImageView: UIImageView = {
        let subview = UIImageView()
        subview.translatesAutoresizingMaskIntoConstraints = false
        subview.contentMode = .scaleAspectFit
        subview.heightAnchor.constraint(equalToConstant: 100.0).isActive = true
        subview.widthAnchor.constraint(equalToConstant: 200.0).isActive = true
        return subview
    }()

    private lazy var stackView: UIStackView = {
        let subview = UIStackView()
        subview.translatesAutoresizingMaskIntoConstraints = false
        subview.axis = .vertical
        subview.spacing = 10.0
        subview.alignment = .center
        return subview
    }()

    private func commonInit() {
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(thumbnailImageView)

        contentView.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10.0),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10.0),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10.0),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10.0)
        ])
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    func update(with viewModel: ArticleListCellViewModel) {
        titleLabel.text = viewModel.title
        if let thumbnailString = viewModel.thumbnail,
           let url = URL(string: thumbnailString) {
            thumbnailImageView.isHidden = false
            thumbnailImageView.sd_setImage(with: url, completed: nil)
        } else {
            thumbnailImageView.isHidden = true
        }
    }

    static func reuseIdentifier() -> String {
        return "ArticleListCell"
    }
}
