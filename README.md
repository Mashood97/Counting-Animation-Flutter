
=======

1) First goto your pubspec.yaml file and add dependency:
   ```
   counting_animation:
   ```
2) run flutter pub get to update the packages dependencies.

3) In your code, you can use it like this:
  first import the package:
  ```
 import 'package:counting_animation/counting_animation.dart';
  ```

then use it like this in your code:
  ```

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Counting Animation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'A simple counting animation',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            CountingAnimation(
              beginValue: 0.0,
              endValue: 50.35,
              smallValueStyle: TextStyle(color: Colors.red, fontSize: 24.0),
              largeValueStyle: TextStyle(color: Colors.red, fontSize: 18.0),
              prefix: '%',
              suffix: '%',
            ),
          ],
        ),
      ),
    );
  }
}

```
This will count the value from 0.0 to 50.35 with animation, By default the animation curve is set to Curves.linear and duration is set to 250 milliseconds, you can change it according to your needs by adding these properties:
```
curve: Curves.decelerate,
duration: Duration(seconds: 500),

```

#SUPPORT
You liked this package? then give it a star. If you want to help then:
Star this repository.
Send a Pull Request with new features, see Contribution Guidelines.
Share this package.
Create issues if you find a Bug or want to suggest something.
