# flutter_styles

Example how to manage your app styles with Bloc.

## Getting Started

**1. Create interface named AppStyles, and define all styles you need for your app in here:**
```dart
abstract class AppStyles {
  ThemeData getThemeData();
}
```

**2. Each app style will extends from AppStyles interface. So it will required you override all method of AppStyles.**
```dart
class DefaultStyles implements AppStyles {

  @override
  ThemeData getThemeData() {
    return ThemeData(
        fontFamily: AppFonts.openSans,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: AppColors.grey,
        primaryColor: AppColors.white,
        brightness: Brightness.light,
        backgroundColor: AppColors.white  ,
        scaffoldBackgroundColor:AppColors.white);
  }
}
class DarkStyles implements AppStyles {
  @override
  ThemeData getThemeData() {
    return ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      primarySwatch: AppColors.grey,
      primaryColor: AppColors.satinDepBlack,
      brightness: Brightness.dark,
      backgroundColor: AppColors.closeShutter,
      scaffoldBackgroundColor: AppColors.closeShutter,
    );
  }
}
```

Use interface to ensure all styles you define have the same config.

**3. Then create AppCubit which wrap your MaterialApp. So that, you can call your style anywhere in app.**
## For example: 
```dart
_appCubit.styles.getThemeData()
```
