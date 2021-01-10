<div class="panel panel-default">
    <div class="panel-heading">{{ trans('admin.develop_team') }}</div>
    <div class="panel-body">
        <table class="table">
            @foreach($teams as $team)
                <tr>
                    <td width="120px" class="bold text-80">{{ $team['name'] }}</td>
                    <td>{{ $team['value'] }}</td>
                </tr>
            @endforeach
        </table>
    </div>
</div>
