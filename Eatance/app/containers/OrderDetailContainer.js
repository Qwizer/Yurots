import React from "react";
import { View, FlatList, Text, ScrollView } from "react-native";
import BaseContainer from "./BaseContainer";
import EDThemeButton from "../components/EDThemeButton";
import {
  getUserToken,
  getCartList,
  saveCartData,
  clearCartData
} from "../utils/AsyncStorageHelper";
import { showValidationAlert, showDialogue } from "../utils/CMAlert";
import {
  funGetDateStr,
  INR_SIGN,
  CART_PENDING_ITEMS
} from "../utils/Constants";
import { EDColors } from "../assets/Colors";
import PriceDetail from "../components/PriceDetail";
import ETextViewNormalLable from "../components/ETextViewNormalLable";
import { ETFonts } from "../assets/FontConstants";
import OrderItem from "../components/OrderItem";

export default class OrderDetailContainer extends React.Component {
  constructor(props) {
    super(props);
    var userObj = null;
    orderItem = this.props.navigation.state.params.OrderItem;
    console.log("ORDER DETAIL ::::::::::::::::::: ", orderItem)
  }

  componentDidMount() {
    this.checkUser();
  }
  checkUser() {
    getUserToken(
      success => {
        userObj = success;
      },
      failure => {
        showValidationAlert("Please Login");
      }
    );
  }

  render() {
    return (
      <BaseContainer
        title="Order Detail"
        left="Back"
        right={[]}
        onLeft={() => {
          this.props.navigation.goBack();
        }}
      >
        <ScrollView
            // showsVerticalScrollIndicator={false}
            // style={{ marginBottom: 10 }}
          >
        <View style={{ flex: 1 }}>
          <View
            style={{
              borderRadius: 6,
              backgroundColor: EDColors.white,
              margin: 10,
              padding: 2
            }}
          >
            <View
              style={{
                margin: 5,
                flexDirection: "row",
                alignItems: "center"
              }}
            >
              <Text
                style={{
                  flex: 1,
                  color: EDColors.black,
                  fontSize: 16,
                  fontFamily: ETFonts.regular
                }}
              >
                {"Order No -" + orderItem.order_id}
              </Text>
              <Text
                style={{
                  fontSize: 14,
                  marginLeft: 5,
                  marginRight: 5,
                  fontFamily: ETFonts.regular
                }}
              >
                {funGetDateStr(orderItem.order_date, "DD-MMM")}
              </Text>

              <EDThemeButton
                label="REORDER"
                buttonWidth={100}
                fontSizeNew={5}
                onPress={() => {
                  if(orderItem.timings.closing.toLowerCase() !== "open"){
                    showDialogue("Currently this restaurant is not accepting orders.",[],"") 
                  }else{
                    this.storeData(orderItem);
                  }
                }}
              />
            </View>
            <Text
              style={{
                margin: 5,
                color: EDColors.black,
                fontSize: 15,
                fontFamily: ETFonts.regular
              }}
            >
              {"Status : " + orderItem.order_status}
            </Text>
            <FlatList
              data={orderItem.items}
              listKey={(item, index) => "Q" + index.toString()}
              renderItem={({ item, index }) => {
                return (
                  <View style={{ flex: 1 }}>
                    <OrderItem
                      itemImage={item.image}
                      itemName={item.name}
                      quantity={"Qty: " + item.quantity}
                      price={INR_SIGN + " " + item.price}
                      isVeg={item.is_veg}
                    />
                  </View>
                );
              }}
              keyExtractor={(item, index) => item + index}
            />
          </View>
          <View
            style={{
              borderRadius: 6,
              backgroundColor: EDColors.white,
              marginLeft: 10,
              marginRight: 10,
              padding: 2
            }}
          >
            <ETextViewNormalLable text="Amount Paid" />
            <View
              style={{
                flex: 1,
                flexDirection: "row",
                marginTop: 5
              }}
            >
              <View
                style={{
                  backgroundColor: EDColors.black,
                  height: 0.5,
                  flex: 1,
                  alignSelf: "center",
                  marginLeft: 10,
                  marginRight: 10
                }}
              />
            </View>

            <FlatList
              data={orderItem.price}
              listKey={(item, index) => "Q" + index.toString()}
              renderItem={({ item, index }) => {
                return (
                  <View style={{ flex: 1 }}>
                    <PriceDetail
                      title={item.label}
                      price={
                        item.label.includes("total") ||
                        item.label.includes("Total")
                          ? INR_SIGN + " " + item.value
                          : item.value
                      }
                    />
                  </View>
                );
              }}
              keyExtractor={(item, index) => item + index}
            />
          </View>
        </View>
        </ScrollView>
      </BaseContainer>
    );
  }

  storeData(data) {
    var cartData = {};

    getCartList(
      success => {
        if (success.items.length === 0 ) {
          clearCartData(success => {
            cartData = {
              resId: data.restaurant_id,
              items: data.items,
              coupon_name: "",
              cart_id: 0
            };
            this.saveData(cartData);
          });
        } else {
          showValidationAlert(CART_PENDING_ITEMS);
        }
      },
      onCartNotFound => {
        cartData = {
          resId: data.restaurant_id,
          items: data.items,
          coupon_name: "",
          cart_id: 0
        };
        this.saveData(cartData);
      },
      error => {}
    );
  }

  saveData(data) {
    saveCartData(
      data,
      success => {
        this.props.navigation.popToTop()
        this.props.navigation.navigate("CartContainer");
      },
      fail => {}
    );
  }
}
