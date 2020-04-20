import React from "react";
import {
  View,
  Text,
  TouchableOpacity,
  FlatList,
  Image,
  StyleSheet
} from "react-native";
import BaseContainer from "./BaseContainer";
import EDThemeButton from "../components/EDThemeButton";
import Assets from "../assets";
import { EDColors } from "../assets/Colors";
import {
  RESPONSE_SUCCESS,
  GOOGLE_API_KEY,
  GET_ADDRESS,
  DELETE_ADDRESS
} from "../utils/Constants";
import Geocoder from "react-native-geocoding";
import { getUserToken } from "../utils/AsyncStorageHelper";
import { apiPost } from "../api/ServiceManager";
import ProgressLoader from "../components/ProgressLoader";
import { showValidationAlert, showDialogue } from "../utils/CMAlert";
import { ETFonts } from "../assets/FontConstants";
import { Messages } from "../utils/Messages";
import { connect } from "react-redux";
import { saveCheckoutDetails } from "../redux/actions/Checkout";
import DataNotAvailableContainer from "../components/DataNotAvailableContainer";
import Geolocation from '@react-native-community/geolocation';
import { netStatus } from "../utils/NetworkStatusConnection";

export class AddressListContainer extends React.PureComponent {
  constructor(props) {
    super(props);

    this.state = {
      isLoading: false,
      addressLine1: "",
      addressLine2: "",
      latitude: 0.0,
      longitude: 0.0,
      city: "",
      zipCode: "",
      addressId: "",
      isSelectAddress: this.props.navigation.state.params.isSelectAddress,
      selectedIndex: -1
    };

    // this.selectedIndex = -1;
    this.checkoutData = this.props.checkoutDetail;
  }

  componentDidMount() {
    getUserToken(
      success => {
        userObj = success;
        this.loadData();
      },
      failure => {
        showValidationAlert(Messages.loginValidation);
      }
    );
    this.getCurrentAddress();
  }

  getCurrentAddress() {
    if (GOOGLE_API_KEY !== "") {

      Geocoder.init(GOOGLE_API_KEY);
      this.setState({ isLoading: true });
      Geolocation.getCurrentPosition(
        position => {
          this.setState({
            latitude: position.coords.latitude,
            longitude: position.coords.longitude
          });

          // Geocoder.from(position.coords.latitude, position.coords.longitude)
          //   .then(json => {
          //     this.setState({ isLoading: false });

          //     var city = json.results[0].address_components.filter(
          //       x =>
          //         x.types.filter(t => t == "administrative_area_level_1").length >
          //         0
          //     )[0].short_name;
          //     var pincode = json.results[0].address_components.filter(
          //       x => x.types.filter(t => t == "postal_code").length > 0
          //     )[0].short_name;
          //     var addressComponent = json.results[0].formatted_address;

          //     this.setState({
          //       addressLine2: addressComponent,
          //       city: city,
          //       zipCode: pincode
          //     });
          //   })
          //   .catch(error => {
          //     this.setState({ isLoading: false });
          //   });
        },
        error => {
          this.setState({ isLoading: false });
          this.setState({ error: error.message });
        },
        { enableHighAccuracy: false, timeout: 20000, maximumAge: 1000 }
      );
    } else {
      showDialogue("Google Maps API key is not configured for this application.", [], "")
    }
  }

