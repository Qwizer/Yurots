@extends('admin.layouts.master')
@section("title") Sliders Promocionais - Dashboard
@endsection
@section('content')
<div class="page-header">
    <div class="page-header-content header-elements-md-inline">
        <div class="page-title d-flex">
            <h4><i class="icon-circle-right2 mr-2"></i>
                <span class="font-weight-bold mr-2">TOTAL</span>
                <span class="badge badge-primary badge-pill animated flipInX">{{ $count }}</span>
            </h4>
            <a href="#" class="header-elements-toggle text-default d-md-none"><i class="icon-more"></i></a>
        </div>
        <div class="header-elements d-none py-0 mb-3 mb-md-0">
            <div class="breadcrumb">
                <button type="button" class="btn btn-secondary btn-labeled btn-labeled-left" id="addNewSlider"
                    data-toggle="modal" data-target="#addNewSliderModal">
                <b><i class="icon-plus2"></i></b>
                Adicionar Novo Slider
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
                            <th>Status</th>
                            <th>Nº de Slides</th>
                            <th>Posição</th>
                            <th>Tamanho</th>
                            <th>Criado em</th>
                            <th class="text-center" style="width: 10%;"><i class="
                                icon-circle-down2"></i></th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($sliders as $slider)
                        <tr>
                            <td>{{ $slider->name }}</td>
                            <td>@if($slider->is_active)
                                <span class="badge badge-flat border-grey-800 text-default text-capitalize">
                                Ativo
                                </span>
                                @else
                                <span class="badge badge-flat border-grey-800 text-default text-capitalize">
                                Inativo
                                </span>
                                @endif
                            </td>
                            <td>{{ count($slider->slides) }}</td>
                            @if($slider->position_id == 0)
                            <td>PRINCIPAL</td>
                            @endif
                            @if($slider->position_id == 1)
                            <td>Depois do 1º Loja</td>
                            @endif
                            @if($slider->position_id == 2)
                            <td>Depois do 2º Loja</td>
                            @endif
                            @if($slider->position_id == 3)
                            <td>Depois do 3º Loja</td>
                            @endif
                            @if($slider->position_id == 4)
                            <td>Depois do 4º Loja</td>
                            @endif
                            @if($slider->position_id == 5)
                            <td>Depois do 5º Loja</td>
                            @endif
                            @if($slider->position_id == 6)
                            <td>Depois do 6º Loja</td>
                            @endif
                            <td>{{ $slider->size }}</td>
                            <td>{{ $slider->created_at->diffForHumans() }}</td>
                            <td class="text-center">
                                <div class="btn-group btn-group-justified">
                                    <a href="{{ route('admin.get.editSlider', $slider->id) }}"
                                        class="badge badge-primary badge-icon"> EDITAR <i
                                        class="icon-database-edit2 ml-1"></i></a>
                                    @if($slider->is_active)
                                    <a href="{{ route('admin.disableSlider', $slider->id) }}" class="badge badge-primary badge-icon ml-1" data-popup="tooltip" title="Desativar Slider" data-placement="bottom"> <i class="icon-switch2"></i> </a>
                                    @else
                                    <a href="{{ route('admin.disableSlider', $slider->id) }}" class="badge badge-primary badge-icon ml-1 badge-danger" data-popup="tooltip" title="Ativar Slider" data-placement="bottom"> <i class="icon-switch2"></i> </a>
                                    @endif
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
<div id="addNewSliderModal" class="modal fade" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title"><span class="font-weight-bold">Adicionar Novo Slider</span></h5>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <form action="{{ route('admin.createSlider') }}" method="POST" enctype="multipart/form-data">
                    <div class="form-group row">
                        <label class="col-lg-3 col-form-label">Nome:</label>
                        <div class="col-lg-9">
                            <input type="text" class="form-control form-control-lg" name="name"
                                placeholder="Enter Slider Name" required>
                            <span class="help-text text-muted">O novo slider ficará INATIVO por padrão.</span>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-lg-3 col-form-label">Posição do Slider:</label>
                        <div class="col-lg-9">
                            <select name="position_id" class="form-control form-control-lg">
                                <option value="0">Posição Principal</option>
                                <option value="1">Depois do 1º Loja</option>
                                <option value="2">Depois do 2º Loja</option>
                                <option value="3">Depois do 3º Loja</option>
                                <option value="4">Depois do 4º Loja</option>
                                <option value="5">Depois do 5º Loja</option>
                                <option value="6">Depois do 6º Loja</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-lg-3 col-form-label">Tamanho:</label>
                        <div class="col-lg-9">
                            <select name="size" class="form-control form-control-lg" required="required">
                                 <option value="1">Bem Pequeno</option>
                                 <option value="2">Pequeno</option>
                                 <option value="3">Médio</option>
                                 <option value="4">Grande</option>
                                 <option value="5">Extra Grande</option>
                            </select>
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
    $('.select').select2({
            minimumResultsForSearch: Infinity,
    });

    $('.slider-size').numeric({ allowThouSep:false, maxDecimalPlaces: 0, allowMinus: false, min:1, max: 5});
</script>
@endsection