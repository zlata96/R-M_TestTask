// SectionHeader.swift
// R&M_TestTask. Created by Zlata Guseva.

import UIKit

// MARK: - SectionHeader

class SectionHeader: UICollectionReusableView {
    private lazy var sectionNameLabel: UILabel = {
        let label = UILabel()
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
        translatesAutoresizingMaskIntoConstraints = false
    }

    private func addSubviews() {
        addSubview(sectionNameLabel)
    }

    private func makeConstraints() {
        NSLayoutConstraint.activate([
            sectionNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 24),
            sectionNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            sectionNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
}

extension SectionHeader {
    func configure(title: String, font: UIFont = .text1SB) {
        sectionNameLabel.text = title
        sectionNameLabel.font = font
    }
}
