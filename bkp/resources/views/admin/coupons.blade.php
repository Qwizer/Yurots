@extends('admin.layouts.master')
@section("title") Cupons - Dashboard
@endsection
@section('content')
<div class="page-header">
    <div class="page-header-content header-elements-md-inline">
        <div class="page-title d-flex">
            <h4><i class="icon-circle-right2 mr-2"></i>
                <span class="font-weight-bold mr-2">TOTAL</span>
                <span class="badge badge-primary badge-pill animated flipInX">{{ count($coupons) }}</span>
            </h4>
            <a href="#" class="header-elements-toggle text-default d-md-none"><i class="icon-more"></i></a>
        </div>
        <div class="header-elements d-none py-0 mb-3 mb-md-0">
            <div class="breadcrumb">
                <button type="button" class="btn btn-secondary btn-labeled btn-labeled-left" id="addNewCoupon"
                    data-toggle="modal" data-target="#addNewCouponModal">
                <b><i class="icon-plus2"></i></b>
                Novo Cupom
                </button>
            </div>
        </div>
    </div>
</div>
<div class="content">
    <div class="card">
        <div class="card-body">
            <div class="table-responsive">
                <table class="table">
                    <thead>
                        <tr>
                            <th>Nome</th>
                            <th>Loja</th>
                            <th>Código</th>
                            <th>Tipo</th>
                            <th>Desconto</th>
                            <th>Status</th>
                            <th>Usos</th>
                            <th>Data de expiração</th>
                            <th class="text-center" style="width: 10%;"><i class="
                                icon-circle-down2"></i></th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($coupons as $coupon)
                        <tr>
                            <td>{{ $coupon->name }}</td>
                            @if($coupon->restaurant_id == 0 || $coupon->restaurant_id == NULL)
                            <td><span class="badge badge-flat border-grey-800 text-default text-capitalize">TODOS Lojas</span></td>
                            @else
                            <td>{{ $coupon->restaurant->name }}</td>
                            @endif
                            <td>{{ $coupon->code }}</td>
                            <td>
                                <span class="badge badge-flat border-grey-800 text-default text-capitalize">
                                {{ $coupon->discount_type }}
                                </span>
                            </td>
                            <td>
                                @if($coupon->discount_type == "AMOUNT")
                                {{ config('settings.currencyFormat') }} {{ $coupon->discount }}
                                @else
                                {{ $coupon->discount }} <strong>%</strong>
                                @endif
                            </td>
                            <td>@if($coupon->is_active)
                                <span class="badge badge-flat border-grey-800 text-default text-capitalize">
                                Ativo
                                </span>
                                @else
                                <span class="badge badge-flat border-grey-800 text-default text-capitalize">
                                Inativo
                                </span>
                                @endif
                            </td>
                            <td><span class="badge badge-flat border-grey-800 text-default text-capitalize">{{ $coupon->count }}</span></td>
                            <td>{{ $coupon->expiry_date->diffForHumans() }} <br>({{ $coupon->expiry_date->format('Y-m-d') }})</td>
                            <td class="text-center">
                                <div class="btn-group btn-group-justified">
                                    <a href="{{ route('admin.get.getEditCoupon', $coupon->id) }}"
                                        class="badge badge-primary badge-icon"> EDITAR <i
                                        class="icon-database-edit2 ml-1"></i></a>
                                </div>
                            </td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<div id="addNewCouponModal" class="modal fade" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title"><span class="font-weight-bold">Adicionar Novo Cupom</span></h5>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <form action="{{ route('admin.post.saveNewCoupon') }}" method="POST">
                    <div class="form-group row">
                        <label class="col-lg-3 col-form-label"><span class="text-danger">*</span>Nome do Cupom:</label>
                        <div class="col-lg-9">
                            <input type="text" class="form-control form-control-lg" name="name"
                                placeholder="Nome do Cupom" required>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-lg-3 col-form-label">Descrição do Cupom:</label>
                        <div class="col-lg-9">
                            <input type="text" class="form-control form-control-lg" name="description"
                                placeholder="Descrição do Cupom">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-lg-3 col-form-label"><span class="text-danger">*</span>Código do Cupom:</label>
                        <div class="col-lg-9">
                            <input type="text" class="form-control form-control-lg" name="code"
                                placeholder="Código do Cupom" required>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-lg-3 col-form-label"><span class="text-danger">*</span>Tipo de desconto:</label>
                        <div class="col-lg-9">
                            <select class="form-control select-search" name="discount_type" required>
                                <option value="AMOUNT" class="text-capitalize">
                                    Desconto Fixo
                                </option>
                                <option value="PERCENTAGE" class="text-capitalize">
                                    Desconto percentual
                                </option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-lg-3 col-form-label"><span class="text-danger">*</span>Valor:</label>
                        <div class="col-lg-9">
                            <input type="text" class="form-control form-control-lg" name="discount"
                                placeholder="Desconto do Cupom" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label class="col-lg-3 col-form-label"><span class="text-danger">*</span>Data de expiração:</label>
                            <div class="col-lg-9">
                                <input type="text" class="form-control form-control-lg daterange-single" value="{{ $todaysDate }}" name="expiry_date">
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-lg-3 col-form-label"><span class="text-danger">*</span>Qual Loja?:</label>
                        <div class="col-lg-9">
                            <select class="form-control select-search" name="restaurant_id" required>
                                <option value="0" class="text-capitalize" selected="selected">TODOS Lojas</option>
                                @foreach ($restaurants as $restaurant)
                                <option value="{{ $restaurant->id }}" class="text-capitalize">{{ $restaurant->name }}</option>
                                @endforeach
                            </select>
                            <span class="help-text text-muted">Selecione a opção <b>"TODOS Lojas"</b> se o cupom se aplica a todos.</span>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-lg-3 col-form-label"><span class="text-danger">*</span>Número de usos:</label>
                        <div class="col-lg-9">
                            <input type="text" class="form-control form-control-lg" name="max_count"
                                placeholder="Número máximo de usos" required>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-lg-3 col-form-label">Está ativo?</label>
                        <div class="col-lg-9">
                            <div class="checkbox checkbox-switchery">
                                <label>
                                <input value="true" type="checkbox" class="switchery-primary isactive" checked="checked" name="is_active">
                                </label>
                            </div>
                        </div>
                    </div>
                    @csrf
                    <div class="text-right">
                        <button type="submit" class="btn btn-primary">
                        SALVAR
                        <i class="icon-database-insert ml-1"></i>
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script>
    $(function () {
           $('.select').select2({
               minimumResultsForSearch: Infinity,
           });
    
           var isactive = document.querySelector('.isactive');
           new Switchery(isactive, { color: '#f44336' });
           
           $('.form-control-uniform').uniform();
    
           $('.daterange-single').daterangepicker({ 
               singleDatePicker: true,
           });
       });    
</script>
@endsection