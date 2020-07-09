<?php

namespace App\Http\Controllers;

use App\User;
use App\DeliveryGuyDetail;
use Auth;
use Exception;
use Illuminate\Http\Request;

class RegisterController extends Controller
{
    /**
     * @param Request $request
     */
    public function registerRestaurantDelivery(Request $request)
    {
        // dd($request->all());
        $rules = [
            'captcha' => ['required', 'captcha'],
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'max:255', 'unique:users'],
            'phone' => ['required', 'string', 'min:1'],
            'password' => ['required', 'string', 'min:1'],
        ];
        $validator = validator()->make(request()->all(), $rules);
        if ($validator->fails()) {
            // return redirect()->back()->withErrors($validator);
            return redirect()->back()->with(['message' => 'Something went wrong. Please try again.']);
        } else {

            try {
                $user = User::create([
                    'name' => $request->name,
                    'email' => $request->email,
                    'phone' => $request->phone,
                    'delivery_pin' => strtoupper(str_random(5)),
                    'password' => \Hash::make($request->password),
                ]);

                if ($request->has('role')) {
                    if ($request->role == 'DELIVERY') {
                        $user->assignRole('Delivery Guy');
                        $deliveryGuyDetails = new DeliveryGuyDetail();
                        $deliveryGuyDetails->name = $request->name;
                        $deliveryGuyDetails->description = $request->delivery_description;
                        $deliveryGuyDetails->vehicle_number = $request->delivery_vehicle_number;
                        $deliveryGuyDetails->save();
                        
                        $user->delivery_guy_detail_id = $deliveryGuyDetails->id;
                        $user->save();
                        //return session message...
                        return redirect()->back()->with(['delivery_register_message' => 'Delivery User Registered', 'success' => 'Delivery User Registered']);
                    }
                    if ($request->role == 'RESOWN') {
                        $user->assignRole('Restaurant Owner');
                        // login and redirect to dashbaord...
                        Auth::loginUsingId($user->id);
                    }
                }
                return redirect()->back()->with(['success' => 'User Created']);

            } catch (\Illuminate\Database\QueryException $qe) {
                return redirect()->back()->with(['message' => 'Something went wrong. Please try again.']);
            } catch (Exception $e) {
                return redirect()->back()->with(['message' => 'Something went wrong. Please try again.']);
            } catch (\Throwable $th) {
                return redirect()->back()->with(['message' => 'Something went wrong. Please try again.']);
            }
        }
    }
}
