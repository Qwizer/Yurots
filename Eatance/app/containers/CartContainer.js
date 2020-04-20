import React from "react";
import {
  View,
  Text,
  Image,
  Modal,
  StyleSheet,
  FlatList,
  TouchableOpacity,
  Dimensions,
  Linking,
  Platform
} from "react-native";
import BaseContainer from "./BaseContainer";
import ProgressLoader from "../components/ProgressLoader";
import Assets from "../assets";
import { EDColors } from "../assets/Colors";
import { ETFonts } from "../assets/FontConstants";
import PriceDetail from "../components/PriceDetail";
import CartItem from "../components/CartItem";
import { saveCartData, getCartList } from "../utils/AsyncStorageHelper";
import {
  ADD_TO_CART,
  RESPONSE_SUCCESS,
  COUPON_ERROR,
  INR_SIGN,
  capiString,
  CHECK_ORDER_URL,
  GOOGLE_API_KEY
} from "../utils/Constants";
import { showValidationAlert, showDialogue } from "../utils/CMAlert";
import { connect } from "react-redux";
import { saveCheckoutDetails, saveCartCount } from "../redux/actions/Checkout";
import { apiPost, apiPostFormData } from "../api/APIManager";
import { netStatus } from "../utils/NetworkStatusConnection";
import { Messages } from "../utils/Messages";
import { RadioGroup, RadioButton } from "react-native-flexi-radio-button";
import Geocoder from "react-native-geocoding";
import Geolocation from "@react-native-community/geolocation";

var radio_props = [
  { label: 'PickUp order', value: 0 },
  { label: 'Delivery order', value: 1 }
];

export class CartContainer extends React.PureComponent {
  constructor(props) {
    super(props);

    this.cartData = [];
    this.deleteIndex = -1;
    this.cart_id = 0;
    this.cartResponse = undefined;
  }

  state = {
    isLoading: false,
    isDeleteVisible: false,
    isAsyncSync: false,
    value: 0,
    curr_latitude: 0.0,
    curr_longitude: 0.0,
  };

  passFunction = data => {
    this.promoCode = data;
    this.getCartData(this.cartResponse.items);
  };

  componentDidMount() {

    this.didFocusEventHandler()
    getCartList(
      success => {
        console.log("getCartList", success);
        cartArray = success;
        this.promoCode = success.coupon_name;
        this.cart_id = success.cart_id;
        this.state.isAsyncSync = true;
        this.getCartData(cartArray.items);
      },
      emptyList => {
        this.cartResponse = {
          items: []
        };
        this.setState({ isAsyncSync: true });
      },
      error => {
        this.cartResponse = {
          items: []
        };
        this.setState({ isAsyncSync: true });
      }
    );
  }

  didFocusEventHandler = (payload) => {
    if (Platform.OS === "android") {
      if (GOOGLE_API_KEY !== "") {
        Geocoder.init(GOOGLE_API_KEY);
        // this.setState({ isLoading: true });
        Geolocation.getCurrentPosition(
          position => {

            console.log('CURRENT ADDRESSS :::::: ', position.coords.latitude, " :::::::::: ", position.coords.longitude)
            // this.driverTracking()
            this.setState({
              curr_latitude: position.coords.latitude,
              curr_longitude: position.coords.longitude,
            }
              // ,()=> this.driverTracking()
            );
            // this.getAddress(position.coords.latitude, position.coords.longitude);

          },
          error => {
            console.log("ios DENIED");
            // showDialogue("Please allow location access from setting", [], "", () => {
            //     this.isOpenSetting = true;
            //     Linking.openURL("app-settings:");
            // });
            // this.setState({ isLoading: false });
            // this.setState({ error: error.message });
          },
          { enableHighAccuracy: false, timeout: 20000, maximumAge: 1000 }
        );
      } else {
        showDialogue("Google Maps API key is not configured for this application.", [], "")
      }
    } else {
      this.checkLocationIOS()
    }
  }

