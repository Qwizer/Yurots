import React from "react";
import {
  View,
  TouchableOpacity,
  TextInput,
  Text,
  FlatList,
  Image,
  ScrollView
} from "react-native";
import {
  REGISTRATION_HOME,
  GOOGLE_API_KEY,
  RESPONSE_SUCCESS
} from "../utils/Constants";
import { apiPost } from "../api/ServiceManager";
import BaseContainer from "./BaseContainer";
import { EDColors } from "../assets/Colors";
import Assets from "../assets";
import RestaurantEventBookCard from "../components/RestaurantEventBookCard";
import ProgressLoader from "../components/ProgressLoader";
import Geocoder from "react-native-geocoding";
import { getUserToken } from "../utils/AsyncStorageHelper";
import { showValidationAlert, showDialogue } from "../utils/CMAlert";
import { Messages } from "../utils/Messages";
import DataNotAvailableContainer from "../components/DataNotAvailableContainer";
import { netStatus } from "../utils/NetworkStatusConnection";
import { ETFonts } from "../assets/FontConstants";
import Geolocation from "@react-native-community/geolocation";

export default class BookingAvailabilityContainer extends React.Component {
  constructor(props) {
    super(props);
  }
  state = {
    isLoading: false,
    latitude: "",
    longitude: "",
    error: ""
  };

  componentDidMount() {
    getUserToken(
      success => {
        headerPhoneNum = success.PhoneNumber;
      },
      failure => { }
    );
    // netStatus(status => {
    //   if (status) {
    //     Geocoder.init(GOOGLE_API_KEY);
    //     this.setState({ isLoading: true });
    //     Geolocation.getCurrentPosition(
    //       position => {
    //         this.setState({ isLoading: false });
    //         this.setState({
    //           latitude: position.coords.latitude,
    //           longitude: position.coords.longitude,
    //           error: null
    //         });
    //         this.loadData(this.state.latitude, this.state.longitude, "");
    //       },
    //       error => {
    //         this.setState({ isLoading: false });
    //         this.setState({ error: error.message });
    //       },
    //       { enableHighAccuracy: false, timeout: 20000, maximumAge: 1000 }
    //     );
    //   } else {
    //     showValidationAlert(Messages.internetConnnection);
    //   }
    // });
    this.reloadData()
  }

  reloadData = () => {
    netStatus(status => {
      if (status) {
        if (GOOGLE_API_KEY !== "") {
          Geocoder.init(GOOGLE_API_KEY);
          this.setState({ isLoading: true });
          Geolocation.getCurrentPosition(
            position => {
              this.setState({ isLoading: false });
              this.setState({
                latitude: position.coords.latitude,
                longitude: position.coords.longitude,
                error: null
              });
              this.loadData(this.state.latitude, this.state.longitude, "");
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
      } else {
        showValidationAlert(Messages.internetConnnection);
      }
    });
  }

  loadData(lat, long, searchText) {
    this.setState({ isLoading: true });
    apiPost(
      REGISTRATION_HOME,
      {
        latitude: lat,
        longitude: long,
        itemSearch: searchText,
        token: headerPhoneNum,
        isEvent: 1
      },
      resp => {
        if (resp != undefined) {
          if (resp.status == RESPONSE_SUCCESS) {
            if (resp.restaurant != undefined && resp.restaurant.length > 0) {
              this.arrayRestaurants = resp.restaurant;
            } else {
              this.arrayRestaurants = [];
            }

            console.log("data success", resp.restaurant);
            this.setState({ isLoading: false });
          } else {
            this.arrayRestaurants = [];
            showValidationAlert(resp.message);
            this.setState({ isLoading: false });
          }
        } else {
          this.arrayRestaurants = [];
          showValidationAlert(Messages.generalWebServiceError);
          this.setState({ isLoading: false });
        }
      },
      err => {
        showValidationAlert(Messages.internetConnnection);
        this.setState({ isLoading: false });
      }
    );
  }

  render() {
    return (
      <BaseContainer
        title="Event Booking"
        left="Menu"
        right={[]}
        onLeft={() => {
          this.props.navigation.openDrawer();
        }}
      >
        {this.state.isLoading ? <ProgressLoader /> : null}
        <View style={{ flex: 1 }}>
          <ScrollView
            showsVerticalScrollIndicator={false}
            style={{ marginBottom: 10 }}
          >
            <View
              style={{
                backgroundColor: "white",
                height: 40,
                margin: 10,
                borderRadius: 5,
                flexDirection: "row",
                alignItems: "center"
              }}
            >
              <View
                style={{
                  backgroundColor: EDColors.primary,
                  height: "100%",
                  paddingLeft: 15,
                  paddingRight: 15,
                  alignItems: "center",
                  justifyContent: "center",
                  borderBottomStartRadius: 5,
                  borderTopStartRadius: 5
                }}
              >
                <Image source={Assets.ic_location} style={{}} />
              </View>
              <TextInput
                style={{ fontSize: ETFonts.regular, fontSize: 14 }}
                numberOfLines={1}
                placeholder="Nearby Restaurants"
                style={{
                  flex: 2,
                  paddingLeft: 5
                }}
                onChangeText={newText => {
                  this.strSearch = newText;
                }}
              />
              <TouchableOpacity
                style={{
                  marginLeft: 10,
                  marginEnd: 10
                }}
                onPress={() => {
                  if (
                    this.strSearch != undefined &&
                    this.strSearch != "" &&
                    this.strSearch.length > 0
                  ) {
                    this.loadData("", "", this.strSearch);
                  } else {
                    this.loadData(
                      this.state.latitude,
                      this.state.longitude,
                      ""
                    );
                  }
                }}
              >
                <Image
                  source={Assets.ic_search}
                  resizeMode="contain"
                  style={{
                    flex: 1,
                    width: 20,
                    height: 20
                  }}
                />
              </TouchableOpacity>
            </View>
            {this.arrayRestaurants != undefined &&
              this.arrayRestaurants != null &&
              this.arrayRestaurants.length > 0 ? (
                <FlatList
                  data={this.arrayRestaurants}
                  renderItem={(item, index) => {
                    return (
                      <RestaurantEventBookCard
                        restObjModel={item}
                        onPress={model => {
                          this.props.navigation.navigate("EventBookContainer", {
                            data: model
                          });
                        }}
                      />
                    );
                  }}
                  keyExtractor={(item, index) => item + index}
                />
              ) : this.arrayRestaurants != undefined &&
                this.arrayRestaurants != null &&
                this.arrayRestaurants.length == 0 ? (
                  <DataNotAvailableContainer />
                ) : (
                  // <View />
                  <View style={{ flex: 1 }}>
                    {this.state.isLoading ? null :
                      <TouchableOpacity style={{ alignSelf: 'center', backgroundColor: EDColors.primary, padding: 10, marginVertical: 100 }} onPress={() => this.reloadData()}>
                        {/* <Image
                    source = {Assets.refresh}/> */}
                        <Text style={{ color: EDColors.white }}>
                          {"Reload"}
                        </Text>
                      </TouchableOpacity>
                    }
                  </View>
                )}
          </ScrollView>
        </View>
      </BaseContainer>
    );
  }
}
