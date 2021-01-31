<div class="card">
    <div class="card-header d-flex justify-content-between align-items-start pb-0">
        <h4 class="card-title mb-1"> {{ trans('home.team.title') }}</h4>
    </div>
    <div class="card-content panel panel-default">
        <div class="panel-body">
            <table class="table">
                @foreach($teams as $team)
                    <tr>
                        <td width="120px" class="bold text-80">{{ $team['name'] }}</td>
                        <td>
                            @foreach($team['value'] as $name => $email)
                                {{ $name }}
                            @endforeach
                        </td>
                    </tr>
                @endforeach
            </table>
        </div>
    </div>
</div>
