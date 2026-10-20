# 下載手冊照片到 img/
import os,urllib.parse,urllib.request
photos={'hero-snow': '室堂雪の大谷01.jpg', 'card-tateyama': '080504 Murodo-sanso Mount Masago Tateyama Japan02s5.jpg', 'card-kanazawa': 'Ishikawa Higashi Chaya gai at night xl.jpg', 'card-yamashiro': 'Yamashiro Onsen 260124 06.jpg', 'card-nagoya': 'Nagoya_TV_Tower_and_Oasis_21.JPG', 'd1-gate': 'Kanazawa-STA Tsuzumi-mon.jpg', 'd2-kenroku': 'Kenrokuen 2011-04 (5840979505).jpg', 'kenroku-kotoji': 'Kotoji Toro (lantern) - Kenroku-en - Kanazawa, Japan - DSC09657.jpg', 'd3-yamashiro': 'Yamashiro Onsen 260124 05.jpg', 'd4-canal': 'Fugan-unga Kansui Park 013.jpg', 'd5-otani': '080504 Tateyama otani-road Tateyama Japan02s3.jpg', 'strip-snow': '室堂雪の大谷02.jpg', 'strip-kurobe': '黒部ダム01.jpg', 'd6-atsuta': 'Atsuta-jingū (Atsuta-ku, Nagoya) VLux5 hdsr sa01.jpg', 'unagi': 'Hitsumabushi by Daikantei.jpg', 'd7-castle': 'Nagoya Castle(Larger).jpg', 'ev-keiba': 'アンデスビエント 関東オークス入線時.jpg', 'd8-musky': 'Nagoya Railway 2000.jpg', 'ev-nabana': 'Nabana no Sato Chapel Illumination.jpg'}
os.makedirs('img',exist_ok=True); bad=[]
for k,f in photos.items():
    url='https://commons.wikimedia.org/wiki/Special:FilePath/'+urllib.parse.quote(f)+'?width=1600'
    try:
        req=urllib.request.Request(url,headers={'User-Agent':'TravelHandbook/1.0 (personal use)'})
        with urllib.request.urlopen(req,timeout=30) as r, open(f'img/{k}.jpg','wb') as o: o.write(r.read())
        print('OK  ',k)
    except Exception as e: print('FAIL',k,e); bad.append(k)
print(f'完成 {len(photos)-len(bad)} / {len(photos)} 張', ('；失敗：'+', '.join(bad)) if bad else '')
