import React from "react";
import { View, Image, StyleSheet, Platform, ScrollView } from "react-native";
import Assets from "../assets";
import BaseContainer from "./BaseContainer";
import { apiPost } from "../api/APIManager";
import {
  CMS_PAGE,
  RESPONSE_SUCCESS,
  ABOUT_US,
  CONTACT_US
} from "../utils/Constants";
import { showDialogue, showValidationAlert } from "../utils/CMAlert";
import ProgressLoader from "../components/ProgressLoader";
import { Messages } from "../utils/Messages";
import { netStatus } from "../utils/NetworkStatusConnection";
import MyWebView from "react-native-webview-autoheight";
import metrics from "../utils/metrics";

export default class CMSContainer extends React.PureComponent {
  constructor(props) {
    super(props);
    console.log("--------------------- CMS container", this.props);
    this.title =
      this.props.navigation.state.params != undefined &&
      this.props.navigation.state.params.routeName != undefined
        ? this.props.navigation.state.params.routeName
        : "About Us";
    this.cmsData = {};

    this.fontSize = Platform.OS == "ios" ? "18px" : "18px";
    this.meta =
      '<head><meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0"></head>';
    this.customStyle =
      this.meta +
      "<style>* {max-width: 100%;} body {font-size:" +
      this.fontSize +
      ";}</style>";
  }

  state = {
    isLoading: false
  };

  componentDidMount() {
    this.getCMSContent();
  }

  getCMSContent() {
    netStatus(status => {
      if (status) {
        this.setState({ isLoading: true });
        apiPost(
          CMS_PAGE,
          {
            cms_id: this.title == "About Us" ? ABOUT_US : CONTACT_US
          },
          success => {
            if (success.error != undefined) {
              showValidationAlert(
                response.error.message != undefined
                  ? response.error.message
                  : Messages.generalWebServiceError
              );
            } else {
              if (success.status == RESPONSE_SUCCESS) {
                this.cmsData = success.cmsData[0];
              } else {
                showValidationAlert(response.message);
              }
            }
            this.setState({ isLoading: false });
          },
          error => {
            this.setState({ isLoading: false });
            showValidationAlert(Messages.generalWebServiceError, []);
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
        title={this.title}
        left={"Back"}
        right={[]}
        onLeft={() => {
          this.props.navigation.goBack();
        }}
      >
        {this.state.isLoading ? <ProgressLoader /> : null}
        <ScrollView contentContainerStyle={{ flex: 1 }}>
          <View style={{ flex: 1, width: "100%", height: "100%" }}>
            <Image
              source={Assets.about_us}
              style={{
                flex: 1,
                position: "absolute",
                width: "100%",
                height: "100%"
              }}
            />

            <View
              style={{
                flex: 1,
                width: "100%"
              }}
            >
              <View style={{ flex: 1 }} />
              <View
                style={{
                  flex: 1,
                  margin: 15,
                }}
              >
                {console.log(
                  "This is data",
                  this.cmsData.description != undefined
                    ? this.cmsData.description
                    : "No data"
                )}
                {this.cmsData.description != undefined ? (
                  <MyWebView
                    source={{
                      html: this.customStyle + this.cmsData.description
                    }}
                    width="100%"
                    startInLoadingState={true}
                    style={{
                      flex: 1,
                      marginTop:10,
                      alignSelf: "flex-start",
                      backgroundColor: "transparent"
                    }}
                    //hasIframe={true}
                    scrollEnabled={true}
                  />
                ) : null}
              </View>
            </View>
          </View>
        </ScrollView>
      </BaseContainer>
    );
  }
}

export const style = StyleSheet.create({
  container: {
    flexDirection: "row",
    alignItems: "center",
    marginTop: 10
  },
  modalContainer: {
    flex: 1,
    justifyContent: "center",
    backgroundColor: "rgba(0,0,0,0.50)"
  },
  modalSubContainer: {
    backgroundColor: "#fff",
    padding: 10,
    marginLeft: 20,
    marginRight: 20,
    borderRadius: 4,
    marginTop: 20,
    marginBottom: 20
  }
});
