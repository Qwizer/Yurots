@extends('admin.layouts.master')
@section("title") {{ __('storeDashboard.addonCategoriesTitle')}}
@endsection
@section('content')
<div class="page-header">
    <div class="page-header-content header-elements-md-inline">
        <div class="page-title d-flex">
            <h4><i class="icon-circle-right2 mr-2"></i>
                @if(empty($query))
                <span class="font-weight-bold mr-2">{{ __('storeDashboard.total')}}</span>
                <span class="badge badge-primary badge-pill animated flipInX">{{ $count }}</span>
                @else
                <span class="font-weight-bold mr-2">{{ __('storeDashboard.total')}}</span>
                <span class="badge badge-primary badge-pill animated flipInX mr-2">{{ $count }}</span>
                <span class="font-weight-bold mr-2">{{ __('storeDashboard.sphResultFor')}} "{{ $query }}"</span>
                @endif
            </h4>
            <a href="#" class="header-elements-toggle text-default d-md-none"><i class="icon-more"></i></a>
        </div>
        <div class="header-elements d-none py-0 mb-3 mb-md-0">
            <div class="breadcrumb">
                <button type="button" class="btn btn-secondary btn-labeled btn-labeled-left mr-2" id="addNewAddonCategory"
                    data-toggle="modal" data-target="#addNewAddonCategoryModal">
                <b><i class="icon-plus2"></i></b>
                {{ __('storeDashboard.btnAddNewCat')}} 
                </button>
            </div>
        </div>
    </div>
</div>
<div class="content">
    <form action="{{ route('restaurant.post.searchAddonCategories') }}" method="GET">
        <div class="form-group form-group-feedback form-group-feedback-right search-box">
            <input type="text" class="form-control form-control-lg search-input"
                placeholder="{{ __('storeDashboard.acpSearchPlaceHolder')}}" name="query">
            <div class="form-control-feedback form-control-feedback-lg">
                <i class="icon-search4"></i>
            </div>
        </div>
        @csrf
    </form>
    <div class="card">
        <div class="card-body">
            <div class="table-responsive">
                <table class="table">
                    <thead>
                        <tr>
                            <th>{{ __('storeDashboard.acpTableName')}}</th>
                            <th>{{ __('storeDashboard.acpTableType')}}</th>
                            <th>{{ __('storeDashboard.acpTableNOA')}}</th>
                            <th style="width: 15%">{{ __('storeDashboard.acpTableCA')}}</th>
                            <th class="text-center" style="width: 10%;"><i class="
                                icon-circle-down2"></i></th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($addonCategories as $addonCategory)
                        <tr>
                            <td>{{ $addonCategory->name }}</td>
                            <td>
                                @if($addonCategory->type == "SINGLE")
                                <span class="badge badge-flat border-grey-800 text-primary text-capitalize mr-1">
                                {{__('storeDashboard.acpRowSingleSelection')}}
                                </span>
                                @endif
                                @if($addonCategory->type == "MULTI")
                                <span class="badge badge-flat border-grey-800 text-primary text-capitalize mr-1">
                                {{__('storeDashboard.acpRowMultipleSelection')}}
                                </span>
                                @endif
                            </td>
                            <td>{{ $addonCategory->addons_count }}</td>
                            <td>{{ $addonCategory->created_at->diffForHumans() }}</td>
                            <td class="text-center">
                                <div class="btn-group btn-group-justified">
                                    <a href="{{ route('restaurant.editAddonCategory', $addonCategory->id) }}"
                                        class="badge badge-primary badge-icon"> {{__('storeDashboard.edit')}} <i
                                        class="icon-database-edit2 ml-1"></i></a>
                                </div>
                            </td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
                <div class="mt-3">
                    {{ $addonCategories->links() }}
                </div>
            </div>
        </div>
    </div>
</div>
<div id="addNewAddonCategoryModal" class="modal fade" tabindex="-1">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title"><span class="font-weight-bold">{{ __('storeDashboard.btnAddNewCat')}}</span></h5>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <form action="{{ route('restaurant.saveNewAddonCategory') }}" method="POST" enctype="multipart/form-data" enctype="multipart/form-data">
                    <div class="form-group row">
                        <label class="col-lg-3 col-form-label"><span class="text-danger">*</span>{{ __('storeDashboard.acpInputName')}}:</label>
                        <div class="col-lg-9">
                            <input type="text" class="form-control form-control-lg" name="name"
                                placeholder="{{ __('storeDashboard.acpInputName')}}" required>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-lg-3 col-form-label"><span class="text-danger">*</span>{{ __('storeDashboard.acpTableType')}}:</label>
                        <div class="col-lg-9">
                            <select name="type" class="form-control form-control-lg">
                                <option value="SINGLE"> {{ __('storeDashboard.acpRowSingleSelection')}}  </option>
                                <option value="MULTI"> {{ __('storeDashboard.acpRowMultipleSelection')}} </option>
                            </select>
                        </div>
                    </div>
                    @csrf
                    <div class="text-right">
                        <button type="submit" class="btn btn-primary">
                        {{ __('storeDashboard.save')}}
                        <i class="icon-database-insert ml-1"></i></button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
@endsection