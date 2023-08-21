// CharacterViewCell.swift
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
        return label
    }()

    let characterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "crossIcon") ?? UIImage()
        imageView.translatesAutoresizingMaskIntoConstraints = false
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
        addSubview(skillNameLabel)
        switch cellState {
        case .editing:
            addSubview(deleteImageView)
        default:
            break
        }
    }

    private func makeConstraints() {
        skillNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        skillNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        skillNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
        switch cellState {
        case .editing:
            skillNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -48).isActive = true

            deleteImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
            deleteImageView.leadingAnchor.constraint(equalTo: skillNameLabel.trailingAnchor, constant: 10).isActive = true
            deleteImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = true
            deleteImageView.heightAnchor.constraint(equalToConstant: 14).isActive = true
            deleteImageView.widthAnchor.constraint(equalToConstant: 14).isActive = true

        case .regular:
            skillNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = true
        }
    }

    private func changeSubviews() {
        switch cellState {
        case .editing:
            addSubview(deleteImageView)
        case .regular:
            deleteImageView.removeFromSuperview()
        }
    }
}

// MARK: Configure

extension SkillCell {
    func configuration(text: String) {
        skillNameLabel.text = text
    }
}
