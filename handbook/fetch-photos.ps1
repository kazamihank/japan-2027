# 下載手冊照片到 img\（Windows PowerShell）
# 用法：powershell -ExecutionPolicy Bypass -File .\fetch-photos.ps1
$photos = [ordered]@{
  'hero-snow' = '室堂雪の大谷01.jpg'
  'card-tateyama' = '080504 Murodo-sanso Mount Masago Tateyama Japan02s5.jpg'
  'card-kanazawa' = 'Ishikawa Higashi Chaya gai at night xl.jpg'
  'card-yamashiro' = 'Yamashiro Onsen 260124 06.jpg'
  'card-nagoya' = 'Nagoya_TV_Tower_and_Oasis_21.JPG'
  'd1-gate' = 'Kanazawa-STA Tsuzumi-mon.jpg'
  'd2-kenroku' = 'Kenrokuen 2011-04 (5840979505).jpg'
  'kenroku-kotoji' = 'Kotoji Toro (lantern) - Kenroku-en - Kanazawa, Japan - DSC09657.jpg'
  'd3-yamashiro' = 'Yamashiro Onsen 260124 05.jpg'
  'd4-canal' = 'Fugan-unga Kansui Park 013.jpg'
  'd5-otani' = '080504 Tateyama otani-road Tateyama Japan02s3.jpg'
  'strip-snow' = '室堂雪の大谷02.jpg'
  'strip-kurobe' = '黒部ダム01.jpg'
  'd6-atsuta' = 'Atsuta-jingū (Atsuta-ku, Nagoya) VLux5 hdsr sa01.jpg'
  'unagi' = 'Hitsumabushi by Daikantei.jpg'
  'd7-castle' = 'Nagoya Castle(Larger).jpg'
  'ev-keiba' = 'アンデスビエント 関東オークス入線時.jpg'
  'd8-musky' = 'Nagoya Railway 2000.jpg'
  'ev-nabana' = 'Nabana no Sato Chapel Illumination.jpg'
}
New-Item -ItemType Directory -Force -Path img | Out-Null
$ok=0; $bad=@()
foreach ($k in $photos.Keys) {
  $url = "https://commons.wikimedia.org/wiki/Special:FilePath/$([uri]::EscapeDataString($photos[$k]))?width=1600"
  try { Invoke-WebRequest -Uri $url -OutFile "img\$k.jpg" -UserAgent 'TravelHandbook/1.0 (personal use)'; Write-Host "OK   $k" -ForegroundColor Green; $ok++ }
  catch { Write-Host "FAIL $k" -ForegroundColor Red; $bad += $k }
}
Write-Host "`n完成 $ok / $($photos.Count) 張"; if ($bad.Count) { Write-Host "失敗：$($bad -join ', ')" }
