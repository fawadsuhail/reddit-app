import Foundation
import UIKit

class ArticleDetailVC: UIViewController {
    weak var presenter: ArticleDetailPresenter?

    override func loadView() {
        view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = .white
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
