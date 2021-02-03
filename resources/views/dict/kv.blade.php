<table class="table">
    <thead>
    <tr>
        <th scope="col">键名</th>
        <th scope="col">键值</th>
    </tr>
    </thead>
    <tbody>
    @foreach($value as $key => $val)
        <tr>
            <td>{{$key}}</td>
            <td>{{$val}}</td>
        </tr>
    @endforeach
    </tbody>
</table>
