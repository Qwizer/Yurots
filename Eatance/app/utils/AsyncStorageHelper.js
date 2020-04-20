import { AsyncStorage } from "react-native";

export function flushAllData(onSuccess, onFailure) {
  AsyncStorage.clear().then(
    success => onSuccess(success),
    err => onFailure(err)
  );
}

export function saveUserLogin(details, onSuccess, onFailure) {
  AsyncStorage.setItem("login", JSON.stringify(details)).then(
    success => onSuccess(success),
    err => onFailure(err)
  );
}

export function saveUserFCM(details, onSuccess, onFailure) {
  AsyncStorage.setItem("token", JSON.stringify(details)).then(
    success => onSuccess(success),
    err => onFailure(err)
  );
}

export function getUserFCM(onSuccess, onFailure) {
  AsyncStorage.getItem("token").then(
    res => {
      if (res != "" && res != null && res != undefined) {
        onSuccess(JSON.parse(res));
      } else {
        onFailure("Token Null");
      }
    },
    err => onFailure(err)
  );
}

export function clearLogin(onSuccess, onError) {
  AsyncStorage.removeItem("login").then(
    response => {
      onSuccess(response);
    },
    error => {
      onError(error);
    }
  );
}

export function getUserToken(onSuccess, onFailure) {
  AsyncStorage.getItem("login").then(
    res => {
      if (res != "" && res != null && res != undefined) {
        onSuccess(JSON.parse(res));
      } else {
        onFailure("Token Null");
      }
    },
    err => onFailure(err)
  );
}

export function saveCartData(details, onSuccess, onFailure) {
 
  AsyncStorage.setItem("cartList", JSON.stringify(details)).then(
    success => {
     
      onSuccess(success);
    },
    error => onFailure(error)
  );
}

export function clearCartData(onSuccess, onError) {
  AsyncStorage.removeItem("cartList").then(
    response => {
      onSuccess(response);
    },
    error => {
      onError(error);
    }
  );
}

export function getCartList(onSuccess, onCartNotFound, onFailure) {
  AsyncStorage.getItem("cartList").then(
    response => {
      if (response != "" && response != null && response != undefined) {
       
        onSuccess(JSON.parse(response));
      } else {
        onCartNotFound(response);
      }
    },
    error => {
      onFailure(error);
    }
  );
}
