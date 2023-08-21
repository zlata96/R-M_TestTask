// MainDetailsViewCell.swift
// R&M_TestTask. Created by Zlata Guseva.

import UIKit

// MARK: - MainDetailsViewCell

class MainDetailsViewCell: UICollectionViewCell {
    private let imageManager = ImageManager()

    private lazy var characterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .red
        imageView.layer.cornerRadius = 16
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()

    private lazy var characterNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .text2B
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textAlignment = .center
        return label
    }()

    private lazy var characterLifeStatusLabel: UILabel = {
        let label = UILabel()
        label.textColor = .accentTitle
        label.font = .text1M
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textAlignment = .center
        return label
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
        backgroundColor = .mainBackground
        translatesAutoresizingMaskIntoConstraints = false
    }

    private func addSubviews() {
        addSubview(characterImageView)
        addSubview(characterNameLabel)
        addSubview(characterLifeStatusLabel)
    }

    private func makeConstraints() {
        NSLayoutConstraint.activate([
            characterImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            characterImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            characterImageView.heightAnchor.constraint(equalToConstant: 148),
            characterImageView.widthAnchor.constraint(equalToConstant: 148),

            characterNameLabel.topAnchor.constraint(equalTo: characterImageView.bottomAnchor, constant: 20),
            characterNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            characterNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            characterNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

            characterLifeStatusLabel.topAnchor.constraint(equalTo: characterNameLabel.bottomAnchor, constant: 8),
            characterLifeStatusLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            characterLifeStatusLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            characterLifeStatusLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            characterLifeStatusLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

extension MainDetailsViewCell {
    func configure(viewModel: MainDetailsViewCellModel) {
        characterNameLabel.text = viewModel.name
        characterLifeStatusLabel.text = viewModel.lifeStatus
        imageManager.setupImage(imageURL: viewModel.imageURL, imageView: characterImageView)
    }
}
