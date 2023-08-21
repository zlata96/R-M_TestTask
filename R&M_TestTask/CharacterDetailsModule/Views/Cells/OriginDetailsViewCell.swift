// OriginDetailsViewCell.swift
// R&M_TestTask. Created by Zlata Guseva.

import UIKit

// MARK: - OriginDetailsViewCell

class OriginDetailsViewCell: UICollectionViewCell {
    private lazy var originNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .text1SB
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textAlignment = .left
        return label
    }()

    private lazy var originTypeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .accentTitle
        label.font = .text2M
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textAlignment = .left
        return label
    }()

    private lazy var originImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .imageBackgrounnd
        imageView.layer.cornerRadius = 10
        imageView.contentMode = .center
        imageView.image = UIImage(named: "planet")
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func commonInit() {
        addSubviews()
        makeConstraints()
        setupStyle()
    }

    private func setupStyle() {
        layer.cornerRadius = 16
        backgroundColor = .grayBackground
        translatesAutoresizingMaskIntoConstraints = false
    }

    private func addSubviews() {
        addSubview(originImageView)
        addSubview(originNameLabel)
        addSubview(originTypeLabel)
    }

    private func makeConstraints() {
        NSLayoutConstraint.activate([
            originImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            originImageView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            originImageView.heightAnchor.constraint(equalToConstant: 64),
            originImageView.widthAnchor.constraint(equalToConstant: 64),

            originNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            originNameLabel.leadingAnchor.constraint(equalTo: originImageView.trailingAnchor, constant: 16),
            originNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),

            originTypeLabel.leadingAnchor.constraint(equalTo: originImageView.trailingAnchor, constant: 16),
            originTypeLabel.topAnchor.constraint(equalTo: originNameLabel.bottomAnchor, constant: 8),
            originTypeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }
}

extension OriginDetailsViewCell {
    func configure(viewModel: OriginModel) {
        originNameLabel.text = viewModel.name
        originTypeLabel.text = "Planet"
    }
}
