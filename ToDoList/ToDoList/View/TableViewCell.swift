
import UIKit

class TableViewCell: UITableViewCell {
    
    static let reuseId = "TableViewCell"
    
    private lazy var nameItemLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textAlignment = .left
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



extension TableViewCell {
    
    func setupViews() {
        contentView.addSubview(nameItemLabel)
    }
    
    func setupConstraints() {
        nameItemLabel.snp.makeConstraints { make in
            make.top.bottom.equalTo(contentView).inset(10)
            make.leading.trailing.equalTo(contentView).inset(20)
        }
    }
    
}
