import UIKit

/// Chunky rounded system font used for retro-theme headlines (logo,
/// video titles, section headers) — no bundled font file, just the
/// system "rounded" design where available.
enum RetroFont {
    static func headline(_ size: CGFloat, weight: UIFont.Weight = .bold) -> UIFont {
        let base = UIFont.systemFont(ofSize: size, weight: weight)
        guard #available(iOS 13.0, *),
              let rounded = base.fontDescriptor.withDesign(.rounded) else {
            return base
        }
        return UIFont(descriptor: rounded, size: size)
    }
}