  loadData() {
    netStatus(status => {
      if (status) {
        this.setState({ isLoading: true });
        apiPost(
          GET_ADDRESS,
          {
            user_id: parseInt(userObj.UserID) || 0,
            token: "" + userObj.PhoneNumber
          },
          resp => {
            if (resp != undefined) {
              if (resp.status == RESPONSE_SUCCESS) {
                this.arrayAddress = resp.address;
                this.setState({ isLoading: false });
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
            showValidationAlert(Messages.internetConnnection);
          }
        );
      } else {
        showValidationAlert(Messages.internetConnnection);
      }
    });
  }

  deleteAddress(addId) {
    netStatus(status => {
      if (status) {
        this.setState({ isLoading: true });
        apiPost(
          DELETE_ADDRESS,
          {
            user_id: parseInt(userObj.UserID) || 0,
            token: "" + userObj.PhoneNumber,
            address_id: addId
          },
          resp => {
            if (resp != undefined) {
              if (resp.status == RESPONSE_SUCCESS) {
                this.loadData();
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
            showValidationAlert(Messages.internetConnnection);
          }
        );
      } else {
        showValidationAlert(Messages.internetConnnection);
      }
    });
  }

  getData = data => {
    this.loadData();
  };

  render() {
    return (
      <BaseContainer
        title={this.state.isSelectAddress ? "Select Address" : "Our Address"}
        left="Back"
        right={[]}
        onLeft={() => {
          this.props.navigation.goBack();
        }}
      >
        {this.state.isLoading ? <ProgressLoader /> : null}
        <View style={{ flex: 1 }}>
          <View
            style={{
              flexDirection: "row",
              alignItems: "center",
              padding: 10
            }}
          >
            <Text
              style={{
                color: EDColors.primary,
                fontSize: 20,
                fontFamily: ETFonts.regular,
                flex: 1
              }}
            >
              Address
            </Text>
            <EDThemeButton
              label="Add Address"
              buttonWidth={140}
              fontSizeNew={6}
              style={{ flex: 1 }}
              onPress={() => {
                this.props.navigation.navigate("AddressMapContainer", {
                  getData: this.getData
                });
              }}
            />
          </View>
          {this.arrayAddress != undefined &&
            this.arrayAddress != null &&
            this.arrayAddress.length > 0 ? (
              <FlatList
                style={{ marginBottom: 20 }}
                data={this.arrayAddress}
                extraData={this.state}
                showsVerticalScrollIndicator={false}
                renderItem={({ item, index }) => {
                  return (
                    <TouchableOpacity
                      style={{ flex: 1 }}
                      onPress={() => {
                        this.setState({ selectedIndex: index });
                      }}
                    >
                      <View
                        style={
                          this.state.selectedIndex == index
                            ? style.selected
                            : style.default
                        }
                      >
                        <View style={{ flex: 2 }}>
                          <Text
                            style={{
                              color: EDColors.primary,
                              fontSize: 20,
                              fontFamily: ETFonts.regular,
                              flex: 1
                            }}
                          >
                            Address
                        </Text>
                          <Text
                            style={{
                              fontSize: 12,
                              fontFamily: ETFonts.regular,
                              flex: 1,
                              padding: 5
                            }}
                          >
                            {item.address}
                          </Text>
                          <Text
                            style={{
                              fontSize: 12,
                              fontFamily: ETFonts.regular,
                              flex: 1,
                              paddingLeft: 5
                            }}
                          >
                            {item.landmark}
                          </Text>
                        </View>

                        {!this.state.isSelectAddress ? (
                          <View style={{ flexDirection: "row" }}>
                            <TouchableOpacity
                              style={{ margin: 5 }}
                              onPress={() => {
                                var sendData = {
                                  addressId: item.address_id,
                                  addressLine2: item.landmark,
                                  addressLine1: item.address,
                                  latitude: item.latitude,
                                  longitude: item.longitude,
                                  city: item.city,
                                  zipCode: item.zipcode
                                };
                                this.props.navigation.navigate(
                                  "AddressMapContainer",
                                  {
                                    getDataAll: sendData,
                                    getData: this.getData
                                  }
                                );
                              }}
                            >
                              <Image source={Assets.edit} />
                            </TouchableOpacity>
                            <TouchableOpacity
                              style={{ margin: 5 }}
                              onPress={() => {
                                showDialogue(Messages.deleteAddress, [
                                  {
                                    text: "cancel"
                                  }
                                ], "",
                                  () =>
                                    this.deleteAddress(item.address_id));
                              }}
                            >
                              <Image source={Assets.delete_gray} />
                            </TouchableOpacity>
                          </View>
                        ) : null}
                      </View>
                    </TouchableOpacity>
                  );
                }}
                ListFooterComponent={({ item, index }) => {
                  return this.state.isSelectAddress ? (
                    <TouchableOpacity
                      style={{
                        alignSelf: "center",
                        backgroundColor: EDColors.primary,
                        justifyContent: "center",
                        marginTop: 10,
                        borderRadius: 6
                      }}
                      onPress={() => {
                        if (this.state.selectedIndex === -1) {
                          showValidationAlert(
                            Messages.addressSelectionValidation
                          );
                        } else {
                          this.checkoutData.address_id = this.arrayAddress[
                            this.state.selectedIndex
                          ].address_id;

                          this.checkoutData.latitude = this.state.latitude;
                          this.checkoutData.longitude = this.state.longitude;

                          this.props.saveCheckoutDetails(this.checkoutData);
                          this.props.navigation.navigate("PaymentContainer");
                        }
                      }}
                    >
                      <Text style={style.continue}>CONTINUE</Text>
                    </TouchableOpacity>
                  ) : null;
                }}
                keyExtractor={(item, index) => item + index}
              />
            ) : this.arrayAddress != undefined &&
              this.arrayAddress != null &&
              this.arrayAddress.length <= 0 ? (
                <DataNotAvailableContainer />
              ) : (
                <View />
              )}
        </View>
      </BaseContainer>
    );
  }
}

export const style = StyleSheet.create({
  selected: {
    flex: 1,
    flexDirection: "row",
    alignItems: "center",
    backgroundColor: EDColors.white,
    borderRadius: 5,
    padding: 5,
    borderWidth: 1,
    borderColor: EDColors.primary,
    marginTop: 10,
    marginLeft: 10,
    marginRight: 10
  },
  default: {
    flex: 1,
    flexDirection: "row",
    alignItems: "center",
    backgroundColor: EDColors.white,
    borderRadius: 5,
    padding: 5,
    marginTop: 10,
    marginLeft: 10,
    marginRight: 10
  },
  continue: {
    fontFamily: ETFonts.primary,
    color: "#fff",
    fontSize: 15,
    paddingTop: 10,
    paddingBottom: 10,
    paddingLeft: 40,
    paddingRight: 40
  }
});

export default connect(
  state => {
    return {
      checkoutDetail: state.checkoutReducer.checkoutDetail
    };
  },
  dispatch => {
    return {
      saveCheckoutDetails: checkoutData => {
        dispatch(saveCheckoutDetails(checkoutData));
      }
    };
  }
)(AddressListContainer);
