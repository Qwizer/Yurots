import React from "react";
import {
  View,
  Text,
  Image,
  KeyboardAvoidingView,
  Platform
} from "react-native";
import { connect } from "react-redux";
import Assets from "../assets";
import EDThemeButton from "../components/EDThemeButton";
import { showValidationAlert } from "../utils/CMAlert";
import EditText from "../components/EditText";
import EDTextView from "../components/EDTextView";
import { apiPost } from "../api/ServiceManager";
import firebase from "react-native-firebase";
import { REGISTRATION_URL, RESPONSE_SUCCESS } from "../utils/Constants";
import ProgressLoader from "../components/ProgressLoader";
import { Messages } from "../utils/Messages";
import ETextErrorMessage from "../components/ETextErrorMessage";
import { ETFonts } from "../assets/FontConstants";
import { NativeModules } from "react-native";
import { netStatus } from "../utils/NetworkStatusConnection";
import metrics from "../utils/metrics";


class SignupContainer extends React.Component {
  state = {
    isFullNameCorrect: true,
    isPhoneCorrect: true,
    isPasswordCorrect: true,
    strFullName: "",
    strPhone: "",
    strPassword: "",
    isLoading: false,
    firebaseToken: "",
    fullNameError: "",
    phoneError: "",
    passwordError: ""
  };

  constructor(props) {
    super(props);
  }

  async componentDidMount() {
    this.checkPermission();
  }

  authenticateUser() {
    netStatus(status => {
      if (status) {
        this.setState({ isLoading: true });
        apiPost(
          REGISTRATION_URL,
          {
            FirstName: this.state.strFullName,
            PhoneNumber: this.state.strPhone,
            Password: this.state.strPassword,
            firebase_token: this.state.firebaseToken,
            phone_code: this.props.code
          },
          resp => {
            this.setState({ isLoading: false });
            if (resp != undefined) {
              if (resp.status == RESPONSE_SUCCESS) {
                this.props.navigation.navigate("OTPContainer", {
                  phNo: this.state.strPhone,
                  password: this.state.strPassword
                });
              } else {
                showValidationAlert(resp.message);
              }
            } else {
              showValidationAlert(Messages.generalWebServiceError);
            }
          },
          err => {
            this.setState({ isLoading: false });
            console.log(err);
            showValidationAlert(Messages.internetConnnection);
          }
        );
      } else {
        showValidationAlert(Messages.internetConnnection);
      }
    });
  }

  async checkPermission() {
    const enabled = await firebase.messaging().hasPermission();
    if (enabled) {
      this.getToken();
    } else {
      this.requestPermission();
    }
  }

  //3
  async getToken() {
    fcmToken = await firebase.messaging().getToken();
    this.setState({ firebaseToken: fcmToken });
  }

  //2
  async requestPermission() {
    try {
      await firebase.messaging().requestPermission();

      this.getToken();
    } catch (error) {
      // User has rejected permissions
    }
  }

