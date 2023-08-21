// CharacterSectionHeader.swift
// R&M_TestTask. Created by Zlata Guseva.

import UIKit

// MARK: - SectionHeader

class CharacterSectionHeader: UICollectionReusableView {
    static let reuseIdentifier = "CharacterSectionHeader"

    private var sectionNameLabel: UILabel = {
        let label = UILabel()
        label.font = .text1B
        label.text = "Characters"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
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
        setupStyle()
        addSubviews()
        makeConstraints()
    }

    private func setupStyle() {
        backgroundColor = .mainBackground
    }

    private func addSubviews() {
        addSubview(sectionNameLabel)
    }

    private func makeConstraints() {
        sectionNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        sectionNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        sectionNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20).isActive = true
    }
}
