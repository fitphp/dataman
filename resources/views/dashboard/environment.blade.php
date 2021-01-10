<div class="panel panel-default">
    <div class="panel-heading">{{ trans('admin.environment') }}</div>
    <div class="panel-body table-responsive">
        <table class="table">
            @foreach($envs as $env)
                <tr>
                    <td width="120px" class="bold text-80">{{ $env['name'] }}</td>
                    <td>{{ $env['value'] }}</td>
                </tr>
            @endforeach
        </table>
    </div>
</div>