  checkLocationIOS() {

    if (GOOGLE_API_KEY !== "") {
      Geocoder.init(GOOGLE_API_KEY);
      // this.setState({ isLoading: true });
      Geolocation.getCurrentPosition(
        position => {

          console.log('CURRENT ADDRESSS :::::: ', position.coords.latitude, " :::::::::: ", position.coords.longitude)

          this.setState({
            curr_latitude: position.coords.latitude,
            curr_longitude: position.coords.longitude,
          }
            // ,()=> this.driverTracking()
          );
          // this.getAddress(position.coords.latitude, position.coords.longitude);

        },
        error => {
          console.log("ios DENIED");
          // showDialogue("Please allow location access from setting", [], "", () => {
          //     this.isOpenSetting = true;
          //     Linking.openURL("app-settings:");
          // });
          // this.setState({ isLoading: false });
          // this.setState({ error: error.message });
        },
        { enableHighAccuracy: false, timeout: 20000, maximumAge: 1000 }
      );
    } else {
      showDialogue("Google Maps API key is not configured for this application.", [], "")
    }
  }

  getCartData(items) {
    console.log("items1", items.length > 0 ? this.promoCode : "");
    console.log("items2", this.promoCode);
    console.log("items3", items.length);
    netStatus(status => {
      if (status) {
        this.setState({ isLoading: true });
        console.log("items", items);

        const formData = new FormData();
        formData.append("user_id", this.props.userID || "");
        formData.append("token", this.props.token || "");
        formData.append("restaurant_id", cartArray.resId);
        formData.append("items", '{"items": ' + JSON.stringify(items) + "}");
        formData.append("cart_id", this.cart_id);
        formData.append("coupon", items.length > 0 ? this.promoCode : "");

        apiPostFormData(
          ADD_TO_CART,
          formData,
          response => {
            if (response.error != undefined) {
              showValidationAlert(
                response.error.message != undefined
                  ? response.error.message
                  : Messages.generalWebServiceError
              );
            } else {
              if (response.status == RESPONSE_SUCCESS) {
                this.updateUI(response);
              } else if (response.status == COUPON_ERROR) {
                this.updateUI(response);
                showValidationAlert(response.message);
              } else {
                showValidationAlert(response.message);
              }
            }
            this.setState({ isLoading: false });
          },
          error => {
            this.setState({ isLoading: false });
            showValidationAlert(
              error.response != undefined
                ? error.response
                : Messages.generalWebServiceError
            );
          }
        );
      } else {
        showValidationAlert(Messages.internetConnnection);
      }
    });
  }

  saveCheckoutDataToRedux(data) {
    this.props.saveCheckoutDetails(data);
  }

  updateUI(response) {
    this.cartResponse = response;
    this.cart_id = response.cart_id;

    var updatedCart = {
      resId: cartArray.resId,
      items: response.items,
      coupon_name: response.coupon_name,
      cart_id: response.cart_id
    };

    saveCartData(updatedCart, success => { }, fail => { });
    if (response.items.length == 0) {
      this.props.navigation.goBack();
    }
  }

  onSelectedIndex = (value) => {
    console.log("SELECTED VALUE ::::::::: ", value)
    this.setState({ value: value })
  }

  checkOrderAPI = () => {
    this.setState({ isLoading: true })
    let param = {
      token: this.props.token,
      user_id: this.props.userID,
      // order_id: "",
      // is_delivered: "0",
      // reason: "test",
      order_delivery: "Delivery",
      // latitude:this.state.curr_latitude,
      // longitude:this.state.curr_longitude,
      restaurant_id: cartArray.resId
    }
    apiPost(
      CHECK_ORDER_URL,
      param,
      onSuccess => {
        console.log("CHECK API SUCCESS ::::::: ", onSuccess)
        if (onSuccess.status === 0) {
          this.setState({ isLoading: false })
          alert("Please select pickup option delivery service is not available at this moment")
        } else {
          var checkoutData = {
            address_id: 0,
            subtotal: this.cartResponse.subtotal,
            items:
              '{"items": ' +
              JSON.stringify(this.cartResponse.items) +
              "}",
            coupon_id: this.cartResponse.coupon_id,
            coupon_type: this.cartResponse.coupon_type,
            coupon_amount: this.cartResponse.coupon_amount,
            user_id: this.props.userID,
            token: this.props.token,
            restaurant_id: cartArray.resId,
            total: this.cartResponse.total,
            coupon_name: this.cartResponse.coupon_name,
            coupon_discount: this.cartResponse.coupon_discount,
            orderMethodIndex: this.state.value,
            latitude: this.state.curr_latitude,
            longitude: this.state.curr_longitude,
            order_delivery: "Delivery",
          };

          this.saveCheckoutDataToRedux(checkoutData);

          this.props.navigation.navigate("AddressListContainer", {
            isSelectAddress: true
          });
          this.setState({ isLoading: false })
        }

      },
      onFailure => {
        console.log("CHECK API FAILURE ::::::: ", onFailure)
        this.setState({ isLoading: false })
      }

    )
  }

