//
//  Colors.swift
//  RandomProfileApp
//
//  Created by Stepan Kirillov on 1/13/22.
//

import UIKit

let darkThemeBackgroundColor = UIColor(red: 0.113, green: 0.125, blue: 0.129, alpha: 1)
let lightThemeBackgroundColor = UIColor(red: 0.984, green: 0.941, blue: 0.778, alpha: 1)
let adaptiveBackgroundColor = UIColor { tc in
	switch tc.userInterfaceStyle {
	case .dark:
		return (darkThemeBackgroundColor)
	default:
		return (lightThemeBackgroundColor)
	}
}

let darkThemeTintColorYellow = UIColor(red: 240 / 256, green: 225 / 256, blue: 154 / 256, alpha: 1)
let lightThemeTintColorPurple = UIColor(red: 82 / 256, green: 15 / 256, blue: 45 / 256, alpha: 1)
let adaptiveTintColor = UIColor { tc in
	switch tc.userInterfaceStyle {
	case .dark:
		return (darkThemeTintColorYellow)
	default:
		return (lightThemeTintColorPurple)
	}
}

let darkThemeNavigationBarColor = UIColor(red: 32 / 256, green: 32 / 256, blue: 32 / 256, alpha: 1)
let lightThemeNavigationBarColor = UIColor(red: 237 / 256, green: 225 / 256, blue: 173 / 256, alpha: 1)
let adaptiveNavigationBarColor = UIColor { tc in
	switch tc.userInterfaceStyle {
	case .dark:
		return (darkThemeNavigationBarColor)
	default:
		return (lightThemeNavigationBarColor)
	}
}

let adaptivePictureCircleColor = UIColor { tc in
	switch tc.userInterfaceStyle {
	case .dark:
		return (darkThemeIconsYellow)
	default:
		return (lightThemeIconsPurple)
	}
}

let darkThemeIconsYellow = UIColor(red: 250 / 256, green: 209 / 256, blue: 10 / 256, alpha: 1)
let lightThemeIconsPurple = UIColor(red: 102 / 256, green: 25 / 256, blue: 60 / 256, alpha: 1)
let adaptiveIconsColor = UIColor { tc in
	switch tc.userInterfaceStyle {
	case .dark:
		return (darkThemeIconsYellow)
	default:
		return (lightThemeIconsPurple)
	}
}

let adaptiveBarButtonColor = UIColor { tc in
	switch tc.userInterfaceStyle {
	case .dark:
		return (darkThemeIconsYellow)
	default:
		return (lightThemeIconsPurple)
	}
}

