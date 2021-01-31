<div class="card">
    <div class="card-header d-flex justify-content-between align-items-start pb-0">
        <h4 class="card-title mb-1"> {{ trans('home.env.title') }}</h4>
    </div>

    <div class="card-content panel panel-default">
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
</div>