  render() {
    return (
      <BaseContainer
        title="Cart"
        left="Back"
        right={[]}
        onLeft={() => {
          this.props.navigation.goBack();
        }}
      >
        {this.state.isLoading ? <ProgressLoader /> : null}
        <Modal
          visible={this.state.isDeleteVisible}
          animationType="slide"
          transparent={true}
          onRequestClose={() => {
            this.setState({ isDeleteVisible: false });
          }}
        >
          {this.deleteDialog()}
        </Modal>

        {this.cartResponse != undefined && this.cartResponse.items.length > 0
          ? this.mainView()
          : this.cartResponse != undefined &&
            this.cartResponse.items.length <= 0
            ? this.emptyView()
            : null}
      </BaseContainer>
    );
  }

  emptyView() {
    return <Text style={style.emptyCartText}>{Messages.emptyCartMsg}</Text>;
  }

  mainView() {
    return (
      <View style={{ flex: 1, paddingBottom: 5 }}>
        <FlatList
          data={this.cartResponse != undefined ? this.cartResponse.items : []}
          showsVerticalScrollIndicator={false}
          renderItem={({ item, index }) => {
            return (
              <CartItem
                itemImage={item.image}
                itemName={item.name}
                price={INR_SIGN + " " + item.price}
                rating={item.rating}
                quantity={item.quantity}
                onPlusClick={value => {
                  if (value > 0) {
                    this.cartResponse.items[index].quantity = value;
                    this.getCartData(this.cartResponse.items);
                  }
                }}
                onMinusClick={value => {
                  if (value > 0) {
                    this.cartResponse.items[index].quantity = value;
                    this.getCartData(this.cartResponse.items);
                  } else if (value == 0) {
                    var array = this.cartResponse.items;
                    array.splice(index, 1);
                    this.getCartData(array);
                  }
                }}
                isVeg={item.is_veg}
                deleteClick={() => {
                  this.deleteIndex = index;
                  this.setState({ isDeleteVisible: true });
                }}
              />
            );
          }}
          keyExtractor={(item, index) => item + index}
        />

        <View style={{}}>
          <View style={style.priceContainer}>
            <Text style={style.title}>Price Details</Text>
            <View style={style.divider} />

            {this.cartResponse.price != undefined ? (
              this.cartResponse.price.map((item, index) => {
                return (
                  <PriceDetail
                    key={item.label}
                    title={
                      item.label != undefined ? capiString(item.label) : ""
                    }
                    price={
                      item.value != undefined
                        ? item.label.includes("total") ||
                          item.label.includes("Total") ||
                          item.label.includes("Discount")
                          ? INR_SIGN + " " + item.value
                          : item.value
                        : ""
                    }
                  />
                );
              })
            ) : (
                <View />
              )}
          </View>

          <View
            style={{
              borderRadius: 6,
              marginLeft: 10,
              marginRight: 10,
              backgroundColor: "#fff"
            }}
          >
            {this.cartResponse.is_apply == true ? (
              <View
                style={{
                  flexDirection: "row",
                  alignItems: "center",
                  padding: 10
                }}
              >
                <Text
                  style={{
                    flex: 1,
                    fontFamily: ETFonts.regular,
                    fontSize: 15,
                    alignSelf: "center",
                    color: EDColors.primary,
                    textAlign: "center"
                  }}
                >
                  {this.promoCode + " Applied"}
                </Text>
                <TouchableOpacity
                  style={{ alignSelf: "center", marginRight: 10 }}
                  onPress={() => {
                    this.promoCode = "";
                    this.getCartData(this.cartResponse.items);
                  }}
                >
                  <Image
                    style={{ alignSelf: "center", height: 15, width: 15 }}
                    source={Assets.ic_close}
                  />
                </TouchableOpacity>
              </View>
            ) : (
                (this.props.userID != undefined && this.props.userID != "") ? <Text
                  style={style.promoCode}

                  onPress={() => {
                    this.props.navigation.navigate("PromoCodeContainer", {
                      getData: this.passFunction,
                      subTotal: this.cartResponse.subtotal,
                      resId: cartArray.resId
                    });
                  }}
                >
                  Have a Promo code?
              </Text> : null
              )}
          </View>

          <RadioGroup
            color={EDColors.primary || EDColors.text}
            onSelect={this.onSelectedIndex}
            // style={{ flex: 1, alignItem: "flex-end" }}
            style={{ marginLeft: 10, marginRight: 10 }}
            selectedIndex={this.state.value}
          >
            {radio_props.map(index => {
              // paymentMethodToIterate.code == PaymentMethods.bankTransfer
              return (
                <RadioButton
                  key={index.label}
                  // style={{
                  //     flexDirection: isRTLCheck() ? "row-reverse" : "row", padding: 0,
                  //     paddingHorizontal: this.arrayPaymentMethods.length > 1 ? 10 : 0, paddingTop: 10
                  // }}
                  value={index.label}
                >
                  <Text>{index.label}</Text>

                </RadioButton>
              )
            })}


          </RadioGroup>

          <View style={style.checkOutContainer}>
            <Text style={style.totalPrice}>
              {INR_SIGN + " " + this.cartResponse.total}
            </Text>

            <TouchableOpacity
              style={style.roundButton}
              onPress={() => {
                if (this.props.userID != undefined && this.props.userID != "") {
                  if (this.state.value === 1) {
                    this.checkOrderAPI()
                  } else {
                    var checkoutData = {
                      address_id: 0,
                      subtotal: this.cartResponse.subtotal,
                      items:
                        '{"items": ' +
                        JSON.stringify(this.cartResponse.items) +
                        "}",
                      coupon_id: this.cartResponse.coupon_id,
                      coupon_type: this.cartResponse.coupon_type,
                      coupon_amount: this.cartResponse.coupon_amount,
                      user_id: this.props.userID,
                      token: this.props.token,
                      restaurant_id: cartArray.resId,
                      total: this.cartResponse.total,
                      coupon_name: this.cartResponse.coupon_name,
                      coupon_discount: this.cartResponse.coupon_discount,
                      orderMethodIndex: this.state.value,
                      latitude: 0.0,
                      longitude: 0.0,
                      order_delivery: "PickUp",
                    };

                    this.saveCheckoutDataToRedux(checkoutData);

                    this.props.navigation.navigate("AddressListContainer", {
                      isSelectAddress: true
                    });
                  }
                } else {
                  this.props.navigation.navigate("LoginContainer", {
                    isCheckout: true
                  });
                }
              }}
            >
              <Text style={style.button}>CHECKOUT</Text>
            </TouchableOpacity>
          </View>
        </View>
      </View>
    );
  }

