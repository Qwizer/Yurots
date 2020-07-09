@extends('admin.layouts.master')
@section("title") Editar Cupom - Dashboard
@endsection
@section('content')
<div class="page-header">
    <div class="page-header-content header-elements-md-inline">
        <div class="page-title d-flex">
            <h4><i class="icon-circle-right2 mr-2"></i>
                <span class="font-weight-bold mr-2">Editando</span>
                <span class="badge badge-primary badge-pill animated flipInX">"{{ $coupon->name }} -> {{ $coupon->code }}"</span>
            </h4>
            <a href="#" class="header-elements-toggle text-default d-md-none"><i class="icon-more"></i></a>
        </div>
    </div>
</div>
<div class="content">
    <div class="col-md-8">
        <div class="card">
            <div class="card-body">
                <form action="{{ route('admin.updateCoupon') }}" method="POST">
                    <legend class="font-weight-semibold text-uppercase font-size-sm">
                        <i class="icon-address-book mr-2"></i> Detalhes do Cupom
                    </legend>
                    <input type="hidden" name="id" value="{{ $coupon->id }}">
                    <div class="form-group row">
                        <label class="col-lg-3 col-form-label"><span class="text-danger">*</span>Nome do Cupom:</label>
                        <div class="col-lg-9">
                            <input value="{{ $coupon->name }}" type="text" class="form-control form-control-lg" name="name"
                                placeholder="Nome do cupom" required>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-lg-3 col-form-label">Descrição do cupom:</label>
                        <div class="col-lg-9">
                            <input value="{{ $coupon->description }}" type="text" class="form-control form-control-lg" name="description"
                                placeholder="Descrição do cupom">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-lg-3 col-form-label"><span class="text-danger">*</span>Código do Cupom:</label>
                        <div class="col-lg-9">
                            <input value="{{ $coupon->code }}" type="text" class="form-control form-control-lg" name="code"
                                placeholder="Código do Cupom" required>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-lg-3 col-form-label"><span class="text-danger">*</span>Tipo de desconto:</label>
                        <div class="col-lg-9">
                            <select class="form-control select-search" name="discount_type" required>
                            <option value="AMOUNT" class="text-capitalize" @if($coupon->discount_type == "AMOUNT") selected="selected" @endif>
                            Desconto fixo
                            </option>
                            <option value="PERCENTAGE" class="text-capitalize" @if($coupon->discount_type == "PERCENTAGE") selected="selected" @endif>
                            Desconto percentual
                            </option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-lg-3 col-form-label"><span class="text-danger">*</span>Desconto do cupom:</label>
                        <div class="col-lg-9">
                            <input value="{{ $coupon->discount }}" type="text" class="form-control form-control-lg" name="discount"
                                placeholder="Desconto do cupom" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label class="col-lg-3 col-form-label"><span class="text-danger">*</span>Data de expiração:</label>
                            <div class="col-lg-9">
                                <input type="text" class="form-control form-control-lg daterange-single" value="{!! $coupon->expiry_date->format('m-d-Y') !!}" name="expiry_date">
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-lg-3 col-form-label"><span class="text-danger">*</span>Qual Loja:</label>
                        <div class="col-lg-9">
                            <select class="form-control select-search" name="restaurant_id" required>
                                <option value="0" class="text-capitalize" selected="selected">TODOS Lojas</option>
                                @foreach ($restaurants as $restaurant)
                                <option value="{{ $restaurant->id }}" class="text-capitalize" @if($coupon->restaurant_id == $restaurant->id) selected="selected" @endif>{{ $restaurant->name }}</option>
                                @endforeach
                            </select>
                            <span class="help-text text-muted">Selecione a opção <b>"TODOS Lojas"</b> se o cupom se aplica a todos.</span>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-lg-3 col-form-label"><span class="text-danger">*</span>Número máximo de usos:</label>
                        <div class="col-lg-9">
                            <input value="{{ $coupon->max_count }}" type="text" class="form-control form-control-lg" name="max_count"
                                placeholder="Desconto do Cupom" required>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-lg-3 col-form-label">Está ativo?</label>
                        <div class="col-lg-9">
                            <div class="checkbox checkbox-switchery">
                                <label>
                                <input value="true" type="checkbox" class="switchery-primary isactive" @if($coupon->is_active) checked="checked" @endif name="is_active">
                                </label>
                            </div>
                        </div>
                    </div>
                    @csrf
                    <div class="text-left">
                        <a class="btn btn-danger text-white" data-toggle="modal" data-target="#deleteCouponConfirmModal" id="deleteCouponButton">
                        DELETAR
                        <i class="icon-trash ml-1"></i>
                        </a>
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
<div id="deleteCouponConfirmModal" class="modal fade mt-5" tabindex="-1">
    <div class="modal-dialog modal-xs">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title"><span class="font-weight-bold">Tem certeza?</span></h5>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <div class="modal-footer mt-4">
                    <a href="{{ route('admin.deleteCoupon', $coupon->id) }}" class="btn btn-primary">Sim</a>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                </div>
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