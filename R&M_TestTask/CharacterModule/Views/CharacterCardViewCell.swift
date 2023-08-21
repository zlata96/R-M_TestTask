// CharacterCardViewCell.swift
// R&M_TestTask. Created by Zlata Guseva.

import UIKit

// MARK: - CharacterCardViewCell

class CharacterCardViewCell: UICollectionViewCell {
    private let imageManager = ImageManager()

    private lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = .white
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicator
    }()

    private lazy var characterNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .text1SB
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textAlignment = .center
        return label
    }()

    private lazy var characterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .clear
        imageView.layer.cornerRadius = 10
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
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
        activityIndicator.startAnimating()
    }

    private func setupStyle() {
        layer.cornerRadius = 12
        backgroundColor = .grayBackground
        translatesAutoresizingMaskIntoConstraints = false
    }

    private func addSubviews() {
        addSubview(characterImageView)
        addSubview(characterNameLabel)
        addSubview(activityIndicator)
    }

    private func makeConstraints() {
        NSLayoutConstraint.activate([
            characterImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            characterImageView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            characterImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            characterImageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2 - 56),

            characterNameLabel.topAnchor.constraint(equalTo: characterImageView.bottomAnchor, constant: 16),
            characterNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            characterNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            characterNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            characterNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}

// MARK: Configure

extension CharacterCardViewCell {
    func configuration(characterModel: CharacterCardViewCellModel) {
        characterNameLabel.text = characterModel.name
        DispatchQueue.main.async { [weak self] in
            self?.imageManager.setupImage(
                imageURL: characterModel.imageURL,
                imageView: self?.characterImageView ?? UIImageView()
            )
            self?.activityIndicator.stopAnimating()
            self?.activityIndicator.removeFromSuperview()
        }
    }
}