  render() {
    return (
      //behavior="padding" enabled
      <KeyboardAvoidingView
        behavior="padding"
        enabled
        contentContainerStyle={{ flex: 1 }}
        style={{ flex: 1, backgroundColor: "#fff" }}
      >
        
        <View
          style={{
            flex: 1
          }}
        >
          
{this.state.isLoading ? <ProgressLoader /> : null}
          <View
            style={{
              flex: 1,
              position: "absolute",
              width: "100%",
              height: "100%"
            }}
          >
            <Image
              source={Assets.bgSignup}
              style={{
                flex: 2,
                width: "100%"
              }}
            />

            <View style={{ flex: 3 }} />
          </View>

          <View
            style={{
              flex: 1,
              position: "absolute",
              width: "100%",
              height: "100%"
            }}
          >
            <View
              style={{
                marginBottom: -15,
                flex: 2,
                justifyContent: "center",
                marginTop: metrics.statusbarHeight,
                alignItems: "center",
              }}
            >
              <Image
                style={{ width: "40%", height: "50%", resizeMode: "contain" }}
                source={Assets.logo}
              />
              <Text
                style={{
                  color: "#fff",
                  fontFamily: ETFonts.satisfy,
                  fontSize: 40
                }}
              >
                {Messages.signupMsg}
              </Text>
            </View>
            <View
              style={{
                flex: 4,
                marginLeft: 25,
                marginRight: 25,
                marginBottom: 30
              }}
            >
              
              <EDTextView text="Name" />
              <EditText
              styles = {{elevation: this.state.isLoading ? 0 : 8}}
                keyboardType="default"
                onChangeText={newText => {
                  this.state.strFullName = newText;
                }}
              />
              <ETextErrorMessage
                errorStyle={{ marginTop: 3 }}
                errorMsg={this.state.fullNameError}
              />
              <EDTextView text="Phone Number" />
              <EditText
              styles = {{elevation: this.state.isLoading ? 0 : 8}}
                keyboardType="phone-pad"
                secureTextEntry={false}
                // isCode={true}
                // codeLabel={this.props.code}
                maxLength={15}
                value={this.state.strPhone}
                onChangeText={text => {
                  var newText = text.replace(/[^0-9]/g, "");
                  this.setState({ strPhone: newText });
                }}
              />
              <ETextErrorMessage
                errorStyle={{ marginTop: 3 }}
                errorMsg={this.state.phoneError}
              />
              <EDTextView text="Password" />
              <EditText
              styles = {{elevation: this.state.isLoading ? 0 : 8}}
                keyboardType="default"
                secureTextEntry={true}
                onChangeText={newText => {
                  this.state.strPassword = newText;
                }}
              />
              <ETextErrorMessage
                errorStyle={{ marginTop: 3 }}
                errorMsg={this.state.passwordError}
              />
              <View style={{ alignItems: "center", marginTop: 5 }}>
                <EDThemeButton
                  onPress={() => {
                    this._onPressSignUp();
                  }}
                  label="SIGN UP"
                />
                <Text
                  style={{
                    marginTop: 8,
                    marginBottom: 10,
                    color: "black",
                    fontSize: 16
                  }}
                  onPress={() => {
                    this._onPressLogIn();
                  }}
                >
                  Already have an account? LOGIN
                </Text>
              </View> 
              
            </View>
          </View>
        </View>
      </KeyboardAvoidingView>
    );
  }

  _onPressSignUp() {
    if (this.validate()) {
      this.authenticateUser();
    }
  }

  validate() {
    let reg = /^(?=.*[0-9])(?=.*[A-Z])(?=.*[a-z])(?=.*[#?!@$%^&*-]).{6,15}$/;
    if (this.state.strFullName.trim().length == 0) {
      this.setState({
        fullNameError: Messages.emptyName,
        phoneError: "",
        passwordError: ""
      });
      return false;
    } else if (this.state.strPhone.trim().length == 0) {
      this.setState({
        fullNameError: "",
        phoneError: Messages.emptyPhone,
        passwordError: ""
      });
      return false;
    }else if (this.state.strPhone.trim().indexOf(0) ==  0) {
      this.setState({
        fullNameError: "",
        phoneError: Messages.phoneValidationIssueString,
        passwordError: ""
      });
      return false;
    } else if (this.state.strPhone.trim().length < 9) {
      this.setState({
        fullNameError: "",
        phoneError: Messages.phoneValidationString,
        passwordError: ""
      });
      return false;
    } else if (this.state.strPassword.trim().length == 0) {
      this.setState({
        fullNameError: "",
        phoneError: "",
        passwordError: Messages.emptyPassword
      });
      return false;
    } else if (reg.test(this.state.strPassword.trim()) === false) {
      this.setState({
        fullNameError: "",
        phoneError: "",
        passwordError: Messages.passwordValidationString
      });
      return false;
    }
    this.setState({
      fullNameError: "",
      phoneError: "",
      passwordError: ""
    });
    return true;
  }

  _onPressLogIn() {
    this.props.navigation.goBack();
  }
}

export default connect(
  state => {
    return {
      code: state.userOperations.code,
    };
  },
  dispatch => {
    return {};
  }
)(SignupContainer);
