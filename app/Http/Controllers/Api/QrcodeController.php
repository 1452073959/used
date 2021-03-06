<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Api\Controller;
use Illuminate\Http\Request;
use SimpleSoftwareIO\QrCode\Facades\QrCode;
use SimpleSoftwareIO\QrCode\BaconQrCodeGenerator;
use Storage;
class QrcodeController extends Controller
{
    //

//    public function qrcode()
//    {
//        $data=\App\Models\Qrcode::find(1);
//        $url= url("/qr");
//        //随机二维码图片名
//        $fileName = 'my' . '.png';
//        //二维码图片路径
//        $filename=public_path('uploads').'/'.$fileName;
//        QrCode::format('png')->size(200)->generate($url, $filename);
//        return Storage::disk('admin')->url($fileName);
//    }

    public function qrcode()
    {
        $data=\App\Models\Qrcode::find(1);
//        return view('qrcode', ['model' =>$data]);
        return $this->success($data['text']);
    }

}
