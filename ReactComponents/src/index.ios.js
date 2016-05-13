var React = require('react-native');

var {
  Text,
  View
} = React;

var styles = React.StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: 'red'
  }
});

class SimpleApp extends React.Component {
  render() {
    return <View style={styles.container}>
        <Text>Hello Integeration Pattern.</Text>
      </View>;
  }
}

React.AppRegistry.registerComponent('SimpleApp', () => SimpleApp);
