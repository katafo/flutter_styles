# flutter_styles

Example how to manage your app styles with Bloc.

## Getting Started

1. Create interface named AppStyles, and define all styles you need for your app in here:

```
abstract class AppStyles {
  TextStyle getTitleStyle();
}
```

2. Each app style will extends from AppStyles interface. So it will required you override all method of AppStyles.

```
class DefaultStyles implements AppStyles {

  @override
  TextStyle getTitleStyle() {
    return TextStyle(
      color: Colors.red,
      fontSize: 14
    );
  }

}

class SpecialStyles implements AppStyles {

  @override
  TextStyle getTitleStyle() {
    return TextStyle(
      color: Colors.blue,
      fontSize: 17
    );
  }

}
```

Use interface to ensure all styles you define have the same config.

3. Then create AppCubit which wrap your MaterialApp. So that, you can call your style anywhere in app.
Ex: _appCubit.styles.getTitleStyle()
