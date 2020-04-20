package com.eatance;

import com.facebook.react.ReactPackage;
import com.facebook.react.bridge.NativeModule;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.uimanager.ViewManager;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class MyAppPackage implements ReactPackage {

    public MyAppPackage() {
    }

    @Override
    public List<NativeModule>
    createNativeModules(ReactApplicationContext reactContext) {
        List<NativeModule> modules = new ArrayList<NativeModule>();
        modules.add(new MyAppModule(reactContext));
        return modules;
    }

    @Override
    public List<ViewManager>
    createViewManagers(ReactApplicationContext reactApplicationContext) {
        return Collections.emptyList();
    }
}
