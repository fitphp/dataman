<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Http\JsonResponse;
use Illuminate\Routing\Controller as BaseController;

class Controller extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;

    protected function success($data = null) : JsonResponse
    {
        return response()->json([
            'code' => 200,
            'message' => '操作成功',
            'data' => $data,
            'timestamp' => time()
        ]);
    }

    protected function failed($code = 0, $message = '操作失败'): JsonResponse
    {
        return response()->json([
            'code' => $code,
            'message' => $message,
            'data' => null,
            'timestamp' => time()
        ]);
    }
}
