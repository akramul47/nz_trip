# NZ Trip - Flutter Flight Booking App

## Project Overview
A Flutter flight booking application targeting multi-platform (Android, iOS, Web, Windows, Linux, macOS). The app uses a travel/aviation theme with flight search, booking forms, and promotional content.

## Architecture

### State Management & Routing
- **Riverpod** (`flutter_riverpod`) for state management - wrap root widget in `ProviderScope`
- **GoRouter** (`go_router`) for declarative routing - defined in [lib/config/routes.dart](lib/config/routes.dart)
- Navigation uses `context.go('/path')` for replacement, `context.push('/path')` for stacking

### Project Structure
```
lib/
├── main.dart           # App entry with ProviderScope + MaterialApp.router
├── config/
│   ├── routes.dart     # GoRouter configuration (all app routes)
│   └── theme.dart      # AppColors + AppTheme.lightTheme
├── screens/            # Full-page screens (splash, home, login, flight_results)
├── widgets/            # Reusable UI components
├── providers/          # Riverpod providers (currently empty - add state here)
└── utils/              # Helpers (transitions, etc.)
```

### Theming Pattern
Use centralized theme from [lib/config/theme.dart](lib/config/theme.dart):
- Access colors via `AppColors.primary`, `AppColors.secondary`, etc.
- Apply theme via `AppTheme.lightTheme` in MaterialApp
- Custom font: `AlibabaSans` (configured in theme, loaded from assets/fonts/)

## Code Conventions

### Widget Structure
- Use `const` constructors when possible: `const MyWidget({super.key})`
- StatefulWidgets: dispose controllers in `dispose()` method
- Use `mounted` check before navigation after async operations:
  ```dart
  if (mounted) {
    context.go('/home');
  }
  ```

### UI Patterns
- **SVG icons**: Use `flutter_svg` with `SvgPicture.asset('assets/images/icon.svg')`
- **PNG images**: Use `Image.asset('assets/images/image.png')`
- **Responsive sizing**: Use `MediaQuery.of(context).size` for screen-relative dimensions
- **Decorations**: Prefer `BoxDecoration` with `borderRadius` and `boxShadow` for cards

### Screen Layout Pattern
Screens typically follow this structure:
1. `Scaffold` with custom body (no AppBar - custom headers instead)
2. Header with `Container` + `BoxDecoration` for rounded corners
3. `SafeArea` for content within colored headers
4. `CustomBottomNavBar` widget for navigation

## Assets
- Images: `assets/images/` (PNG for rasters, SVG for icons)
- Fonts: `assets/fonts/` (AlibabaSans family)
- All assets declared in [pubspec.yaml](pubspec.yaml) under `flutter.assets`

## Commands
```bash
flutter pub get          # Install dependencies
flutter run              # Run on connected device
flutter build apk        # Build Android APK
flutter analyze          # Run static analysis
```

## Key Dependencies
| Package | Purpose |
|---------|---------|
| `flutter_riverpod` | State management |
| `go_router` | Navigation/routing |
| `flutter_svg` | SVG rendering |
| `google_fonts` | Web fonts (available but using custom AlibabaSans) |
| `card_swiper` | Promotional banner carousel |
| `flutter_native_splash` | Native splash screen generation |

## Adding New Features

### New Screen
1. Create in `lib/screens/new_screen.dart`
2. Add route in [lib/config/routes.dart](lib/config/routes.dart)
3. Navigate via `context.go('/new-route')` or `context.push('/new-route')`

### New Provider (State)
1. Create in `lib/providers/` using Riverpod patterns
2. Access via `ref.watch(myProvider)` in ConsumerWidget or `ref.read()` for actions

### New Reusable Widget
1. Create in `lib/widgets/`
2. Use `const` constructor, accept callbacks for actions
3. Import theme: `import '../config/theme.dart'`
