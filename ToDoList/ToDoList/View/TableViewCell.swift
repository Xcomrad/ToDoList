
import UIKit

protocol TableViewCellDelegate: AnyObject {
    func didToggleComplete(for item: Model)
}

class TableViewCell: UITableViewCell {
    
    weak var delegate: TableViewCellDelegate?
    private var item: Model?
    
    static let reuseId = "TableViewCell"
    
    private lazy var nameItemLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var completeButton: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(completeButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    //MARK: - Action
    @objc private func completeButtonTapped() {
        guard let item = item else { return }
        delegate?.didToggleComplete(for: item)
    }
    
    //MARK: - Update
    func update(_ item: Model) {
        self.item = item
        nameItemLabel.text = item.title
        
        let titleColor: UIColor = item.isCompleted ? .lightGray : .black
        nameItemLabel.textColor = titleColor
        
        let buttonTitle = item.isCompleted ? "Завершено" : "В процессе"
        completeButton.setTitle(buttonTitle, for: .normal)
        
        let buttonTitleColor: UIColor = item.isCompleted ? .systemGreen : .systemRed
        completeButton.setTitleColor(buttonTitleColor, for: .normal)
        
        let backGroundCollor: UIColor = item.isCompleted ? .systemGray6 : .white
        contentView.backgroundColor = backGroundCollor
    }
}



extension TableViewCell {
    
    func setupViews() {
        contentView.addSubview(nameItemLabel)
        contentView.addSubview(completeButton)
    }
    
    func setupConstraints() {
        nameItemLabel.snp.makeConstraints { make in
            make.top.bottom.equalTo(contentView)
            make.leading.trailing.equalTo(contentView).inset(20)
        }
        
        completeButton.snp.makeConstraints { make in
            make.trailing.equalTo(contentView).inset(20)
            make.centerY.equalTo(contentView)
        }
    }
}


