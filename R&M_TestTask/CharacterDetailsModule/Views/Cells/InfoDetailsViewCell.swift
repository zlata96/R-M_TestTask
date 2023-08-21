// InfoDetailsViewCell.swift
// R&M_TestTask. Created by Zlata Guseva.

import UIKit

// MARK: - InfoDetailsViewCell

class InfoDetailsViewCell: UICollectionViewCell {
    let speciesLabels: TwoLabelsView = {
        let labels = TwoLabelsView()
        labels.translatesAutoresizingMaskIntoConstraints = false
        return labels
    }()

    let typeLabels: TwoLabelsView = {
        let labels = TwoLabelsView()
        labels.translatesAutoresizingMaskIntoConstraints = false
        return labels
    }()

    let genderLabels: TwoLabelsView = {
        let labels = TwoLabelsView()
        labels.translatesAutoresizingMaskIntoConstraints = false
        return labels
    }()

    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.distribution = .fillProportionally
        stackView.alignment = .fill
        return stackView
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
        addSubview(stackView)
        stackView.addArrangedSubview(speciesLabels)
        stackView.addArrangedSubview(typeLabels)
        stackView.addArrangedSubview(genderLabels)
    }

    private func makeConstraints() {
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
        ])
    }
}

extension InfoDetailsViewCell {
    func configure(viewModel: CharacterModel) {
        speciesLabels.configure(leftTitle: "Species", rightTitle: viewModel.species)
        typeLabels.configure(leftTitle: "Type", rightTitle: viewModel.type)
        genderLabels.configure(leftTitle: "Gender", rightTitle: viewModel.gender.rawValue)
    }
}