  deleteDialog() {
    return (
      <View style={style.modalContainer}>
        <View style={style.modalSubContainer}>
          <Text style={style.deleteTitle}>{Messages.deleteItemMsg}</Text>

          <View style={style.optionContainer}>
            <Text
              style={style.deleteOption}
              onPress={() => {
                var array = this.cartResponse.items;
                array.splice(this.deleteIndex, 1);
                this.getCartData(array);
                this.setState({ isDeleteVisible: false });
              }}
            >
              Yes
            </Text>

            <Text
              style={style.deleteOption}
              onPress={() => {
                this.deleteIndex = -1;
                this.setState({ isDeleteVisible: false });
              }}
            >
              No
            </Text>
          </View>
        </View>
      </View>
    );
  }
}

export default connect(
  state => {
    return {
      userID: state.userOperations.userIdInRedux,
      token: state.userOperations.phoneNumberInRedux,
      cartCount: state.checkoutReducer.cartCount
    };
  },
  dispatch => {
    return {
      saveCheckoutDetails: checkoutData => {
        dispatch(saveCheckoutDetails(checkoutData));
      },
      saveCartCount: data => {
        dispatch(saveCartCount(data));
      }
    };
  }
)(CartContainer);

export const style = StyleSheet.create({
  container: {
    flex: 1
  },
  priceContainer: {
    backgroundColor: "#fff",
    borderRadius: 6,
    margin: 10
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
    borderRadius: 6,
    marginTop: 20,
    marginBottom: 20
  },
  deleteTitle: {
    fontFamily: ETFonts.bold,
    fontSize: 15,
    color: "#000",
    marginTop: 10,
    alignSelf: "center",
    textAlign: "center",
    marginLeft: 20,
    marginRight: 20,
    padding: 10
  },
  optionContainer: {
    flexDirection: "row",
    justifyContent: "center",
    marginTop: 20
  },
  deleteOption: {
    fontFamily: ETFonts.bold,
    fontSize: 12,
    color: "#fff",
    paddingTop: 10,
    paddingBottom: 10,
    paddingLeft: 30,
    paddingRight: 30,
    margin: 10,
    backgroundColor: EDColors.primary
  },
  title: {
    fontFamily: ETFonts.bold,
    color: "#000",
    fontSize: 15,
    marginTop: 10,
    marginLeft: 10,
    marginBottom: 4
  },
  divider: {
    marginTop: 4,
    marginLeft: 10,
    marginRight: 10,
    backgroundColor: "#000",
    height: 1
  },
  promoCode: {
    alignSelf: "center",
    color: EDColors.primary,
    fontFamily: ETFonts.regular,
    fontSize: 15,
    marginTop: 15,
    marginBottom: 10
  },
  checkOutContainer: {
    flexDirection: "row",
    margin: 10,
    borderRadius: 6,
    alignSelf: "flex-end",
    backgroundColor: "#fff"
  },
  totalPrice: {
    flex: 1,
    fontFamily: ETFonts.regular,
    fontSize: 20,
    alignSelf: "center",
    marginLeft: 10
  },
  roundButton: {
    alignSelf: "center",
    margin: 10,
    backgroundColor: EDColors.primary,
    borderRadius: 4
  },
  button: {
    paddingTop: 10,
    paddingRight: 20,
    paddingLeft: 20,
    paddingBottom: 10,
    color: "#fff",
    fontFamily: ETFonts.regular
  },
  apply: {
    padding: 10,
    color: "#fff",
    fontFamily: ETFonts.regular
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

// const navigationAction = NavigationActions.navigate({
//   routeName: "Order", // <==== this is stackNavigator
//   action: NavigationActions.navigate({
//     routeName: "MyOrderContainer" // <===== this is defaultScreen for Portfolio
//   })
// });
// this.props.navigation.dispatch(navigationAction);

// this.props.navigation.dispatch(
//   StackActions.reset({
//     index: 6,
//     // key: "HOME_SCREEN_DRAWER",
//     routeName: "MAIN_NAVIGATOR",
//     key: "Home",
//     actions: [
//        NavigationActions.navigate({
//          routeName: "MainContainer"
//        }),
//        NavigationActions.navigate({
//          routeName: "MyOrderContainer"
//        })
//       this.props.navigation.dispatch(
//         NavigationActions.navigate({
//           routeName: "Order", // <==== this is stackNavigator,
//           key: "Order",
//           action: NavigationActions.navigate({
//             routeName: "MyOrderContainer" // <===== this is defaultScreen for Portfolio
//           })
//         })
//       )
//     ]
//   })
// );

// this.props.navigation.dispatch(
//   StackActions.reset({
//     index: 0,
//     key: null,
//     actions: [
//       NavigationActions.navigate({
//         routeName: "MY_ORDER_NAVIGATOR"
//       })
//     ]
//   })
// );
// this.props.navigation.navigate("Order");
