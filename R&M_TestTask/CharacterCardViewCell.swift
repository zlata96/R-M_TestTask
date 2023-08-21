// CharacterCardViewCell.swift
// R&M_TestTask. Created by Zlata Guseva.

import UIKit

// MARK: - CharacterCardViewCell

class CharacterCardViewCell: UICollectionViewCell {
    lazy var characterNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .text1SB
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textAlignment = .center
        label.text = "dfhjsflhuslur"
        return label
    }()

    let characterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "crossIcon") ?? UIImage()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .red
        imageView.layer.cornerRadius = 10
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
        layer.cornerRadius = 12
        backgroundColor = .grayBackground
    }

    private func addSubviews() {
        addSubview(characterImageView)
        addSubview(characterNameLabel)
    }

    private func makeConstraints() {
        characterImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        characterImageView.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        characterImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
        characterImageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2 - 56).isActive = true

        characterNameLabel.topAnchor.constraint(equalTo: characterImageView.bottomAnchor, constant: 16).isActive = true
        characterNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16).isActive = true
        characterNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        characterNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
        characterNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
}

// MARK: Configure

extension CharacterCardViewCell {
    func configuration(characterModel: CharacterModel) {
        characterNameLabel.text = characterModel.name
        // characterImageView.image = characterModel.image
    }
}

// MARK: - CharacterModel
