import React from "react";
import { View, Text, StyleSheet, FlatList } from "react-native";
import BaseContainer from "./BaseContainer";
import { showDialogue, showValidationAlert } from "../utils/CMAlert";
import { ETFonts } from "../assets/FontConstants";
import ProgressLoader from "../components/ProgressLoader";
import { apiPost } from "../api/APIManager";
import { GET_NOTIFICATION, RESPONSE_SUCCESS } from "../utils/Constants";
import { connect } from "react-redux";
import { Messages } from "../utils/Messages";
import { netStatus } from "../utils/NetworkStatusConnection";
import DataNotAvailableContainer from "../components/DataNotAvailableContainer";

class NotificationList extends React.PureComponent {
  constructor(props) {
    super(props);

    // this.notificationList = [];
    this.page_no = 1;
    this.isScrolling = false;
  }

  state = {
    isLoading: false,
    notificationList: undefined
  };

  componentDidMount() {
    this.getNotificationList();
  }

  getNotificationList() {
    netStatus(status => {
      if (status) {
        if (
          this.props.token != "" &&
          this.props.token != undefined &&
          this.props.token.length > 0
        ) {
          this.setState({ isLoading: true });
          apiPost(
            GET_NOTIFICATION,
            {
              token: this.props.token,
              user_id: this.props.userID,
              count: 20,
              page_no: this.page_no
            },
            response => {
              if (response.status == RESPONSE_SUCCESS) {
                if (
                  response.notification != undefined &&
                  response.notification.length > 0
                ) {
                  if (
                    this.state.notificationList != undefined &&
                    response.notification.length >= 20 &&
                    response.notificaion_count != this.state.notificationList
                  ) {
                    this.page_no = this.page_no + 1;
                    this.isScrolling = true;
                  } else {
                    this.isScrolling = false;
                  }

                  if (
                    response.notification.length > 0 &&
                    this.state.notificationList == undefined
                  ) {
                    this.state.notificationList = [];
                  }

                  this.setState({
                    notificationList: [
                      ...this.state.notificationList,
                      ...response.notification
                    ]
                  });
                } else {
                  this.setState({ notificationList: [] });
                }
              } else {
                showValidationAlert(response.message);
              }
              this.setState({ isLoading: false });
            },
            error => {
              this.setState({ isLoading: false });
              showValidationAlert(Messages.generalWebServiceError);
            }
          );
        } else {
          showValidationAlert(Messages.loginValidation);
        }
      } else {
        showValidationAlert(Messages.internetConnnection);
      }
    });
  }

  emptyView() {
    // return <Text style={style.emptyCartText}>No Data Found</Text>;
    return (
      <View style={style.emptyCartText}>
        <DataNotAvailableContainer />
      </View>
    );
  }

  render() {
    return (
      <BaseContainer
        title="Notification"
        left="Menu"
        right={[]}
        onLeft={() => {
          this.props.navigation.openDrawer();
        }}
      >
        {this.state.isLoading ? <ProgressLoader /> : null}
        <View style={{ flex: 1 }}>
          {this.state.notificationList != undefined &&
          this.state.notificationList.length > 0 ? (
            <FlatList
              data={this.state.notificationList}
              showsVerticalScrollIndicator={false}
              extraData={this.state}
              renderItem={({ item, index }) => {
                return (
                  <View
                    style={{
                      margin: 10,
                      padding: 10,
                      borderRadius: 6,
                      backgroundColor: "white"
                    }}
                  >
                    <Text
                      style={{
                        color: "#000",
                        fontFamily: ETFonts.regular,
                        fontSize: 20
                      }}
                    >
                      {item.notification_title}
                    </Text>

                    <Text
                      style={{
                        color: "#000",
                        fontFamily: ETFonts.regular,
                        fontSize: 16
                      }}
                    >
                      {item.notification_title}
                    </Text>
                  </View>
                );
              }}
              onEndReached={() => {
                if (this.isScrolling) {
                  this.getNotificationList();
                }
              }}
              onEndReachedThreshold={0.5}
              keyExtractor={(item, index) => item + index}
            />
          ) : this.state.notificationList != undefined &&
            this.state.notificationList.length <= 0 ? (
            this.emptyView()
          ) : null}
        </View>
      </BaseContainer>
    );
  }
}

export default connect(
  state => {
    return {
      userID: state.userOperations.userIdInRedux,
      token: state.userOperations.phoneNumberInRedux
    };
  },
  dispatch => {
    return {
      saveNavigationSelection: dataToSave => {
        dispatch(saveNavigationSelection(dataToSave));
      }
    };
  }
)(NotificationList);

export const style = StyleSheet.create({
  container: {
    flex: 1
  },
  searchBox: {
    position: "relative",
    marginTop: -30,
    marginBottom: 10
  },
  emptyCartText: {
    flex: 1,
    textAlign: "center",
    textAlignVertical: "center",
    alignContent: "center",
    color: "#000",
    fontSize: 15,
    fontFamily: ETFonts.regular
  }
});
