package com.eatance;

import android.app.Application;

import com.airbnb.android.react.maps.MapsPackage;
import com.facebook.react.BuildConfig;
import com.facebook.react.ReactApplication;
import com.facebook.react.ReactNativeHost;
import com.facebook.react.ReactPackage;
import com.facebook.react.shell.MainReactPackage;
import com.facebook.soloader.SoLoader;
import com.imagepicker.ImagePickerPackage;
import com.reactnativecommunity.geolocation.GeolocationPackage;
import com.reactnativecommunity.netinfo.NetInfoPackage;
import com.reactnativecommunity.webview.RNCWebViewPackage;
import com.showlocationservicesdialogbox.LocationServicesDialogBoxPackage;

import java.util.Arrays;
import java.util.List;

import cl.json.RNSharePackage;
import cl.json.ShareApplication;
import io.invertase.firebase.RNFirebasePackage;
import io.invertase.firebase.auth.RNFirebaseAuthPackage;
import io.invertase.firebase.messaging.RNFirebaseMessagingPackage;
import io.invertase.firebase.notifications.RNFirebaseNotificationsPackage;

public class MainApplication extends Application implements ShareApplication, ReactApplication {

  private final ReactNativeHost mReactNativeHost = new ReactNativeHost(this) {
    @Override
    public boolean getUseDeveloperSupport() {
      return BuildConfig.DEBUG;
    }

    @Override
    protected List<ReactPackage> getPackages() {

      return Arrays.<ReactPackage>asList(
          new MainReactPackage(),
            new NetInfoPackage(),
            new GeolocationPackage(),
            new RNCWebViewPackage(),
            new RNSharePackage(),
            new MapsPackage(),
            new ImagePickerPackage(),
            new RNFirebasePackage(),
            new LocationServicesDialogBoxPackage(),
            new RNFirebaseAuthPackage(),
            new RNFirebaseMessagingPackage(),
            new RNFirebaseNotificationsPackage(),
            new MyAppPackage()
      );
    }

    @Override
    protected String getJSMainModuleName() {
      return "index";
    }
  };

  @Override
  public ReactNativeHost getReactNativeHost() {
    return mReactNativeHost;
  }

  @Override
  public void onCreate() {
    super.onCreate();
    SoLoader.init(this, /* native exopackage */ false);
  }
    @Override
    public String getFileProviderAuthority() {
        return "com.eatance.provider";
    }
}
