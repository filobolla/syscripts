#!/bin/bash

lecture=22598
i=1
while [ $lecture -ge 20000 ]; do
    echo "Lecture ${lecture}"
    url="https://elearning.polito.it/gadgets/video/template_video.php?id_lez=${lecture}&inc=228101&f=1&id_corso=1068&utente=S236973&data=230220201628&token=f3b5f4ab72fad3adb320e04211a8be4f"
    curl ''"${url}"'' -H 'Connection: keep-alive' -H 'Cache-Control: max-age=0' -H 'Upgrade-Insecure-Requests: 1' -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.116 Safari/537.36' -H 'Sec-Fetch-Dest: document' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9' -H 'Sec-Fetch-Site: same-origin' -H 'Sec-Fetch-Mode: navigate' -H 'Sec-Fetch-User: ?1' -H 'Referer: https://didattica.polito.it/pls/portal30/sviluppo.pagina_corso.main?t=3' -H 'Accept-Language: it-IT,it;q=0.9,en-US;q=0.8,en;q=0.7' -H 'Cookie: language=it; ShibCookie=S245069%7CStudenti%7Chttps%3A%2F%2Fidp.polito.it%2Fidp%2Fshibboleth%7C1582453780%7C3ddc605618d81283191715e39e78e3f3b56cc9ca; OHS-didattica.polito.it-443=9D5E3479420853E04096A8EDE1F484D39E50B990FE3E20B5BBD804BAFC35018F2FC5B6583C6716C4293DE8A1AFF69A1176357259385C0FC9A44305F8A8FF01C7FFBD4C13ADFA8331DC7E069883ECB4F684EB3871511CD094CA9D4D9D90F9460CED2E3B2128FD4E45E3DAA09A815C743BB66F3A481CDE292C1A508149AD1CBCF90EC372119054DA313DA23AEFC882BCA5D9191CB2465BE839A38CE22063D80FE4B287324488BFDA2A43553A78ED9E13B77161BC2B28EF21D372AA756FCCA88C3CD17D489E553383F0DC7887E439564DF9A22FECBF1E0C1377FBA174EB2643B586182AF528E7F9F63430F2F8E869E0F6F4AFF3955F6636BAC083F3330B70394C97F4EFB0F1D88D5338F5590BA86B2987C6~1D67E5FB31D7A295B734A3E55E38F1DE; DEV_PORTAL=11.1+en-us+us+AMERICA+9F3CB78BAE04E6A8E050C0828C373247+FA74173D5E41F53A74B3286C18D9DCBCF064CB408F4964A67E832CCA9D596A1360F0CB4D66CE5D7F07B99BC927E6BBD0D559438AEB45D267EA4920A8874D7572F9AC137EC96ABE523C311E5154A36E98; dida_portal=11.1+en-us+us+AMERICA+9F3CB78BAE04E6A8E050C0828C373247+FA74173D5E41F53A74B3286C18D9DCBCF064CB408F4964A67E832CCA9D596A1360F0CB4D66CE5D7F07B99BC927E6BBD0D559438AEB45D267EA4920A8874D7572F9AC137EC96ABE523C311E5154A36E98' --compressed > $(pwd)/tmp.txt
    grep -e "^accesso non consentito*" tmp.txt
    if [ $? -ne 0 ]; then
        title=$(grep -v 'Download' tmp.txt | grep -E '<h2>(\w).+<\/h2>' | sed -e 's/<[^>]*>//g')
        echo $title
        echo -e "$title:""\t""$url" >> "$(pwd)"/lectures_elearning.txt
    fi
    ((lecture--))
    sleep 3
    
done
rm tmp.txt