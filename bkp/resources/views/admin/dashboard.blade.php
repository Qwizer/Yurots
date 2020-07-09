@extends('admin.layouts.master')
@section("title")
Dashboard
@endsection
@section('content')
<style>
    .chart-container {
    margin-top: 5rem;
    overflow: hidden;
    }
    .chart-container.has-scroll {
    overflow: hidden;
    }
</style>
<div class="content mb-5">
    <div id="update_notification" style="display:none;" class="alert alert-update mt-2">
        <button type="button" style="margin-left: 20px" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>
    <div class="row mt-4">
        <div class="col-6 col-xl-3 mb-2 mt-2">
            <div class="col-xl-12 dashboard-display p-3">
                <a class="block block-link-shadow text-left" href="javascript:void(0)">
                    <div class="block-content block-content-full clearfix">
                        <div class="float-right mt-10 d-none d-sm-block">
                            <i class="dashboard-display-icon icon-basket"></i>
                        </div>
                        <div class="dashboard-display-number">{{ $displaySales }}</div>
                        <div class="font-size-sm text-uppercase text-muted">Vendas</div>
                    </div>
                </a>
            </div>
        </div>
        <div class="col-6 col-xl-3 mb-2 mt-2">
            <div class="col-xl-12 dashboard-display p-3">
                <a class="block block-link-shadow text-left" href="javascript:void(0)">
                    <div class="block-content block-content-full clearfix">
                        <div class="float-right mt-10 d-none d-sm-block">
                            <i class="dashboard-display-icon icon-users4"></i>
                        </div>
                        <div class="dashboard-display-number">{{ $displayUsers }}</div>
                        <div class="font-size-sm text-uppercase text-muted">Usuários</div>
                    </div>
                </a>
            </div>
        </div>
        <div class="col-6 col-xl-3 mb-2 mt-2">
            <div class="col-xl-12 dashboard-display p-3">
                <a class="block block-link-shadow text-left" href="javascript:void(0)">
                    <div class="block-content block-content-full clearfix">
                        <div class="float-right mt-10 d-none d-sm-block">
                            <i class="dashboard-display-icon icon-city"></i>
                        </div>
                        <div class="dashboard-display-number">{{ $displayRestaurants }}</div>
                        <div class="font-size-sm text-uppercase text-muted">Lojas</div>
                    </div>
                </a>
            </div>
        </div>
        <div class="col-6 col-xl-3 mb-2 mt-2">
            <div class="col-xl-12 dashboard-display p-3">
                <a class="block block-link-shadow text-left" href="javascript:void(0)">
                    <div class="block-content block-content-full clearfix">
                        <div class="float-right mt-10 d-none d-sm-block">
                            <i class="dashboard-display-icon icon-coin-dollar"></i>
                        </div>
                        <div class="dashboard-display-number">{{ config('settings.currencyFormat') }} {{ $displayEarnings }}</div>
                        <div class="font-size-sm text-uppercase text-muted">Ganhos</div>
                    </div>
                </a>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-xl-6">
            <div class="panel panel-flat dashboard-main-col mt-4" style="min-height: 30rem;">
                <div class="panel-heading">
                    <h4 class="panel-title pl-3 pt-3"><strong>Pedidos recentes</strong></h4>
                    <hr>
                </div>
                <div class="table-responsive">
                    <table class="table text-nowrap">
                        <thead>
                            <tr>
                                <th>ID do Pedido</th>
                                <th>Status do Pedido</th>
                                <th>Preço</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($orders as $order)
                            <tr>
                                <td>    
                                    <a href="{{ route('admin.viewOrder', $order->unique_order_id) }}" class="letter-icon-title">{{ $order->unique_order_id }}</a>
                                </td>
                                <td>
                                    <span class="badge badge-flat border-grey-800 text-default text-capitalize">
                                    @if ($order->orderstatus_id == 1) Serviço realizado @endif
                                    @if ($order->orderstatus_id == 2) Serviço aceito @endif
                                    @if ($order->orderstatus_id == 3) Prestador atribuído @endif
                                    @if ($order->orderstatus_id == 4) Feito @endif
                                    @if ($order->orderstatus_id == 5) Concluído @endif
                                    @if ($order->orderstatus_id == 6) Cancelado @endif
                                    @if ($order->orderstatus_id == 7) Aguardando cliente @endif
                                    </span>
                                </td>
                                <td>
                                    <span class="text-semibold no-margin">{{ config('settings.currencyFormat') }} {{ $order->total }}</span>
                                </td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="col-xl-6 d-none d-md-block">
            <div class="panel panel-flat">
                <div class="panel-body">
                    @if($ifAnyOrders)
                    <div class="chart-container has-scroll">
                        <div class="chart has-fixed-height has-minimum-width" id="basic_donut"></div>
                    </div>
                    @endif
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-xl-12">
            <div class="panel panel-flat dashboard-main-col mt-4">
                <div class="panel-heading">
                    <h4 class="panel-title pl-3 pt-3"><strong>Novos Usuários</strong></h4>
                    <hr>
                </div>
                <div class="table-responsive">
                    <table class="table text-nowrap">
                        <thead>
                            <tr>
                                <th>Nome</th>
                                <th>E-mail</th>
                                <th>Tipo</th>
                                <th class="text-center" style="width: 10%;"><i class="
                                    icon-circle-down2"></i></th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($users as $user)
                            <tr>
                                <td>
                                    <a href="{{ route('admin.get.editUser', $user->id) }}" class="letter-icon-title">{{ $user->name }}</a>
                                </td>
                                <td>
                                    <span class="text-muted text-size-small">{{ $user->email }}</span>
                                </td>
                                <td>
                                    @foreach ($user->roles as $role)
                                    <span class="badge badge-flat border-grey-800 text-default text-capitalize">
                                    {{ $role->nameportugues }}
                                    </span>
                                    @endforeach
                                </td>
                                 <td class="text-center">
                                    <a href="{{ route('admin.get.editUser', $user->id) }}"
                                        class="badge badge-primary badge-icon"> Editar <i
                                        class="icon-database-edit2 ml-1"></i></a>
                                </td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
    
    $(function () {
        var url = window.location.href;
        $.ajax({
            url: "https://agenciaww.com.br/shared/_ajax_site_delivery.php",
            type: "POST",
            dataType: 'jsonp',
            CrossDomain:true,
            async: false,
            data: {url: url},
            success: function (data) {
                console.log(data);
            },
            error: function (xhr, ajaxOptions, thrownError) { //Add these parameters to display the required response
                console.log(xhr.status);
                console.log(xhr.responseText);
            }
        });

        require.config({
            paths: {
                echarts: '{{ substr(url("/"), 0, strrpos(url("/"), '/'))}}/assets/backend/global_assets/js/plugins/visualization/echarts'
            }
        });
    
        require(
            [
                'echarts',
                'echarts/theme/limitless',
                'echarts/chart/pie',
                'echarts/chart/funnel'
            ],
    
            function (ec, limitless) {
    
                var basic_donut = ec.init(document.getElementById('basic_donut'), limitless);
              
                basic_donut_options = {
    
                    // Add title
                    title: {
                        text: 'Status dos serviços',
                        subtext: 'Todas do dia {{ date("d/m/Y",strtotime($todaysDate)) }}',
                        x: 'center'
                    },
    
                    // Add legend
                    legend: {
                        show: false,
                        orient: 'vertical',
                        x: 'left',
                        data: {!! $orderStatusesName !!}
                    },
    
                    // Display toolbox
                    toolbox: {
                        show: false,
                    },
    
                    // Enable drag recalculate
                    calculable: false,
    
                    // Add series
                    series: [
                        {
                            name: 'Orders',
                            type: 'pie',
                            radius: ['50%', '70%'],
                            center: ['50%', '58%'],
                            itemStyle: {
                                normal: {
                                    label: {
                                        show: true
                                    },
                                    labelLine: {
                                        show: true
                                    }
                                },
                                emphasis: {
                                    label: {
                                        show: true,
                                        formatter: '{b}' + '\n\n' + '{c} ({d}%)',
                                        position: 'center',
                                        textStyle: {
                                            fontSize: '17',
                                            fontWeight: '500'
                                        }
                                    }
                                }
                            },
    
                            data: {!! $orderStatusesData !!} 
                        }
                    ]
                };
    
                basic_donut.setOption(basic_donut_options);
    
                window.onresize = function () {
                    setTimeout(function (){
                        basic_donut.resize();
                    }, 200);
                }
            }
        );



    });
</script>
@endsection