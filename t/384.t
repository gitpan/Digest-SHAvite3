use strict;
use warnings;
use Test::More tests => 68;
use Digest::SHAvite3 qw(shavite3_384 shavite3_384_hex);

my $len = 0;

while (my $line = <DATA>) {
    chomp $line;
    my ($msg, $digest) = split '\|', $line, 2;
    my $data = pack 'H*', $msg;
    $digest = lc $digest;

    if ($len and not $len % 8) {
        my $md = Digest::SHAvite3->new(384)->add($data)->hexdigest;
        is($md, $digest, "new/add/hexdigest: $len bits of $msg");
        is(
            shavite3_384_hex($data), $digest,
            "shavite3_384_hex: $len bits of $msg"
        );
        ok(
            shavite3_384($data) eq pack('H*', $digest),
            "shavite3_384: $len bits of $msg"
        );
    }

    my $md = Digest::SHAvite3->new(384)->add_bits($data, $len)->hexdigest;
    is($md, $digest, "new/add_bits/hexdigest: $len bits of $msg");
}
continue { $len++ }

__DATA__
00|814B55553CE7C0841F8FF0321E6287F9F50A8E0CAE811932385ECC1B7C386B4EB14EDB79C8381BABF09276B69D1BB3EE
00|C2D1C5AC1399D7C4BA3645D284E5865918081529A7633BC6705C0229A190283C9B0EC08F40F1F0352DB7BFB744645027
C0|C48FD789DF4E45DD82C1CE01DEA259DF0036D57533AAA41967CD2E58EEBC2071075943C0D9E58E97BBC6DBC080DAF33A
C0|9E13A5AD003073D8ECD53D0F38C611405477E5CF8A617955FC773A2A3D2054DB3CF3BF03BD51BE722051D4503B374C65
80|001F75721CC776281C0EA51243774A994A5BEA5046FEC954BEBC42D58796E06597820DA58EED8258FB56706E1C847A94
48|6F52755DF5D426E5E7865922E20A6071489CB3EA6BA24FED1274C9A4BB49911369FDDE9A91B8D70F2384FA13433061AF
50|90F20CB354D3DFF18B6283FA238239A2CEC79F7ABC81B8A3D3F6EFCA3F699030CC0B94EA7DE079CDC1FE08CD2DA51380
98|55591D563324DAB666859F9B453997044FF31710961F2234301EF85DE0CB8024BF4DF600645643EC45A7E0848A6B7912
CC|35DC52E484750C578BB53516D7299B0AE0B7B7C74C301A301B70B2C5DC627082A389B4EAC9085317D5E123A46DEC1ACB
9800|6E72BB1E4A86316140F8205B73EFC5A1E6EDFEA0FB63C7203C8FEE51BDC64C5727F78347174887C4A1002361D1CF0933
9D40|5FA684A61DB1DA42D597CDB6BE02B74738A36C15392E50EA8ED070DA6ABE8B8BBEA18EC25B6898610F245792A42F65B8
AA80|B07C67230D2A1BB6D0EB14AFA0D8157183D521154AEE0AB30237493209208FBF8EA51A96D56B3B2E3234C96CD30FC82D
9830|4D8AE348EFD486ABC506D6C56BDB68742A2E4B7FA11F49DA441347CE73C0A58E49293595AB4364504129B6FE58C0A198
5030|67BF49B0DA40511079906806EE7F1B37004916DEBDBA1F97F8C1BF6998BF97B73EAC7B3ABEB49A0182E148CBF1D94BDC
4D24|8E866AEB648E508A757904809E425D6D5899A99FC99FADC0E9F34E834490D28CDBE8BC1DD286E3F08A69E6E440E47B8D
CBDE|1818F539B5130C0CC245FAA36C4100A74ECCE5A28A8B33B648715B305FFEAC4451E274129C865A65D579218285733040
41FB|0A74A38F5106B39C76A332063248DF5021F15FF63A0A9B2E9774C902D6AD0AE9E1E746D933F82A88F9E7CC1BABA9C677
4FF400|508D3D39F67FEA93CBA73913C039D6BC9E1A8302CE8F02459D581D24279001C165C167908C0BE913616F139507411699
FD0440|3F620B5473A4B22C2C8DD8FC564379501E1EC39EA94C10B81EE7040AF711C4CFD26942316BE71609B8F8B69A6889E731
424D00|30EB24F7F3E4B933330A7EA820A97FA593281F8C616616EAFB7C0C5B51119BC117E8A367AD43738A74358D613B395B23
3FDEE0|43B35533117146A6BAF7553E416C5961D8F46CBF033B17E698014908EB8BC74DA40AD3A7308AEF1698987A4B080BA6B4
335768|8B02B23D7048683FDF633A6E1C90BF887D4B9B4BB46DA7364C70D4C93CB99FC743ADB785D9D05337DCF8BD529301E4D6
051E7C|9103A5F12C6D2D3EDF2510363FCCA3E4CBA91B765CA689328A8060243254B5258CB1C954BD74B33D6689B8ADC38DEFE6
717F8C|1D8D35322DF5224C82835BC94F61729EF27DFCFA9A8FC7FA3467AA117350A42E1F555BD881B23966F908DAB780D5BEF3
1F877C|B22E87C107A7135ABF1DAD9D2800FC5162631A49D2F727A30C991715A22ADB62EBDAC57DEFBFC95BD2C506B13071457F
EB35CF80|DF193E8B4D8B247F1E59E6F4EBBF16AB07E6BB7AC58AC4C723CCFDDC7FB8CC155F8692B0A6FF06C433BC346D9E9EF4C3
B406C480|86B0529AF92C407C7D41834331C0E4C645B7C2404FE93C6713A5A993B0CBA7D273F74F604EBE1C5B0A3159FC7933DA95
CEE88040|62606C92B7A7BDC11A2AAA3A3AEE5E1132A8D716FC8BB07C425D87C59566827A61F860A09F2EC38C447229492DF5B5E6
C584DB70|6A06F335B017CFA77592EBE6270BD187FEC59955363C5229CC9E644D4AA4FD5F132616EBD2F7714181506E56FB65A31E
53587BC8|FC185FC28C3003BB25D822DC909360ABE6D1F81B946F54E5E02FFFF2C2D8036028A2AC09FB46B5A963F20764B3DA70ED
69A305B0|490974C4576B0D501A156F936AE26F218B0AFE31A5326C3F619183FB723F6F14FBA6BE3384C72B620B0029983BDA2379
C9375ECE|0C8EED7504BA1EE5AA07F35382E1B09F6C7F8198B7A9A6B7FC242A196E699BF03A5BEE043A6CB67DC0CE568C6F501ECA
C1ECFDFC|6D8870E1492A00440CFF7E3BC62F403A049416941D1B29D4D79A000B7E1CA465537D05144C514503295D0F2592711838
8D73E8A280|2138CA56DCFAA0DD11D11D3BB3A5A12E636EB2F61B85F101D06B58A0252E809F726F5FC4CD940A75B15954F2D627957D
06F2522080|E1C493F2CD89143F8CA8ED79C03D4AD320F1C968F3DB865FD3E88EEE296CA3BBE92087265F698AEE2BD6A5C85157A815
3EF6C36F20|843DAADC40C27E8AE91C4B7B23FA381492695ED84D14343AC4EB2BA7DBA7E4DBA7C5B005209CFF2BF0DF3E61440077DD
0127A1D340|BA335031DCA93A503D081861A19F8B20BA29CA2D5FFD1275348D2A2DC25C0FC840ED11EEA9D630E6DA1B470C862CECBE
6A6AB6C210|19C4F2F5B1B34453BA648981E21D8CC9419AE0AC588F25E49AF1DD20FCC5820A3EFD88BF54DBCEF29AD3556977BCA5AB
AF3175E160|EC8B7CF9311645027DC416AD132D709C00CCD7846BE6789D63746567B10259090353B670AE7E6C4D5129F74BF57DF6DE
B66609ED86|E100B3DCEF948C4107498E0CF5259F34554C38B41E90231BCA7CADC723AE8896C02768A378145659B41BFA852C1C8050
21F134AC57|CFB6EE6B0242ECE6EE29836AAA5AFFFECD68374AC1CB073C8D8E0136765ED75992E8527F79905DFC4265FE7E5EC6F4AF
3DC2AADFFC80|11CACC1628AF566755E17F2492DCB3A4D4C9E1D533BB678D6B661DDA332E3E81F13F029E508FF400435AC1444C79DCCE
9202736D2240|EFDC378BA272AF9FC1FBF301BBC9FD9C21876AAE95D889A3E9685DEDEA4A56AA00D58EC3E85240DDEB87D15E8907150A
F219BD629820|9FAC789BD813BB8F7D18E54B1E5EB01B4035B840967E5A8228413AFAF4F3FF63E874547FDAF9CA112EF5A282A9EEDF23
F3511EE2C4B0|4F5C92831B47A93EFF8F300FE399E685ABB07E98BD431F981F30A62AEF91976E298C5619AEEBF2686BFC172E0D4F97B6
3ECAB6BF7720|98A240CF634B8D2C94EA92899CA79D26B957B0919695A545A3E9262ED5A1EC967342A466D8F3C074BC774B126837690A
CD62F688F498|01846880B244089905F3D798EBBD95813CFA30A9D545C4DEEAE68C942C47B27DF1BA8C8BB5687B1959CF25FA8D15B554
C2CBAA33A9F8|ED3CE767DFABD14FECF8FB0969E6FA1973A3AC31F5568B65E04954902DAF9AC461B4FC48F6AA877B5A6BED8F0B0F8F7E
C6F50BB74E29|D89FC0841ADBC06E88CA08A8FBE5946F7B08DE785CE57778B78786EAFFB7FBD813299B09D898458D27FAE15A0816B230
79F1B4CCC62A00|472F43D9A86119B4CA7376D2FBDAE0318496AD93B29E8DB97D1CFA179944B472969FDD77EA0B4DC1BF2ED28FF2D1ED5D