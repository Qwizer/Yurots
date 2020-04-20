import React from "react";
import { View, TextInput, Image, ScrollView } from "react-native";
import BaseContainer from "./BaseContainer";
import Assets from "../assets";
import { EDColors } from "../assets/Colors";
import { RESPONSE_SUCCESS, RESET_PASSWORD_REQ_URL } from "../utils/Constants";
import { getUserToken } from "../utils/AsyncStorageHelper";
import { apiPost } from "../api/ServiceManager";
import ProgressLoader from "../components/ProgressLoader";
import { showValidationAlert, showDialogue } from "../utils/CMAlert";
import { ETFonts } from "../assets/FontConstants";
import { Messages } from "../utils/Messages";
import ETextErrorMessage from "../components/ETextErrorMessage";
import { netStatus } from "../utils/NetworkStatusConnection";

export default class ChangePasswordContainer extends React.PureComponent {
  constructor(props) {
    super(props);

    this.state = {
      isLoading: false,
      oldPassword: "",
      newPassword: "",
      cnfPassword: "",
      oldPasswordError: "",
      newPasswordError: "",
      cnfPasswordError: ""
    };
  }

  componentDidMount() {
    getUserToken(
      success => {
        userObj = success;
        this.setState({
          firstName: userObj.first_name,
          PhoneNumber: userObj.PhoneNumber
        });
      },
      failure => {}
    );
  }

  checkPassword() {
    if (this.validatePassword()) {
      this.setState({ isLoading: true });
      this.changePassword();
    }
  }

  validatePassword() {
    let reg = /^(?=.*[0-9])(?=.*[A-Z])(?=.*[a-z])(?=.*[#?!@$%^&*-]).{6,15}$/;

    if (this.state.oldPassword === "") {
      this.setState({
        oldPasswordError: Messages.oldPasswordMsg,
        newPasswordError: "",
        cnfPasswordError: ""
      });
      return false;
    } else if (this.state.newPassword === "") {
      this.setState({
        oldPasswordError: "",
        newPasswordError: Messages.NewPasswordMsg,
        cnfPasswordError: ""
      });
      return false;
    } else if (reg.test(this.state.newPassword) === false) {
      this.setState({
        oldPasswordError: "",
        newPasswordError: Messages.passwordValidationString,
        cnfPasswordError: ""
      });
      return false;
    } else if (this.state.cnfPassword === "") {
      this.setState({
        oldPasswordError: "",
        newPasswordError: "",
        cnfPasswordError: Messages.cnfPasswordMsg
      });
      return false;
    } else if (this.state.newPassword != this.state.cnfPassword) {
      this.setState({
        oldPasswordError: "",
        newPasswordError: "",
        cnfPasswordError: Messages.passwordSameMsg
      });
      return false;
    }
    this.setState({
      oldPasswordError: "",
      newPasswordError: "",
      cnfPasswordError: ""
    });
    return true;
  }

  changePassword() {
    netStatus(status => {
      if (status) {
        apiPost(
          RESET_PASSWORD_REQ_URL,
          {
            user_id: parseInt(userObj.UserID) || 0,
            token: "" + userObj.PhoneNumber,
            old_password: this.state.oldPassword,
            password: this.state.newPassword,
            confirm_password: this.state.cnfPassword
          },
          resp => {
            if (resp != undefined) {
              if (resp.status == RESPONSE_SUCCESS) {
                this.setState({ isLoading: false });
                // showValidationAlert(resp.message);

                showDialogue(resp.message, [
                  {
                    text: "Ok",
                    onPress: () => {
                      this.props.navigation.goBack();
                    }
                  }
                ]);
              } else {
                showValidationAlert(resp.message);
                this.setState({ isLoading: false });
              }
            } else {
              showValidationAlert(Messages.generalWebServiceError);
              this.setState({ isLoading: false });
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

  render() {
    return (
      <BaseContainer
        title="Change Password"
        left="Back"
        right={[{ url: Assets.tick }]}
        onRight={index => {
          index == 0 ? this.checkPassword() : null;
        }}
        onLeft={() => {
          this.props.navigation.goBack();
        }}
      >
        {this.state.isLoading ? <ProgressLoader /> : null}
        <View style={{ flex: 1 }}>
          <ScrollView>
            <View
              style={{
                backgroundColor: EDColors.white,
                borderRadius: 5,
                padding: 5,
                margin: 10
              }}
            >
              <View
                style={{
                  flex: 1,
                  flexDirection: "row",
                  paddingLeft: 10,
                  paddingRight: 10,
                  paddingTop: 10,
                  alignItems: "center"
                }}
              >
                <Image source={Assets.password} />

                <TextInput
                  style={{
                    fontSize: 16,
                    fontFamily: ETFonts.regular,
                    flex: 1,
                    padding: 0,
                    marginLeft: 10
                  }}
                  maxLength={15}
                  secureTextEntry={true}
                  numberOfLines={1}
                  placeholder={"Old Password"}
                  onChangeText={userText => {
                    this.setState({
                      oldPassword: userText
                    });
                  }}
                >
                  {this.state.oldPassword}
                </TextInput>
              </View>
              <ETextErrorMessage errorMsg={this.state.oldPasswordError} />
              <View
                style={{
                  flex: 1,
                  flexDirection: "row",
                  paddingLeft: 10,
                  paddingRight: 10,
                  paddingTop: 10,
                  alignItems: "center"
                }}
              >
                <Image source={Assets.password} />

                <TextInput
                  style={{
                    fontSize: 16,
                    fontFamily: ETFonts.regular,
                    flex: 1,
                    padding: 0,
                    marginLeft: 10
                  }}
                  maxLength={15}
                  numberOfLines={1}
                  secureTextEntry={true}
                  placeholder={"New Password"}
                  onChangeText={userText => {
                    this.setState({
                      newPassword: userText
                    });
                  }}
                >
                  {this.state.newPassword}
                </TextInput>
              </View>
              <ETextErrorMessage errorMsg={this.state.newPasswordError} />
              <View
                style={{
                  flex: 1,
                  flexDirection: "row",
                  alignContent: "center",
                  paddingLeft: 10,
                  paddingRight: 10,
                  paddingTop: 10,
                  alignItems: "center"
                }}
              >
                <Image source={Assets.password} />

                <TextInput
                  style={{
                    fontSize: 16,
                    fontFamily: ETFonts.regular,
                    flex: 1,
                    padding: 0,
                    marginLeft: 10
                  }}
                  maxLength={15}
                  numberOfLines={1}
                  secureTextEntry={true}
                  placeholder={"Confirm Password"}
                  onChangeText={userText => {
                    this.setState({
                      cnfPassword: userText
                    });
                  }}
                >
                  {this.state.cnfPassword}
                </TextInput>
              </View>
              <ETextErrorMessage errorMsg={this.state.cnfPasswordError} />
            </View>
          </ScrollView>
        </View>
      </BaseContainer>
    );
  }
}
