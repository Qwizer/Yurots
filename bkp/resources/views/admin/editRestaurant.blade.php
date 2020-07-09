@extends('admin.layouts.master')
@section("title") Editar Loja - Dashboard
@endsection
@section('content')
<style>
    .delivery-div {
        background-color: #fafafa;
        padding: 1rem;
    }
    .location-search-block {
        position: relative;
        top: -26rem;
        z-index: 999;
    }
</style>
<div class="page-header">
    <div class="page-header-content header-elements-md-inline">
        <div class="page-title d-flex">
            <h4><i class="icon-circle-right2 mr-2"></i>
                <span class="font-weight-bold mr-2">Editando</span>
                <span class="badge badge-primary badge-pill animated flipInX">"{{ $restaurant->name }}"</span>
            </h4>
            <a href="#" class="header-elements-toggle text-default d-md-none"><i class="icon-more"></i></a>
        </div>
    </div>
</div>
<div class="content">
    <div class="col-md-8">
        <div class="card">
            <div class="card-body">
                <form action="{{ route('admin.updateRestaurant') }}" method="POST" enctype="multipart/form-data">
                    <legend class="font-weight-semibold text-uppercase font-size-sm">
                        <i class="icon-address-book mr-2"></i> Detalhes do Loja
                    </legend>
                    <input type="hidden" name="id" value="{{ $restaurant->id }}">
                    <div class="form-group row">
                        <label class="col-lg-3 col-form-label"><span class="text-danger">*</span>Nome do Loja:</label>
                        <div class="col-lg-9">
                            <input value="{{ $restaurant->name }}" type="text" class="form-control form-control-lg" name="name"
                                placeholder="Nome do Loja" required>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-lg-3 col-form-label"><span class="text-danger">*</span>Descrição:</label>
                        <div class="col-lg-9">
                            <input value="{{ $restaurant->description }}" type="text" class="form-control form-control-lg" name="description"
                                placeholder="Descrição curta do Loja" required>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-lg-3 col-form-label">Imagem:</label>
                        <div class="col-lg-9">
                            <img src="{{ substr(url("/"), 0, strrpos(url("/"), '/')) }}{{ $restaurant->image }}" alt="Imagem" width="160" style="border-radius: 0.275rem;">
                            <img class="slider-preview-image hidden" style="border-radius: 0.275rem;"/>
                            <div class="uploader">
                                <input type="hidden" name="old_image" value="{{ $restaurant->image }}">
                                <input type="file" class="form-control-uniform" name="image" accept="image/x-png,image/gif,image/jpeg" onchange="readURL(this);">
                                <span class="help-text text-muted">Tamanho: 160x117</span>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-lg-3 col-form-label"><span class="text-danger">*</span>Avaliação:</label>
                        <div class="col-lg-9">
                            <input value="{{ $restaurant->rating }}" type="text" class="form-control form-control-lg rating" name="rating"
                                placeholder="Rating from 1-5" required>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-lg-3 col-form-label"><span class="text-danger">*</span>Tempo aproximado de entrega:</label>
                        <div class="col-lg-9">
                            <input value="{{ $restaurant->delivery_time }}" type="text" class="form-control form-control-lg delivery_time" name="delivery_time"
                                placeholder="Em minutos" required>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-lg-3 col-form-label"><span class="text-danger">*</span>Preço aproximado para dois:</label>
                        <div class="col-lg-9">
                            <input value="{{ $restaurant->price_range }}" type="text" class="form-control form-control-lg price_range" name="price_range"
                                placeholder="Preço aproximado para dois em {{ config('settings.currencyFormat') }}" required>
                        </div>
                    </div>
                    <hr>
                    <div class="form-group row">
                        <label class="col-lg-3 col-form-label"><span class="text-danger">*</span>Endereço completo:</label>
                        <div class="col-lg-9">
                            <input value="{{ $restaurant->address }}" type="text" class="form-control form-control-lg" name="address"
                                placeholder="Endereço completo do Loja" required>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-lg-3 col-form-label" data-popup="tooltip" title="CEP" data-placement="bottom">CEP:</label>
                        <div class="col-lg-9">
                            <input value="{{ $restaurant->pincode }}" type="text" class="form-control form-control-lg" name="pincode"
                                placeholder="CEP">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-lg-3 col-form-label">Ponto de referência:</label>
                        <div class="col-lg-9">
                            <input value="{{ $restaurant->landmark }}" type="text" class="form-control form-control-lg" name="landmark"
                                placeholder="Algum ponto de referência">
                        </div>
                    </div>
                    <fieldset class="gllpLatlonPicker">
                        {{-- <div width="100%" id="map" class="gllpMap" style="position: relative; overflow: hidden;"></div> --}}
                        <div class="form-group row">
                            <div class="col-lg-6">
                                <label class="col-form-label">Latitude:</label><input type="text" class="form-control form-control-lg gllpLatitude latitude" value="{{ $restaurant->latitude }}" name="latitude" placeholder="Latitude do Loja" required="required">
                            </div>
                            <div class="col-lg-6">
                                <label class="col-form-label">Longitude:</label><input type="text" class="form-control form-control-lg gllpLongitude longitude" value="{{ $restaurant->longitude }}" name="longitude" placeholder="Longitude do Loja" required="required">
                            </div>
                        </div>
                        {{-- <input type="hidden" class="gllpZoom" value="20">
                        <div class="d-flex justify-content-center">
                            <div class="col-lg-6 d-flex location-search-block">       
                                <input type="text" class="form-control form-control-lg gllpSearchField" placeholder="Search for resraurant, city or town...">
                                <button type="button" class="btn btn-primary gllpSearchButton">Pesquisar</button>
                            </div>
                        </div> --}}
                        <span class="text-muted">Você pode usar servidos como: <a href="https://www.mapcoordinates.net/en">https://www.mapcoordinates.net/en</a></span> <br> Se você colocar as coordenadas erradas poderá resultar em erro de tela branca.
                    </fieldset>
                    <hr>
                    <div class="form-group row">
                        <label class="col-lg-3 col-form-label">Tarifas do Loja (Entrega/Extras):</label>
                        <div class="col-lg-9">
                            <input value="{{ $restaurant->restaurant_charges }}" type="text" class="form-control form-control-lg restaurant_charges" name="restaurant_charges"
                                placeholder="Tarifas em {{ config('settings.currencyFormat') }}">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-lg-3 col-form-label">Cashback:</label>
                        <div class="col-lg-9">
                            <input value="{{ $restaurant->cashback }}" type="text" class="form-control form-control-lg restaurant_charges" name="cashback"
                                placeholder="Cashback em %">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-lg-3 col-form-label">WhatsApp:</label>
                        <div class="col-lg-9">
                            <input value="{{ $restaurant->certificate }}" type="text" class="form-control form-control-lg" name="certificate"
                                placeholder="Digite o número com ddd e sem (, - ou espaços">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-lg-3 col-form-label">É vegetariano?</label>
                        <div class="col-lg-9">
                            <div class="checkbox checkbox-switchery mt-2">
                                <label>
                                <input value="true" type="checkbox" class="switchery-primary" @if($restaurant->is_pureveg) checked="checked" @endif name="is_pureveg">
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-lg-3 col-form-label"><span class="text-danger">*</span>Taxa de comissão %:</label>
                        <div class="col-lg-9">
                            <input value="{{ $restaurant->commission_rate }}" type="text" class="form-control form-control-lg commission_rate" name="commission_rate"
                                placeholder="Taxa de comissão %" required>
                        </div>
                    </div>
                    @if(config("settings.enSPU") == "true")
                    <div class="form-group row">
                        <label class="col-lg-3 col-form-label"><span class="text-danger">*</span>Tempo de entrega:</label>
                        <div class="col-lg-9">
                            <select class="form-control select-search" name="delivery_type" required>
                            <option value="1" class="text-capitalize" @if($restaurant->delivery_type == "1") selected="selected" @endif>Entrega</option>
                            <option value="2" class="text-capitalize" @if($restaurant->delivery_type == "2") selected="selected" @endif>Retirada</option>
                            <option value="3" class="text-capitalize" @if($restaurant->delivery_type == "3") selected="selected" @endif>Ambos Entrega e Retirada</option>
                            </select>
                        </div>
                    </div>
                    @endif
                     <div class="form-group row">
                        <label class="col-lg-3 col-form-label">Raio de entrega em KM's:</label>
                        <div class="col-lg-9">
                            <input type="text" value="{{ $restaurant->delivery_radius }}" class="form-control form-control-lg delivery_radius" name="delivery_radius"
                                placeholder="Raio de entrega em KM (Se deixado em branco, o padrão será de 10Km)">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-lg-3 col-form-label"><span class="text-danger">*</span>Tipo de taxa de entrega:</label>
                        <div class="col-lg-9">
                            <select class="form-control select-search" name="delivery_charge_type" required>
                            <option value="FIXED" @if($restaurant->delivery_charge_type == "FIXED") selected="selected" @endif class="text-capitalize">Taxa Fixa</option>
                            <option value="DYNAMIC" @if($restaurant->delivery_charge_type == "DYNAMIC") selected="selected" @endif class="text-capitalize">Taxa Dinâmica</option>
                            </select>
                        </div>
                    </div>
                    
                    
                    <div class="form-group row" id="deliveryCharge">
                        <label class="col-lg-3 col-form-label">Taxa de Entrega:</label>
                        <div class="col-lg-9">
                            <input value="{{ $restaurant->delivery_charges }}" type="text" class="form-control form-control-lg delivery_charges" name="delivery_charges"
                                placeholder="Delivery Charge in {{ config('settings.currencyFormat') }}">
                        </div>
                    </div>
                    
                    <div id="dynamicChargeDiv">
                        <div class="form-group">
                            <div class="col-lg-12 row">
                                <div class="col-lg-3">
                                    <label class="col-lg-12 col-form-label">Taxa básica de entrega:</label>
                                    <input value="{{ $restaurant->base_delivery_charge }}" type="text" class="form-control form-control-lg base_delivery_charge" name="base_delivery_charge"
                                    placeholder="In {{ config('settings.currencyFormat') }}">
                                </div>
                                
                                <div class="col-lg-3">
                                    <label class="col-lg-12 col-form-label">Distância Base de Entrega:</label>
                                    <input value="{{ $restaurant->base_delivery_distance }}" type="text" class="form-control form-control-lg base_delivery_distance" name="base_delivery_distance"
                                    placeholder="In Kilometer (KM)">
                                </div>
                                <div class="col-lg-3">
                                    <label class="col-lg-12 col-form-label">Taxa de entrega extra:</label>
                                    <input value="{{ $restaurant->extra_delivery_charge }}" type="text" class="form-control form-control-lg extra_delivery_charge" name="extra_delivery_charge"
                                    placeholder="In {{ config('settings.currencyFormat') }}">
                                </div>
                                
                                <div class="col-lg-3">
                                    <label class="col-lg-12 col-form-label">Distância de Entrega Extra:</label>
                                     <input value="{{ $restaurant->extra_delivery_distance }}" type="text" class="form-control form-control-lg extra_delivery_distance" name="extra_delivery_distance" placeholder="In Kilometer (KM)">
                                </div>
                            </div>
                            <p class="help-text mt-2 mb-0 text-muted"> As taxas de entrega base serão aplicadas à distância de entrega base. E para cada distância extra de entrega, será aplicada uma taxa de entrega extra.</span>
                        </div>
                    </div>
                    

                    <div class="form-group row">
                        <label class="col-lg-3 col-form-label">Categorias de Lojas: </label>
                        <div class="col-lg-9">
                            @foreach($restaurant->restaurant_categories as $resCat)
                            <span class="badge badge-flat border-grey-800" style="font-size: 0.9rem;">{{ $resCat->name }}
                            </span>
                            @endforeach
                           <select multiple="multiple" class="form-control select" data-fouc name="restaurant_category_restaurant[]">
                        @foreach($restaurantCategories as $rC)
                        <option value="{{ $rC->id }}" class="text-capitalize">{{ $rC->name }}</option>
                        @endforeach
                        </select>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="col-lg-3 col-form-label">Destacar?</label>
                        <div class="col-lg-9">
                            <div class="checkbox checkbox-switchery mt-2">
                                <label>
                                <input value="true" type="checkbox" class="switchery-primary" @if($restaurant->is_featured) checked="checked" @endif name="is_featured">
                                </label>
                            </div>
                        </div>
                    </div>
                    
                    <div class="form-group row">
                        <label class="col-lg-3 col-form-label">Pedido Mínimo</label>
                        <div class="col-lg-9">
                               <input required value="{{ $restaurant->min_order_price }}" type="text" class="form-control form-control-lg min_order_price" name="min_order_price"
                                placeholder="Min Cart Value before discount and tax {{ config('settings.currencyFormat') }}">
                        </div>
                    </div>
                    
                    <div class="form-group row">

                        <label class="col-lg-12 col-form-label"><span class="text-danger">*</span>Concordo em pagar o entregador no ato da retirada do produto e que o valor da entrega não deve ser menos que 3 reais.</label>

                        <div class="col-lg-12">

                            <select class="form-control select-search" name="motoboy" required>

                                <option <?=($restaurant->motoboy == 'N' ? 'selected' : '')?> value="N" class="text-capitalize">Não</option>
                                <option <?=($restaurant->motoboy == 'S' ? 'selected' : '')?> value="S" class="text-capitalize">Sim</option>

                            </select>

                        </div>

                    </div>
                    <div class="form-group row">

                        <label class="col-lg-3 col-form-label"><span class="text-danger">*</span>Motoboy próprio? cadastre ele..</label>

                        <div class="col-lg-9">

                            <div class="form-group form-group-feedback form-group-feedback-left">

                                <input type="text" class="form-control" placeholder="Nome completo" name="motoboy_name">

                                <div class="form-control-feedback">

                                    <i class="icon-user text-muted"></i>

                                </div>

                            </div>

                            <div class="form-group form-group-feedback form-group-feedback-left">

                                <input type="text" class="form-control" placeholder="Email" name="motoboy_email">

                                <div class="form-control-feedback">

                                    <i class="icon-mail5 text-muted"></i>

                                </div>

                            </div>

                            <div class="form-group form-group-feedback form-group-feedback-left">

                                <input type="number" class="form-control" placeholder="Telefone" name="motoboy_phone" min="8">

                                <div class="form-control-feedback">

                                    <i class="icon-mobile text-muted"></i>

                                </div>

                            </div>

                            <div class="form-group form-group-feedback form-group-feedback-left">

                                <input type="password" class="form-control" placeholder="Senha" name="motoboy_password">

                                <div class="form-control-feedback">

                                    <i class="icon-lock2 text-muted"></i>

                                </div>

                            </div>
                            
                <div class="form-group form-group-feedback form-group-feedback-left">
                    <input type="text" class="form-control form-control-lg" name="delivery_description" placeholder="Digite a CNH do entregador">
                    <div class="form-control-feedback">
                        <i class="icon-lock2 text-muted"></i>
                    </div>
                </div>
                <div class="form-group form-group-feedback form-group-feedback-left">
                    <input type="text" class="form-control form-control-lg" name="delivery_vehicle_number" placeholder="Digite o número do veículo do entregador">
                    <div class="form-control-feedback">
                        <i class="icon-lock2 text-muted"></i>
                    </div>
                </div>

                        </div>

                    </div>
                    
                     <fieldset class="gllpLatlonPicker">

                        <div class="form-group row">

                            <div class="col-lg-4">

                                <label class="col-form-label">Banco:</label>
                                 <input value="{{ $restaurant->banco }}" type="text" class="form-control form-control-lg" name="banco" required="required">
                            </div>

                            <div class="col-lg-4">

                                <label class="col-form-label">Agência:</label>
                                <input value="{{ $restaurant->agencia }}" type="text" class="form-control form-control-lg" name="agencia" required="required">

                            </div>
                            
                            <div class="col-lg-4">

                                <label class="col-form-label">Conta:</label>
                                <input value="{{ $restaurant->conta }}"  type="text" class="form-control form-control-lg " name="conta" required="required">

                            </div>

                        </div>

                    </fieldset>

                    <hr>

                    @csrf
                    <div class="text-left">
                        <div class="btn-group btn-group-justified" style="width: 225px">
                            @if($restaurant->is_active)
                            <a class="btn btn-primary" href="{{ route('admin.disableRestaurant', $restaurant->id) }}">
                            DESATIVAR
                            <i class="icon-switch2 ml-1"></i>
                            </a>
                            @else
                            <a class="btn btn-danger" href="{{ route('admin.disableRestaurant', $restaurant->id) }}">
                            ATIVAR
                            <i class="icon-switch2 ml-1"></i>
                            </a>
                            @endif 
                            {{-- <a class="btn btn-danger text-white" data-toggle="modal" data-target="#deleteRestaurantConfirmModal" id="deleteRestaurantButton">
                            DELETAR
                            <i class="icon-trash ml-1"></i>
                            </a> --}}
                        </div>
                    </div>
                    <div class="text-right">
                        <button type="submit" class="btn btn-primary">
                        ATUALIZAR
                        <i class="icon-database-insert ml-1"></i>
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<div id="deleteRestaurantConfirmModal" class="modal fade mt-5" tabindex="-1">
    <div class="modal-dialog modal-xs">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title"><span class="font-weight-bold">Tem certeza?</span></h5>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <span class="help-text">Cuidado, todos os itens associados aos Lojas também serão excluídos permanentemente. <br> Você pode usar o recurso "<strong> DESATIVAR </strong>" para desativar temporariamente o Loja.</span>
                <div class="modal-footer mt-4">
                    <a href="{{ route('admin.deleteRestaurant', $restaurant->id) }}" class="btn btn-primary">Yes</a>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    function readURL(input) {
        if (input.files && input.files[0]) {
            let reader = new FileReader();
            reader.onload = function (e) {
                $('.slider-preview-image')
                    .removeClass('hidden')
                    .attr('src', e.target.result)
                    .width(160)
                   .height(117)
                   .css('borderRadius', '0.275rem');
            };
            reader.readAsDataURL(input.files[0]);
        }
    }
    $(function () {
        $('.select').select2({
            minimumResultsForSearch: Infinity,
        });
    
      if (Array.prototype.forEach) {
               var elems = Array.prototype.slice.call(document.querySelectorAll('.switchery-primary'));
               elems.forEach(function(html) {
                   var switchery = new Switchery(html, { color: '#2196F3' });
               });
           }
           else {
               var elems = document.querySelectorAll('.switchery-primary');
               for (var i = 0; i < elems.length; i++) {
                   var switchery = new Switchery(elems[i], { color: '#2196F3' });
               }
           }
    
       $('.form-control-uniform').uniform();

       $('.rating').numeric({allowThouSep:false,  min: 1, max: 5, maxDecimalPlaces: 1 });
       $('.delivery_time').numeric({allowThouSep:false});
       $('.price_range').numeric({allowThouSep:false});
       $('.latitude').numeric({allowThouSep:false});
       $('.longitude').numeric({allowThouSep:false});
       $('.restaurant_charges').numeric({ allowThouSep:false, maxDecimalPlaces: 2 });
       $('.delivery_charges').numeric({ allowThouSep:false, maxDecimalPlaces: 2 });
       $('.commission_rate').numeric({ allowThouSep:false, maxDecimalPlaces: 2, max: 100 });

       $('.base_delivery_charge').numeric({ allowThouSep:false, maxDecimalPlaces: 2, allowMinus: false });
        $('.base_delivery_distance').numeric({ allowThouSep:false, maxDecimalPlaces: 0, allowMinus: false });
        $('.extra_delivery_charge').numeric({ allowThouSep:false, maxDecimalPlaces: 2, allowMinus: false });
        $('.extra_delivery_distance').numeric({ allowThouSep:false, maxDecimalPlaces: 0, allowMinus: false });
        
        $('.min_order_price').numeric({ allowThouSep:false, maxDecimalPlaces: 2, allowMinus: false });
        

        @if($restaurant->delivery_charge_type == "FIXED")
            $('#dynamicChargeDiv').addClass('hidden');
        @else
            $('#deliveryCharge').addClass('hidden');
        @endif
       
        $("[name='delivery_charge_type']").change(function(event) {
             if ($(this).val() == "FIXED") {
                 $('#dynamicChargeDiv').addClass('hidden');
                 $('#deliveryCharge').removeClass('hidden')
             } else {
                 $('#deliveryCharge').addClass('hidden');
                 $('#dynamicChargeDiv').removeClass('hidden')
             }
         });

    });
</script>
@endsection