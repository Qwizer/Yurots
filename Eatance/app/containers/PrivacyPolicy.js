import React from "react";
import { View, ScrollView, Platform } from "react-native";
import BaseContainer from "./BaseContainer";
import { apiPost } from "../api/APIManager";
import { CMS_PAGE, RESPONSE_SUCCESS, PRIVACY_POLICY } from "../utils/Constants";
import { showValidationAlert } from "../utils/CMAlert";
import { Messages } from "../utils/Messages";
import { netStatus } from "../utils/NetworkStatusConnection";
import MyWebView from "react-native-webview-autoheight";

export default class PrivacyPolicy extends React.PureComponent {
  constructor(props) {
    super(props);
    this.title = this.props.navigation.state.params.routeName;
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
    isLoading: false,
    webViewHeight: 100,
    htmlData: ""
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
            cms_id: PRIVACY_POLICY
          },
          success => {
            this.setState({ isLoading: false });
            if (success.error != undefined) {
              showValidationAlert(
                response.error.message != undefined
                  ? response.error.message
                  : Messages.generalWebServiceError
              );
            } else {
              if (success.status == RESPONSE_SUCCESS) {
                this.cmsData = success.cmsData[0];

                this.setState({ htmlData: success.cmsData[0] });
              } else {
                showValidationAlert(success.message);
              }
            }
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
        title="Privacy Policy"
        left="Back"
        right={[]}
        onLeft={() => {
          this.props.navigation.goBack();
        }}
        loading={this.state.isLoading}
      >
        {/* {this.state.isLoading ? <ProgressLoader /> : null} */}
        {/* <ScrollView
          showsVerticalScrollIndicator={false}
          style={{ flex: 1 }}
          contentContainerStyle={{ flex: 1 }}
        > */}
        <View style={{ flex: 1 }}>
        {this.state.htmlData == "" ? null :
          <MyWebView
            source={{
              html: this.customStyle + this.state.htmlData.description
            }}
            startInLoadingState={true}
            style={{ padding: 20 }}
            scrollEnabled={true}
          />
        }
        </View>
        {/* </ScrollView> */}
      </BaseContainer>
    );
  }
}
