import React from "react";
import {
  View,
  Text,
  TouchableOpacity,
  Image,
  AsyncStorage,Platform
} from "react-native";
import Assets from "../assets";
import EDThemeButton from "../components/EDThemeButton";
import { showNotImplementedAlert } from "../utils/CMAlert";
import EDSkipButton from "../components/EDSkipButton";
import LoginContainer from "./LoginContainer";
import { PermissionsAndroid } from "react-native";
import { getUserToken } from "../utils/AsyncStorageHelper";
import { StackActions, NavigationActions } from "react-navigation";
import { Messages } from "../utils/Messages";

export default class SplashContainer extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {

    getUserToken(success => {}, failure => {});
  }

  
  async componentWillMount() {
    if(Platform.OS == "ios") {
      return
    }
    await requestLocationPermission();
  }

  render() {
    return (
      <View style={{ flex: 1 }}>
        <Image
          source={Assets.bgHome}
          style={{
            flex: 1,
            justifyContent: "center",
            alignItems: "center",
            width: "100%",
            height: "100%"
          }}
        />
        <View
          style={{
            position: "absolute",
            width: "100%",
            height: "100%"
          }}
        >
          <View style={{ flex: 7 }} />
          <View
            style={{
              flex: 3,
              justifyContent: "center",
              alignItems: "center"
            }}
          >
            <EDThemeButton
              onPress={() => {
                this._onPressSignIn();
              }}
              label="SIGN IN"
            />
            <EDSkipButton
              onPress={() => {
                this._onPressSkip();
              }}
              label="SKIP"
            />
            <TouchableOpacity
            onPress={() => {
              this._onPressSignUp();
            }}
            >
            <Text
              style={{ color: "white", fontSize: 16,marginTop:10, }}
              
            >
              Don't have an account? SIGN UP
            </Text>
            </TouchableOpacity>
          </View>
        </View>
      </View>
    );
  }

  _onPressSignIn = () => {
    this.props.navigation.navigate("LoginContainer");
  }
  _onPressSkip() {
    // this.props.navigation.navigate("MainContainer");

    this.props.navigation.dispatch(
      StackActions.reset({
        index: 0,
        routeName: "MainContainer",
        actions: [NavigationActions.navigate({ routeName: "MainContainer" })]
      })
    );
  }
  _onPressSignUp(){
    this.props.navigation.navigate("SignupContainer");
  }
}

export async function requestLocationPermission() {
  try {
    const granted = await PermissionsAndroid.request(
      PermissionsAndroid.PERMISSIONS.ACCESS_FINE_LOCATION,
      {
        title: "Eatance",
        message: "Eatance App access to your location "
      }
    );
    if (granted === PermissionsAndroid.RESULTS.GRANTED) {
    } else {
    }
  } catch (err) {
    console.warn(err);
  }
}
