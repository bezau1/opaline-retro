import UIKit

/// Split from `ThemeManager` itself to keep that class under SwiftLint's
/// `type_body_length` limit — these are the retro palette's color values,
/// grouped by the surface they paint.
extension ThemeManager {
    func rebuildSurfaceColors(dark: Bool) {
        background = dark
            ? UIColor(red: 0.086, green: 0.075, blue: 0.051, alpha: 1)
            : UIColor(red: 0.949, green: 0.937, blue: 0.894, alpha: 1)
        surface = dark
            ? UIColor(red: 0.129, green: 0.110, blue: 0.075, alpha: 1)
            : .white
        primaryText = dark
            ? UIColor(red: 0.945, green: 0.933, blue: 0.878, alpha: 1)
            : UIColor(red: 0.102, green: 0.102, blue: 0.102, alpha: 1)
        secondaryText = dark
            ? UIColor(red: 0.655, green: 0.612, blue: 0.486, alpha: 1)
            : UIColor(red: 0.42, green: 0.404, blue: 0.353, alpha: 1)
        separator = dark
            ? UIColor(red: 0.212, green: 0.173, blue: 0.110, alpha: 1)
            : UIColor(red: 0.847, green: 0.835, blue: 0.761, alpha: 1)
    }

    func rebuildAccentColors(dark: Bool) {
        accent = dark
            ? UIColor(red: 0.878, green: 0.137, blue: 0.102, alpha: 1)
            : UIColor(red: 0.8, green: 0.094, blue: 0.118, alpha: 1)
        durationBackground = UIColor.black.withAlphaComponent(0.8)
        liveBadgeBackground = UIColor(red: 0.8, green: 0.094, blue: 0.118, alpha: 0.9)
        thumbnailPlaceholder = dark
            ? UIColor(red: 0.141, green: 0.118, blue: 0.078, alpha: 1)
            : UIColor(red: 0.894, green: 0.875, blue: 0.788, alpha: 1)
        // Gold rather than blue — ties the "new" indicator to the retro
        // gold/red duo instead of the old neutral-theme accent.
        newContentDot = dark
            ? UIColor(red: 0.957, green: 0.741, blue: 0.302, alpha: 1)
            : UIColor(red: 0.827, green: 0.6, blue: 0.145, alpha: 1)
    }

    func rebuildSkeletonColors(dark: Bool) {
        skeletonBase = dark
            ? UIColor(red: 0.141, green: 0.118, blue: 0.078, alpha: 1)
            : UIColor(red: 0.894, green: 0.875, blue: 0.788, alpha: 1)
        skeletonShimmer = dark
            ? UIColor(red: 0.212, green: 0.176, blue: 0.110, alpha: 1)
            : UIColor(red: 0.827, green: 0.8, blue: 0.682, alpha: 1)
        skeletonBlock = dark
            ? UIColor(red: 0.173, green: 0.145, blue: 0.090, alpha: 1)
            : UIColor(red: 0.855, green: 0.831, blue: 0.737, alpha: 1)
    }
}
