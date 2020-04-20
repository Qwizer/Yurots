import React from "react";
import { View, Text, Image, StyleSheet } from "react-native";
import BaseContainer from "./BaseContainer";
import ProgressLoader from "../components/ProgressLoader";
import Assets from "../assets";
import { ETFonts } from "../assets/FontConstants";
import EDThemeButton from "../components/EDThemeButton";
import { connect } from "react-redux";
import { saveCartCount } from "../redux/actions/Checkout";
import { apiPost } from "../api/APIManager";
import { CHECK_ORDER_DELIVERED_URL } from "../utils/Constants";
import NavigationService from "../../NavigationService";

class OrderConfirm extends React.PureComponent {
  constructor(props) {
    super(props);
  }

  state = {
    isLoading: false
  };

  orderDelivered = () => {
    let param = {
      token: "",
      user_id: "",
      order_id: "",
      is_delivered: "",
      reason: ""
    }

    apiPost(
      CHECK_ORDER_DELIVERED_URL,
      param,
      onSuccess => {
          
      },
      onFailure => {

      }
    )
  }

  render() {
    return (
      <BaseContainer
        title="Confirmation"
        left="Back"
        right={[]}
        onLeft={() => {
          this.props.navigation.popToTop();
          this.props.navigation.navigate("Order");
        }}
      >
        {this.state.isLoading ? <ProgressLoader /> : null}
        <View style={{ flex: 1 }}>
          <Image
            source={Assets.confirm_background}
            style={{
              flex: 1,
              width: "100%"
            }}
          />

          <View style={style.container}>
            <View style={style.subContainer}>
              <Image
                style={{ alignSelf: "center" }}
                source={Assets.confirm_thumb}
              />
            </View>

            <View style={{ flex: 1, marginTop: 10, alignItems: "center" }}>
              <Text style={style.thankyouText}>Thank you for Ordering!</Text>

              <View style={{ marginTop: 20 }}>
                <EDThemeButton
                  label="TRACK YOUR ORDER"
                  onPress={() => {
                    this.props.saveCartCount(0);
                    this.props.navigation.popToTop();
                    this.props.navigation.navigate("Order");
                    // NavigationService.navigate("Order")
                  }}
                />
              </View>
            </View>
          </View>
        </View>
      </BaseContainer>
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
      saveCartCount: data => {
        dispatch(saveCartCount(data));
      }
    };
  }
)(OrderConfirm);

export const style = StyleSheet.create({
  container: {
    flex: 1,
    position: "absolute",
    width: "100%",
    height: "100%"
  },
  thankyouText: {
    fontFamily: ETFonts.satisfy,
    fontSize: 20,
    color: "#000",
    marginTop: 20
  },
  subContainer: {
    flex: 1,
    justifyContent: "flex-end"
  }
});
