<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use SimpleSoftwareIO\QrCode\Facades\QrCode;
use SimpleSoftwareIO\QrCode\BaconQrCodeGenerator;
class QrcodeController extends Controller
{
    //

    public function qrcode()
    {
        $data=\App\Models\Qrcode::find(1);
        $url= url("/qr/{$data->id}");
        $qrcode = new BaconQrCodeGenerator;
        return   $qrcode->size(300)->generate($url);
    }

    public function qr()
    {
        $data=\App\Models\Qrcode::find(1);
        return view('qrcode', ['data' =>$data]);
    }

}
