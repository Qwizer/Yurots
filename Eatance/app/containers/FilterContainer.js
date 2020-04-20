import React from "react";
import { View, StyleSheet } from "react-native";
import RadioGroupWithHeader from "../components/RadioGroupWithHeader";
import BaseContainer from "./BaseContainer";
import ETSlider from "../components/ETSlider";
import TextviewRadius from "../components/TextviewRadius";

export default class FilterContainer extends React.PureComponent {
  constructor(props) {
    super(props);

    this.cookTime = this.props.navigation.state.params.time || 30;
    this.recipeType = this.props.navigation.state.params.food;
    this.distance = this.props.navigation.state.params.distance || 5;
    this.priceType = this.props.navigation.state.params.price;
  }

  state = {
    foodType: [
      {
        label: "Both",
        size: 15,
        selected: this.props.navigation.state.params.food === "" ? true : false
      },
      {
        label: "Veg",
        size: 15,
        selected: this.props.navigation.state.params.food == 1 ? true : false
      },
      {
        label: "Non-Veg",
        size: 15,
        selected: this.props.navigation.state.params.food == 0 ? true : false
      }
    ],
    priceSort: [
      {
        label: "High to low",
        size: 15,
        selected: this.props.navigation.state.params.price == 1 ? true : false
      },
      {
        label: "Low to High",
        size: 15,
        selected: this.props.navigation.state.params.price == 0 ? true : false
      }
    ],
    sendFilterDetailsBack: this.props.navigation.state.params.getFilterDetails,
    filterType: this.props.navigation.state.params.filterType
  };

  applyFilter(data) {
    if (this.state.sendFilterDetailsBack != undefined) {
      this.state.sendFilterDetailsBack(data);
    }
    this.props.navigation.goBack();
  }

  render() {
    return (
      <BaseContainer
        title="Filter"
        left="Back"
        right={[]}
        onLeft={() => {
          this.props.navigation.goBack();
        }}
      >
        <View style={{ flex: 8 }}>
          <RadioGroupWithHeader
            data={this.state.foodType}
            title={
              this.state.filterType == "Main" || this.state.filterType == "menu"
                ? "Type of Food"
                : "Type of Recipe"
            }
            onSelected={selected => {
              this.recipeType = selected;
            }}
          />

          {this.state.filterType == "Main" ? (
            <ETSlider
              title="Sort By Distance"
              onSlide={values => {
                this.distance = values;
              }}
              max={5}
              initialValue={this.distance}
              valueType="km"
            />
          ) : this.state.filterType == "Recipe" ? (
            <ETSlider
              title="Cooking Time"
              onSlide={values => {
                this.cookTime = values;
              }}
              max={240}
              min={5}
              initialValue={this.cookTime}
              valueType="min"
            />
          ) : (
            <RadioGroupWithHeader
              data={this.state.priceSort}
              title="Sort By Price"
              onSelected={selected => {
                this.priceType = selected;
              }}
            />
          )}
        </View>
        <View
          style={{
            flexDirection: "row",
            alignSelf: "center",
            flex: 1
          }}
        >
          <TextviewRadius
            text="APPLY FILTER"
            onPress={() => {
              if (this.state.filterType == "Main") {
                var data = {
                  food:
                    this.recipeType == "Veg" || this.recipeType === 1
                      ? 1
                      : this.recipeType == "Non-Veg" || this.recipeType === 0
                      ? 0
                      : "",
                  distance: this.distance != "" ? this.distance : ""
                };
                this.applyFilter(data);
              } else if (this.state.filterType == "Recipe") {
                var data = {
                  food:
                    this.recipeType == "Veg"  || this.recipeType === 1
                      ? 1
                      : this.recipeType == "Non-Veg" || this.recipeType === 0
                      ? 0
                      : "",
                  timing: this.cookTime != "" ? this.cookTime : ""
                };
                this.applyFilter(data);
              } else {
                var data = {
                  food:
                    this.recipeType == "Veg"  || this.recipeType === 1
                      ? 1
                      : this.recipeType == "Non-Veg" || this.recipeType === 0
                      ? 0
                      : "",
                  price: this.priceType == "High to low" ? 1 : 0
                };
              }
              this.applyFilter(data);
            }}
          />
          <TextviewRadius
            text="RESET"
            onPress={() => {
              if (this.state.filterType == "Main") {
                var data = {
                  food: "",
                  distance: ""
                };
                this.applyFilter(data);
              } else if (this.state.filterType == "Recipe") {
                var data = {
                  food: "",
                  timing: ""
                };
                this.applyFilter(data);
              } else {
                var data = {
                  food: "",
                  price: 0
                };
              }
              this.applyFilter(data);
            }}
          />
        </View>
      </BaseContainer>
    );
  }
}

export const style = StyleSheet.create({
  container: {
    flex: 1
  }
});
