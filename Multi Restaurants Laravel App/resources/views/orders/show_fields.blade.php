<!-- Id Field -->
<div class="form-group row col-md-6 col-sm-12">
  {!! Form::label('id', trans('lang.order_id'), ['class' => 'col-3 control-label']) !!}
  <div class="col-9">
    <p>#{!! $order->id !!}</p>
  </div>

  {!! Form::label('order_client', trans('lang.order_client'), ['class' => 'col-3 control-label']) !!}
  <div class="col-9">
    <p>{!! $order->user->name !!}</p>
  </div>

  {!! Form::label('order_client_phone', trans('lang.order_client_phone'), ['class' => 'col-3 control-label']) !!}
  <div class="col-9">
    <p>{!! isset($order->user->custom_fields['phone']) ? $order->user->custom_fields['phone']['view'] : "" !!}</p>
  </div>

  {!! Form::label('delivery_address', trans('lang.delivery_address'), ['class' => 'col-3 control-label']) !!}
  <div class="col-9">
    <p>{!! $order->deliveryAddress ? $order->deliveryAddress->address : '' !!}</p>
  </div>

  {!! Form::label('order_delivery_date', trans('lang.order_delivery_date'), ['class' => 'col-3 control-label']) !!}
  <div class="col-9">
    <p>{!! $order->created_at !!}</p>
  </div>


</div>

<!-- Order Status Id Field -->
<div class="form-group row col-md-6 col-sm-12">
  {!! Form::label('order_status_id', trans('lang.order_status_status'), ['class' => 'col-3 control-label']) !!}
  <div class="col-9">
    <p>{!! $order->orderStatus->status  !!}</p>
  </div>

  {!! Form::label('payment_method', trans('lang.payment_method'), ['class' => 'col-3 control-label']) !!}
  <div class="col-9">
    <p>{!! isset($order->payment) ? $order->payment->method : ''  !!}</p>
  </div>

  {!! Form::label('payment_status', trans('lang.payment_status'), ['class' => 'col-3 control-label']) !!}
  <div class="col-9">
    <p>{!! isset($order->status) ? $order->payment->status : trans('lang.order_not_paid')  !!}</p>
  </div>

  {!! Form::label('hint', 'Hint:', ['class' => 'col-3 control-label']) !!}
  <div class="col-9">
    <p>{!! $order->hint !!}</p>
  </div>

</div>

{{--<!-- Tax Field -->--}}
{{--<div class="form-group row col-md-6 col-sm-12">--}}
{{--  {!! Form::label('tax', 'Tax:', ['class' => 'col-3 control-label']) !!}--}}
{{--  <div class="col-9">--}}
{{--    <p>{!! $order->tax !!}</p>--}}
{{--  </div>--}}
{{--</div>--}}


