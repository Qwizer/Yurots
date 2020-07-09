@extends('admin.layouts.master')
@section("title") Logs Coletas do Delivery - Dashboard
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
    </div>
</div>
<div class="content">
    <div class="card">
        <div class="card-body">
            <div class="table-responsive">
                <table class="table">
                    <thead>
                        <tr>
                            <th>Nome do entregador</th>
                            <th>E-mail</th>
                            <th>Quantia</th>
                            <th>Mensagem</th>
                            <th>Data</th>
                            <th class="text-center"><i class="
                                icon-circle-down2"></i></th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($logs as $log)
                        <tr>
                            <td>{{ $log->delivery_collection->user->name }}</td>
                            <td>{{ $log->delivery_collection->user->email }}</td>
                            <td>
                               {{ config('settings.currencyFormat') }} {{ $log->amount }}
                            </td>
                            <td>
                                {{ \Illuminate\Support\Str::limit($log->message, 150, $end='...') }}
                            </td>
                            <td>
                                {{ $log->created_at->isoFormat('Do MMM, YYYY') }}
                            </td>
                            <td class="text-center">
                                <button class="btn btn-sm btn-primary collectCashBtn" data-toggle="modal" data-target="#viewDetails{{$log->id}}"> Ver detalhes <i
                                    class="icon-pencil7 ml-1"></i></button>
                            </td>
                        </tr>
                        <div id="viewDetails{{$log->id}}" class="modal fade" tabindex="-1">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title"><span class="font-weight-bold">Detalhes</span></h5>
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="form-group row">
                                            <label class="col-lg-12 col-form-label"><b>Nome do entregador:</b></label>
                                            <label class="col-lg-12"><a href="{{ route('admin.get.editUser', $log->delivery_collection->user->id) }}">{{ $log->delivery_collection->user->name }} </a></label>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-12 col-form-label"><b>E-mail:</b></label>
                                            <label class="col-lg-12">{{ $log->delivery_collection->user->email }}</label>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-12 col-form-label"><b>Telefone:</b></label>
                                            <label class="col-lg-12">{{ $log->delivery_collection->user->phone }}</label>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-12 col-form-label"><b>Quantia:</b></label>
                                            <label class="col-lg-12">{{ $log->amount }}</label>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-12 col-form-label"><b>Mensagem:</b></label>
                                            <label class="col-lg-12">{{ $log->message }}</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        @endforeach
                    </tbody>
                </table>
                <div class="mt-3">
                    {{ $logs->links() }}
                </div>
            </div>
        </div>
    </div>
</div>
<script>
     $('.custom_amount').numeric({ allowThouSep:false, maxDecimalPlaces: 2, allowMinus: false });
</script>
@endsection
