import React from "react";
import { View, Image, StyleSheet, ScrollView, FlatList } from "react-native";
import BaseContainer from "./BaseContainer";
import { showValidationAlert } from "../utils/CMAlert";
import Assets from "../assets";
import RightSearchBox from "../components/RightSearchBox";
import FoodOverview from "../components/FoodOverview";
import { apiPost } from "../api/APIManager";
import {
  RESPONSE_SUCCESS,
  RESPONSE_FAIL,
  GET_RECIPE_LIST
} from "../utils/Constants";
import ProgressLoader from "../components/ProgressLoader";
import { ETFonts } from "../assets/FontConstants";
import DataNotAvailableContainer from "../components/DataNotAvailableContainer";
import { Messages } from "../utils/Messages";
import { netStatus } from "../utils/NetworkStatusConnection";

export default class RecipeContainer extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      isLoading: false
    };

    this.itemSearch = "";
    this.food = "";
    this.timing = "";

    this.foodData = [];
  }

  getRecipeList() {
    netStatus(status => {
      if (status) {
        this.setState({ isLoading: true });
        apiPost(
          GET_RECIPE_LIST,
          {
            itemSearch: this.itemSearch,
            food: "" + this.food,
            timing: "" + this.timing
          },
          response => {
            if (response.error != undefined) {
              showValidationAlert(
                response.error.message != undefined
                  ? response.error.message
                  : Messages.generalWebServiceError,
                []
              );
            } else if (response.status == RESPONSE_SUCCESS) {
              this.foodData = response.items;
              this.setState({ isLoading: false });
            } else if (response.status == RESPONSE_FAIL) {
              this.foodData = [];
              this.setState({ isLoading: false });
            }
          },
          error => {
            this.foodData = [];
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

  onSearchClick() {
    this.getRecipeList();
  }

  componentDidMount() {
    this.getRecipeList();
  }

  testFunction = data => {
    this.food = data.food;
    this.timing = data.timing;

    this.getRecipeList();
  };

  rightClick = index => {
    if (index == 0) {
      this.props.navigation.navigate("Filter", {
        getFilterDetails: this.testFunction,
        filterType: "Recipe",
        food: this.food,
        time: this.timing
      });
    }
  };

  render() {
    return (
      <BaseContainer
        title="Recipe"
        left="Menu"
        right={[{ url: Assets.ic_filter }]}
        onLeft={() => {
          this.props.navigation.openDrawer();
        }}
        onRight={this.rightClick}
      >
        {this.state.isLoading ? <ProgressLoader /> : null}

        <ScrollView
          style={{ paddingBottom: 20 }}
          showsVerticalScrollIndicator={false}
        >
          <View style={style.container}>
            <Image
              source={Assets.header_placeholder}
              style={{ width: "100%", height: 200 }}
            />
            <View style={style.searchBox}>
              <RightSearchBox
                placeholder="Search Food Cuisine"
                onChangeText={text => {
                  this.itemSearch = text;
                }}
                onSearchClick={() => {
                  this.onSearchClick();
                }}
              />
            </View>

            {this.foodData != undefined && this.foodData.length > 0 ? (
              <FlatList
                data={this.foodData}
                showsHorizontalScrollIndicator={false}
                renderItem={({ item, index }) => {
                  return (
                    <FoodOverview
                      imageUrl={item.image}
                      title={item.name}
                      desc={item.menu_detail}
                      is_veg={item.is_veg}
                      onClick={() => {
                        this.props.navigation.navigate("RecipeDetail", {
                          detail: item
                        });
                      }}
                    />
                  );
                }}
                keyExtractor={(item, index) => item + index}
              />
            ) : this.foodData != undefined  ? (
                this.state.isLoading ? <View></View> : this.emptyView() 
            ) : null}
          </View>
        </ScrollView>
      </BaseContainer>
    );
  }

  emptyView() {
    return <DataNotAvailableContainer />;
  }
}

export const style = StyleSheet.create({
  container: {
    flex: 1
  },
  searchBox: {
    position: "relative",
    marginTop: -30,
    marginBottom: 10
  },
  emptyView: {
    textAlign: "center",
    textAlignVertical: "center",
    alignContent: "center",
    color: "#000",
    fontSize: 15,
    alignSelf: "center",
    fontFamily: ETFonts.regular
  }
});
