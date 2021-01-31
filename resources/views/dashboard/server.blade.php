<div class="card">
    <div class="card-header d-flex justify-content-between align-items-start pb-0">
        <h4 class="card-title mb-1"> {{ trans('home.server.title') }}</h4>
    </div>
    <div class="card-content panel panel-primary">
        <div class="panel-body">
            <table class="table">
                <tr>
                    @foreach($server as $item)
                    <td width="120px" class="bold text-80">{{ $item['name'] }}</td>
                    <td>{{ $item['value'] }}</td>
                    @endforeach
                </tr>
            </table>
        </div>
    </div>
</div>
