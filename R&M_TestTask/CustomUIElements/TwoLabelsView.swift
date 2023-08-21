// TwoLabelsView.swift
// R&M_TestTask. Created by Zlata Guseva.

import UIKit

// MARK: - TwoLabelsView

class TwoLabelsView: UIView {
    private let leftLabel: UILabel = {
        let label = UILabel()
        label.textColor = .subtitle
        label.font = .text1M
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let rightLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .text1M
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
        backgroundColor = .grayBackground
    }

    private func addSubviews() {
        addSubview(leftLabel)
        addSubview(rightLabel)
    }

    private func makeConstraints() {
        NSLayoutConstraint.activate([
            leftLabel.topAnchor.constraint(equalTo: topAnchor),
            leftLabel.leadingAnchor.constraint(equalTo: leadingAnchor),

            rightLabel.topAnchor.constraint(equalTo: topAnchor),
            rightLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}

extension TwoLabelsView {
    func configure(leftTitle: String, rightTitle: String) {
        leftLabel.text = leftTitle
        rightLabel.text = rightTitle.isEmpty ? "None" : rightTitle
    }
}
