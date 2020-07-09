@extends('admin.layouts.master')
@section("title") Lojas dos Donos - Dashboard
@endsection
@section('content')
<style>
    .assigning-checkboxes label {
    margin-right: 10px;
    background-color: rgba(250, 250, 250, 0.3);
    border-radius: 25px;
    margin-bottom: 1.2rem;
    }
    .assigning-checkboxes label span {
    text-align: center;
    display: block;
    padding: 8px 15px;
    border: 1px solid #eee;
    border-radius: 25px;
    }
    .assigning-checkboxes label input {
    position: absolute;
    top: -20px;
    display: none;
    }
    .assigning-checkboxes input:checked + span {
    background-color: #2ebf91;
    padding: 8px 15px;
    color: #fff;
    border: 1px solid #eee;
    }
</style>
<div class="page-header">
    <div class="page-header-content header-elements-md-inline">
        <div class="page-title d-flex">
            <h4><i class="icon-circle-right2 mr-2"></i>
                <span class="font-weight-bold mr-2">Editando</span>
                <span class="badge badge-primary badge-pill animated flipInX">"{{ $user->email }}"</span>
            </h4>
            <a href="#" class="header-elements-toggle text-default d-md-none"><i class="icon-more"></i></a>
        </div>
    </div>
</div>
<div class="content">
<div class="col-md-12">
    <div class="card">
        <div class="card-body">
            <legend class="font-weight-semibold text-uppercase font-size-sm">
                <i class="icon-address-book mr-2"></i> Lojas do proprietário do Loja
            </legend>
            <div class="form-group row form-group-feedback form-group-feedback-right">
                @if(count($userRestaurants) === 0)
                <div class="col-lg-9">
                    <p class="text-warning">{{ $user->name }} não é dono de nenhum Loja.</p>
                </div>
                @else
                <br>
                <div class="col-lg-9">
                    <p><strong>{{ $user->name }}</strong> é dono do <strong>{{ $userRestaurants->count() }} </strong>.</p>
                    @foreach($userRestaurants as $ur)
                    <span class="badge badge-flat border-grey-800" style="font-size: 0.9rem;">{{ $ur->name }}</span>
                    @endforeach
                </div>
                @endif
            </div>
            <button type="submit" class="btn btn-primary btn-labeled btn-labeled-left btn-lg" id="manageRestaurants">
            <b><i class="icon-gear ml-1"></i></b>
            GERENCIAR
            </button>
        </div>
    </div>
    <div class="col-md-12 hidden" id="manageRestaurantsBlock">
        <div class="form-group form-group-feedback form-group-feedback-right search-box">
            <input type="text" class="form-control form-control-lg search-input"
                placeholder="Filtrar com o nome do Loja...">
            <div class="form-control-feedback form-control-feedback-lg">
                <i class="icon-search4"></i>
            </div>
        </div>
        <div class="card">
            <div class="card-body">
                <div class="col-lg-12">
                    <form action="{{ route('admin.updateManageRestaurantOwnersRestaurants') }}" method="POST">
                        <input type="hidden" name="id" value="{{ $user->id }}">
                        <div class="text-right mb-4">
                            <button type="button" class="btn btn-primary btn-labeled btn-labeled-left btn-sm" id="checkAll" data-popup="tooltip" title="Clique duas vezes para marcar tudo" data-placement="left">
                            <b><i class="icon-check ml-1"></i></b>
                            Marcar Tudo
                            </button>
                            <button type="button" class="btn btn-primary btn-labeled btn-labeled-left btn-sm" id="unCheckAll" data-popup="tooltip" title="Clique duas vezes para desmarcar tudo" data-placement="top">
                            <b><i class="icon-cross3 ml-1"></i></b>
                            Desmarcar Tudo
                            </button>
                        </div>
                        <div class="assigning-checkboxes mt-3">
                            @foreach($allRestaurants as $ar)
                            <label>
                            <input type="checkbox" data-name="{{ $ar->name }}" name="user_restaurants[]" value="{{ $ar->id }}" @if(in_array($ar->id, $userRestaurantsIds)) checked="checked" @endif/>
                            <span>{{ $ar->name }}</span>
                            </label>
                            @endforeach
                        </div>
                        <div class="text-right">
                            <button type="submit" class="btn btn-primary btn-labeled btn-labeled-left btn-lg">
                            <b><i class="icon-database-insert ml-1"></i></b>
                            ATUALIZAR
                            </button>
                        </div>
                        @csrf
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(function() {
        $('#manageRestaurants').click(function(event) {
            $(this).hide();
            $('#manageRestaurantsBlock').removeClass('hidden');
        });
    
        $('.assigning-checkboxes label').each(function(){
            $(this).attr('data-name', $(this).text().toLowerCase());
        });
    
        $('.search-input').on('keyup', function(){
        var searchTerm = $(this).val().toLowerCase();
            $('.assigning-checkboxes label').each(function(){
                if ($(this).filter('[data-name *= ' + searchTerm + ']').length > 0 || searchTerm.length < 1) {
                    $(this).show();
                } else {
                    $(this).hide();
                }
            });
        });
        
        
        $('#checkAll').dblclick(function(event) {
            $("input:checkbox").prop("checked", true);
        });
        $('#unCheckAll').dblclick(function(event) {
            $("input:checkbox").prop("checked", false);
        });
        
    }); 
</script>
@endsection