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
        subview.font = UIFont.preferredFont(forTextStyle: .headline)
        subview.textAlignment = .natural
        subview.numberOfLines = 0
        return subview
    }()

    private lazy var thumbnailImageView: UIImageView = {
        let subview = UIImageView()
        subview.translatesAutoresizingMaskIntoConstraints = false
        subview.contentMode = .scaleAspectFit
        return subview
    }()

    private lazy var stackView: UIStackView = {
        let subview = UIStackView()
        subview.translatesAutoresizingMaskIntoConstraints = false
        subview.axis = .vertical
        subview.spacing = 10.0
        subview.distribution = .equalSpacing
        return subview
    }()

    private func commonInit() {
        accessoryType = .disclosureIndicator
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

    func update(with viewModel: ArticleListCellViewModel, completion: (() -> Void)?) {
        titleLabel.text = viewModel.title
        if let thumbnailString = viewModel.thumbnail {
            thumbnailImageView.isHidden = false
            if let image = SDImageCache.shared.imageFromCache(forKey: thumbnailString) {
                thumbnailImageView.image = image
            } else {
                // need to call completion to trigger a reload for the cell to resize
                thumbnailImageView.sd_setImage(with: URL(string: thumbnailString), completed: { _,_,_,_ in
                    completion?()
                })
            }
        } else {
            thumbnailImageView.isHidden = true
        }
    }

    static func reuseIdentifier() -> String {
        return "ArticleListCell"
    }
}
