import UIKit

/// The classic "You[Tube]" wordmark, redrawn as two labels rather than a
/// bitmap asset so it repaints live with the retro theme's colors. Used as
/// the Home tab's `navigationItem.titleView`.
final class RetroLogoView: UIView {
    private let youLabel = UILabel()
    private let tubeWrap = UIView()
    private let tubeLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        let stack = buildStack()
        addSubview(stack)
        NSLayoutConstraint.activate([
            stack.leadingAnchor.constraint(equalTo: leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: trailingAnchor),
            stack.topAnchor.constraint(equalTo: topAnchor),
            stack.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(applyTheme),
            name: ThemeManager.didChangeNotification,
            object: nil
        )
        applyTheme()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func buildStack() -> UIStackView {
        youLabel.text = "You"
        youLabel.font = RetroFont.headline(20, weight: .heavy)

        tubeLabel.text = "Tube"
        tubeLabel.font = RetroFont.headline(20, weight: .heavy)
        tubeLabel.textColor = .white
        tubeLabel.translatesAutoresizingMaskIntoConstraints = false

        tubeWrap.layer.cornerRadius = 6
        tubeWrap.addSubview(tubeLabel)
        NSLayoutConstraint.activate([
            tubeLabel.leadingAnchor.constraint(equalTo: tubeWrap.leadingAnchor, constant: 6),
            tubeLabel.trailingAnchor.constraint(equalTo: tubeWrap.trailingAnchor, constant: -6),
            tubeLabel.topAnchor.constraint(equalTo: tubeWrap.topAnchor, constant: 2),
            tubeLabel.bottomAnchor.constraint(equalTo: tubeWrap.bottomAnchor, constant: -2)
        ])

        let stack = UIStackView(arrangedSubviews: [youLabel, tubeWrap])
        stack.axis = .horizontal
        stack.spacing = 3
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }

    @objc
    private func applyTheme() {
        let theme = ThemeManager.shared
        youLabel.textColor = theme.primaryText
        tubeWrap.backgroundColor = theme.accent
    }
}
