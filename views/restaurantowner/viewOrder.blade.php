@extends('admin.layouts.master')
@section("title") {{__('storeDashboard.ovTitle')}}
@endsection
@section('content')
<style>
    .content-wrapper {
        overflow: hidden;
    }
    .bill-calc-table tr td {
        padding: 6px 80px;
    }
    .td-title {
        padding-left: 15px !important;
    }
    .td-data {
        padding-right: 15px !important;
    }
</style>
<div class="content">
    <div class="row">
        <div class="col-xl-8">
            @if(\Nwidart\Modules\Facades\Module::find('ThermalPrinter') && \Nwidart\Modules\Facades\Module::find('ThermalPrinter')->isEnabled())
            <a href="{{ route('thermalprinter.printInvoice', $order->unique_order_id) }}" class="btn btn-sm btn-primary my-2 ml-2" style="color: #fff; border: 1px solid #ccc; float: right;"><i class="icon-printer mr-1"></i> {{__('thermalPrinterLang.printWithThermalPrinter')}}</a>
            @endif

            <a href="javascript:void(0)" id="printButton" class="btn btn-sm btn-primary mt-2" style="color: #fff; border: 1px solid #ccc; float: right;"><i class="icon-printer mr-1"></i>{{__('storeDashboard.ovPrint')}}</a>
                <div class="clearfix"></div>
            <div class="sidebar-category mt-1" style="box-shadow: 0 1px 6px 1px rgba(0, 0, 0, 0.05);background-color: #fff;">

                <div class="category-content" id="printThis">
                    <div href="#" class="btn btn-block content-group" style="text-align: left; background-color: #8360c3; color: #fff; border-radius: 0;"><strong style="font-size: 1.2rem;">{{ $order->unique_order_id }}</strong>
                    </div>
                    <div class="p-3">                        

                        <div class="d-flex justify-content-between">
                            <div class="form-group mb-0">
                                <h3><strong>{{ $order->restaurant->name }}</strong></h3>
                            </div>
                            <div class="form-group mb-0">
                                <label class="control-label no-margin text-semibold mr-1"><strong>{{__('storeDashboard.ovOrderPlaced')}}:</strong></label>
                                {{ $order->created_at->format('Y-m-d  - h:i A')}} 
                            </div>
                        </div>

                        <hr>

                        <div class="d-flex justify-content-center">
                            <div class="row">
                                <div class="col-md-6 col-sm-12">
                                    <div class="form-group">
                                        <label class="control-label no-margin text-semibold mr-1"><strong><h5><u>{{__('storeDashboard.ovCustomerDetails')}}</u></h5></strong></label>
                                        <br>
                                        <p><b>{{__('storeDashboard.ovName')}}: </b> {{ $order->user->name }}</p>
                                        <p><b>{{__('storeDashboard.ovEmail')}}: </b> {{ $order->user->email }}</p>
                                        <p><b>{{__('storeDashboard.ovContactNumber')}}: </b> {{ $order->user->phone }}</p>
                                        @if($order->delivery_type == 1)
                                        <p><b>{{__('storeDashboard.ovAddress')}}: </b> {{ $order->address }}</p>
                                        @if($order->order_comment != NULL)
                                            <p><b>{{__('storeDashboard.ovCommentSuggestion')}}: </b> {{ $order->order_comment }}</p>
                                        @endif
                                        @endif
                                    </div>
                                </div>

                                <div class="col-md-6 col-sm-12">
                                    <div class="form-group mb-1">
                                        <div class="d-flex justify-content-center align-items-center flex-column mb-1" style="border: 1px solid #ddd;">
                                            <div class="py-1" style="font-weight: 900;">{{__('storeDashboard.ovStatusText')}}</div>
                                            <hr style="width: 100%;" class="m-0">
                                            <div class="py-1 text-success @if ($order->orderstatus_id == 6) text-danger @endif" style="font-weight: 500;">
                                                @if ($order->orderstatus_id == 1) {{__('storeDashboard.opOrderStatus1')}} @endif
                                                @if ($order->orderstatus_id == 2) {{__('storeDashboard.opOrderStatus2')}} @endif
                                                @if ($order->orderstatus_id == 3) {{__('storeDashboard.opOrderStatus3')}} @endif
                                                @if ($order->orderstatus_id == 4) {{__('storeDashboard.opOrderStatus4')}} @endif
                                                @if ($order->orderstatus_id == 5) {{__('storeDashboard.opOrderStatus5')}} @endif
                                                @if ($order->orderstatus_id == 6) {{__('storeDashboard.opOrderStatus6')}} @endif
                                                @if ($order->orderstatus_id == 7) {{__('storeDashboard.opOrderStatus7')}} @endif
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group mb-1 mt-2">
                                    <div class="d-flex">
                                        <div class="col p-0 mr-2">
                                        <div class="d-flex justify-content-center align-items-center flex-column mb-1" style="border: 1px solid #ddd;">
                                            <div class="py-1" style="font-weight: 900;">{{__('storeDashboard.ovOrderType')}}</div>
                                            <hr style="width: 100%;" class="m-0">
                                            <div class="py-1 text-warning" style="font-weight: 500;">
                                                @if($order->delivery_type == 1)
                                                    {{__('storeDashboard.ovOrderTypeDelivery')}}
                                                @else
                                                    {{__('storeDashboard.ovOrderTypeSelfPickup')}}
                                                @endif
                                            </div>
                                        </div>
                                        </div>
                                        <div class="col p-0">
                                        <div class="d-flex justify-content-center align-items-center flex-column mb-1" style="border: 1px solid #ddd;">
                                            <div class="py-1" style="font-weight: 900;">{{__('storeDashboard.ovPaymentMode')}}</div>
                                            <hr style="width: 100%;" class="m-0">
                                            <div class="py-1 text-warning" style="font-weight: 500;">
                                                {{ $order->payment_mode }}
                                            </div>
                                        </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            </div>
                        </div>

                        @php
                        $subTotal = 0;
                        function calculateAddonTotal($addons) {
                            $total = 0;
                            foreach ($addons as $addon) {
                                $total += $addon->addon_price;
                            }
                            return $total;
                        }
                        @endphp
                        <div class="text-right">
                            <div class="form-group">
                                <div class="clearfix"></div>
                                <div class="row">
                                <div class="col-md-12 p-2 mb-3" style="background-color: #f7f8fb; float: right; text-align: left;">
                                    @foreach($order->orderitems as $item)
                                    <div>
                                    <div class="d-flex mb-1 align-items-start" style="font-size: 1.2rem;">
                                        <span class="badge badge-flat border-grey-800 text-default mr-2">x{{ $item->quantity }}</span>
                                        <strong class="mr-2" style="width: 100%;">{{ $item->name }}</strong>
                                        @php
                                        $itemTotal = ($item->price +calculateAddonTotal($item->order_item_addons)) * $item->quantity;
                                         $subTotal = $subTotal + $itemTotal;
                                        @endphp
                                        <span class="badge badge-flat border-grey-800 text-default">{{ config('settings.currencyFormat') }}{{ $itemTotal }}</span>
                                    </div>
                                    @if(count($item->order_item_addons))
                                    <div class="table-responsive">
                                        <table class="table table-striped">
                                            <thead>
                                                <tr>
                                                    <th>{{__('storeDashboard.ovTableCategory')}}</th>
                                                    <th>{{__('storeDashboard.ovTableAddon')}}</th>
                                                    <th>{{__('storeDashboard.ovTablePrice')}}</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                @foreach($item->order_item_addons as $addon)
                                                <tr>
                                                    <td>{{ $addon->addon_category_name }}</td>
                                                    <td>{{ $addon->addon_name }}</td>
                                                    <td>{{ config('settings.currencyFormat') }}{{ $addon->addon_price }}</td>
                                                </tr>
                                                @endforeach
                                            </tbody>
                                        </table>
                                        </div>
                                        @endif
                                        @if(!$loop->last)
                                            <div class="mb-2" style="border-bottom: 2px solid #c9c9c9;"></div>
                                        @endif
                                        </div>
                                    @endforeach
                                </div>
                                </div>
                            </div>
                        </div>

                        <div class="clearfix"></div>

                        <div class="float-right">
                            <table class="table table-bordered table-striped bill-calc-table">

                                    <tr>
                                        <td class="text-left td-title">{{__('storeDashboard.ovSubTotal')}}</td>
                                        <td class="text-right td-data"> {{ config('settings.currencyFormat') }}{{ $subTotal }}</td>
                                    </tr>

                                    @if($order->coupon_name != NULL)
                                        <tr>
                                            <td class="text-left td-title">{{__('storeDashboard.ovCoupon')}}</td>
                                            <td class="text-right td-data"> {{ $order->coupon_name }} @if($order->coupon_amount != NULL) ({{ config('settings.currencyFormat') }}{{ $order->coupon_amount }}) @endif</td>
                                        </tr>
                                    @endif

                                    @if($order->restaurant_charge != NULL)
                                    <tr>
                                        <td class="text-left td-title">{{__('storeDashboard.ovStoreCharge')}}</td>
                                        <td class="text-right td-data"> {{ config('settings.currencyFormat') }}{{ $order->restaurant_charge }} </td>
                                    </tr>
                                    @endif

                                    <tr>
                                        <td class="text-left td-title">{{__('storeDashboard.ovDeliveryCharge')}}</td>
                                        <td class="text-right td-data"> {{ config('settings.currencyFormat') }}{{ $order->delivery_charge }} </td>
                                    </tr>

                                    @if($order->tax != NULL)
                                        <tr>
                                            <td class="text-left td-title">{{__('storeDashboard.ovTax')}}</td>
                                            <td class="text-right td-data">{{ $order->tax }}% @if($order->tax_amount != NULL) ({{ config('settings.currencyFormat') }}{{ $order->tax_amount }}) @endif</td>
                                        </tr>
                                    @endif

                                    @if($order->wallet_amount != NULL)
                                        <tr>
                                            <td class="text-left td-title">{{__('storeDashboard.ovPaidWithWallet')}} {{ config('settings.walletName') }}</td>
                                            <td class="text-right td-data"> {{ config('settings.currencyFormat') }}{{ $order->wallet_amount }} </td>
                                        </tr>
                                    @endif


                                    @php
                                       if(!is_null($order->tip_amount)) {
                                           $total = $order->total - $order->tip_amount;
                                       } else {
                                           $total = $order->total;
                                       }
                                   @endphp
                                    <tr>
                                        <td class="text-left td-title"><b>{{ __('storeDashboard.ovTotal') }}</b></td>
                                        <td class="text-right td-data"> {{ config('settings.currencyFormat') }}{{ $total }} </td>
                                    </tr>

                                     @php
                                        if(!is_null($order->tip_amount)) {
                                            $payable = $order->payable - $order->tip_amount;
                                        } else {
                                            $payable = $order->payable;
                                        }
                                    @endphp
                                    @if($order->payable != NULL)
                                        <tr>
                                            <td class="text-left td-title">{{ __('storeDashboard.ovPayable') }}</td>
                                            <td class="text-right td-data"><b> {{ config('settings.currencyFormat') }}{{ $payable }}</b></td>
                                        </tr>
                                    @endif
                            </table>
                        </div>

                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
            <div class="mb-5 mt-3">
                <div class="col-md-12">
                    <div class="d-flex justify-content-end">
                        @if($order->orderstatus_id == 1)
                        <a href="{{ route('restaurant.acceptOrder', $order->id) }}"
                            class="mr-2 btn btn-lg acceptOrderBtn btn-primary"> {{__('storeDashboard.ovAccept')}} <i
                            class="icon-checkmark3 ml-1"></i></a>
                        <a href="{{ route('restaurant.cancelOrder', $order->id) }}"
                            class="btn btn-lg cancelOrderBtn btn-danger" data-popup="tooltip" data-placement="top" title="{{__('storeDashboard.ovTooltipCancel')}}"> {{__('storeDashboard.ovCancel')}} <i
                            class="icon-cross ml-1"></i></a>
                        @endif
                        @if($order->delivery_type == 2 && $order->orderstatus_id == 2)
                        <a href="{{ route('restaurant.markOrderReady', $order->id) }}"
                            class="btn btn-lg btn-warning"> {{__('storeDashboard.ovMarkAsReady')}} <i
                            class="icon-checkmark3 ml-1"></i></a>
                        @endif
                        @if($order->delivery_type == 2 && $order->orderstatus_id == 7)
                        <a href="{{ route('restaurant.markSelfPickupOrderAsCompleted', $order->id) }}"
                            class="btn btn-lg btn-success"> {{__('storeDashboard.ovMarkAsCompleted')}} <i
                            class="icon-checkmark3 ml-1"></i></a>
                        @endif
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $('#printButton').on('click',function(){
        $('#printThis').printThis();
    })
    //on single click, accpet order and disable button
    $('body').on("click", ".acceptOrderBtn", function(e) {
        $(this).addClass('pointer-none');
    });
    
    //on Single click donot cancel order
    $('body').on("click", ".cancelOrderBtn", function(e) {
        return false;
    });
    
    //cancel order on double click
    $('body').on("dblclick", ".cancelOrderBtn", function(e) {
        $(this).addClass('pointer-none');
        window.location = this.href;
        return false;
     });
    
    if (window.location !== window.parent.location ) 
    { 
        //hide menu, nav, header and apply custom css colors when on iFrame from dashboard v2
        $('.navbar-dark').hide();
        $('.navbar-sticky').hide();
        $("body").overlayScrollbars({
            scrollbars : {
                visibility       : "auto",
                autoHide         : "leave",
                autoHideDelay    : 500
            }
        });
    }
</script>
@endsection