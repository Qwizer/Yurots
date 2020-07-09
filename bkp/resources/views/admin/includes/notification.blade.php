@if(Session::has('success'))
<script>
    $(function () {
        $.jGrowl("{{ Session::get('success') }}", {
            position: 'bottom-center',
            header: 'SUCESSO 👌',
            theme: 'bg-success',
        });    
    });
</script>
@endif
@if(Session::has('message'))
<script>
    $(function () {
        $.jGrowl("{{ Session::get('message') }}", {
            position: 'bottom-center',
            header: 'Wooopsss ⚠️',
            theme: 'bg-warning',
        });    
    });
</script>
@endif
@if($errors->any())
<script>
    $(function () {
        $.jGrowl("{{ implode('', $errors->all(':message')) }}", {
            position: 'bottom-center',
            header: 'ERRO ⁉️',
            theme: 'bg-danger',
        });    
    });
</script>
@endif