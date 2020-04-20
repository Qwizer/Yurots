import React from "react";
import {
  View,
  Text,
  TouchableOpacity,
  StyleSheet
} from "react-native";
import { connect } from "react-redux";
import { saveCheckoutDetails, saveCartCount } from "../redux/actions/Checkout";
import { EDColors } from "../assets/Colors";
import { ETFonts } from "../assets/FontConstants";
import BaseContainer from "./BaseContainer";
import { Radio } from "native-base";
import Moment from "moment";
import { apiPost } from "../api/APIManager";
import { ADD_ORDER, RESPONSE_SUCCESS, INR_SIGN } from "../utils/Constants";
import { showDialogue, showValidationAlert } from "../utils/CMAlert";
import { Messages } from "../utils/Messages";
import ProgressLoader from "../components/ProgressLoader";
import {
  clearCartData
} from "../utils/AsyncStorageHelper";
import { netStatus } from "../utils/NetworkStatusConnection";

export class PaymentContainer extends React.PureComponent {
  constructor(props) {
    super(props);

    this.checkoutDetail = this.props.checkoutDetail;
  }

  state = {
    isLoading: false
  };

  componentDidMount() {}

  placeOrder() {

    netStatus(status => {
      if (status) {

        console.log("ADD ORDER REQUEST ::::::::::::: ", this.checkoutDetail)
        this.setState({ isLoading: true });
        apiPost(
          ADD_ORDER,
          this.checkoutDetail,
          response => {

            console.log("ORDER SUCCESS ::::::::::::: ", response)
            
            if (response.error != undefined) {
              showValidationAlert(
                response.error.message != undefined
                  ? response.error.message
                  : Messages.generalWebServiceError
              );
            } else {
              if (response.status == RESPONSE_SUCCESS) {
                clearCartData(
                  response => {
                    this.props.navigation.navigate("OrderConfirm");
                  },
                  error => {}
                );
              } else {
                showValidationAlert(response.message);
              }
            }
            this.setState({ isLoading: false });
          },
          error => {
            showValidationAlert(Messages.generalWebServiceError);
            this.setState({ isLoading: false });
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
        title="Payment"
        left="Back"
        right={[]}
        onLeft={() => {
          this.props.navigation.goBack();
        }}
      >
        {this.state.isLoading ? <ProgressLoader /> : null}
        <View
          style={{
            flex: 1
          }}
        >
          <View style={style.subContainer}>
            <Text style={style.paymentMethodTitle}>Cash on Delivery</Text>

            <Radio
              selectedColor="#000"
              style={{ margin: 10 }}
              selected={true}
            />
          </View>
        </View>

        <View style={style.checkOutContainer}>
          <Text style={style.totalPrice}>
            {INR_SIGN + " " + this.checkoutDetail.total}
          </Text>

          <TouchableOpacity
            style={style.roundButton}
            onPress={() => {
              this.props.saveCartCount(0);
              this.checkoutDetail.order_date = Moment(new Date()).format(
                "DD-MM-YYYY hh:mm A"
              );
              console.log(
                "date 24",
                Moment(new Date()).format("DD-MM-YYYY HH:MM")
              );

              this.placeOrder();
            }}
          >
            <Text style={style.button}>CONTINUE</Text>
          </TouchableOpacity>
        </View>
      </BaseContainer>
    );
  }
}

export const style = StyleSheet.create({
  subContainer: {
    flexDirection: "row",
    margin: 10,
    backgroundColor: "#fff",
    borderRadius: 6,
    padding: 10,
    justifyContent: "center"
  },
  totalPrice: {
    flex: 1,
    fontFamily: ETFonts.regular,
    fontSize: 20,
    alignSelf: "center",
    marginLeft: 10,
    color: "#000"
  },
  roundButton: {
    alignSelf: "center",
    margin: 10,
    backgroundColor: EDColors.primary,
    borderRadius: 4
  },
  checkOutContainer: {
    flexDirection: "row",
    marginTop: 100,
    marginLeft: 10,
    marginRight: 10,
    marginBottom: 10,
    borderRadius: 6,
    alignSelf: "flex-end",
    backgroundColor: "#fff"
  },
  paymentMethodTitle: {
    flex: 1,
    fontFamily: ETFonts.regular,
    fontSize: 18,
    color: "#000",
    margin: 10
  },
  button: {
    paddingTop: 10,
    paddingRight: 20,
    paddingLeft: 20,
    paddingBottom: 10,
    color: "#fff",
    fontFamily: ETFonts.regular
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
      },
      saveCartCount: data => {
        dispatch(saveCartCount(data));
      }
    };
  }
)(PaymentContainer);
