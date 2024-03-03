import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:noticiario/components/NewsList.dart';

import '../components/Top.dart';
import '../models/News.dart';

class HomeManager extends StatefulWidget{
  @override
  Home createState() => Home();
}

class Home extends State<HomeManager>{
  int _currentIndex = 0;

  List<News> top_news = [
    News('Un nuevo sondeo confirma la ventaja de Trump sobre Biden a ocho meses de las elecciones en EE UU', 'https://imagenes.elpais.com/resizer/3GdKve-0fh1yhj2jnYh559PHimU=/980x0/filters:focal(845x193:855x203)/cloudfront-eu-central-1.images.arcpublishing.com/prisa/3JYBYIKF4VE6HFBF74Q3XUM75Q.jpg'),
    News('Alekséi Navalni, el opositor inmune al miedo en Rusia', 'https://s2.ppllstatics.com/rc/www/multimedia/2024/02/16/navalni-muerto-rusia-putin-kRgC-U2101550593774t0C-1200x840@RC.jpg'),
    News("El PSOE pide a Ábalos que entregue su acta de diputado", "https://imagenes.elpais.com/resizer/j7F6KOFYAhkLpWnqPD3ILKQt_X0=/1200x0/cloudfront-eu-central-1.images.arcpublishing.com/prisa/72COUZBCERDZRMYIZKAKPH2AII.jpg")
  ];

  List<List<News>> list_news = [
    //Internacional
    [
      News("EEUU lanza ayuda humanitaria a Gaza desde el aire","https://imagenes.elpais.com/resizer/5aPZ4cbxmggKigDUlCM3EJ6jPak=/828x621/cloudfront-eu-central-1.images.arcpublishing.com/prisa/3YPJ2C3MZNCSPIS3AZLODALLGI.JPG"),
      News("El Gobierno cubano pide por primera vez a la ONU el envío urgente de leche para niños","https://imagenes.elpais.com/resizer/Dk6lYRX4a7r4owlu37x05aP0yxI=/980x0/filters:focal(1029x1067:1039x1077)/cloudfront-eu-central-1.images.arcpublishing.com/prisa/IM7XQZJXVCJOYNFKVCL6PFXGB4.jpg"),
      News("El camino a la Casa Blanca empieza en la frontera","https://imagenes.elpais.com/resizer/VSzAdrmXvSpbGvu_JsPwYRR5mf4=/980x0/filters:focal(2553x1592:2563x1602)/cloudfront-eu-central-1.images.arcpublishing.com/prisa/RESMYH6CPZFZNGTHATKNZXVN6Q.JPG"),
      News("Xiamen, la ciudad china que intenta atraer a su lado a Taiwán","https://imagenes.elpais.com/resizer/QxZvCQjZ_gqIhVlSN30NTFZXmQg=/980x0/cloudfront-eu-central-1.images.arcpublishing.com/prisa/RBT3CL4QPZFMFIDIO4XYZG2RG4.jpg"),
    ],
    //Europe
    [
      News("El narco, más fuerte que nunca, inunda Europa de cocaína", "https://imagenes.elpais.com/resizer/tDSHciFE36hGu8UBIhO64x0MxfY=/980x0/cloudfront-eu-central-1.images.arcpublishing.com/prisa/EYNQEOCHW5GUVL4R4BSJPWZUCY.jpg"),
      News("Europa se pone en pie de guerra", "https://imagenes.elpais.com/resizer/REy5jzFex-NOfzpZSsJbiXX9Sjs=/1200x675/cloudfront-eu-central-1.images.arcpublishing.com/prisa/KMVW5BLLAJBIHKZB4QDRYUDSBA.jpg"),
      News("El Hierro se resigna a ser la puerta de atrás de Europa", "https://imagenes.elpais.com/resizer/gO98f_xxu3oPxtnJwVTlEpRqBHw=/980x0/cloudfront-eu-central-1.images.arcpublishing.com/prisa/O75JG6CPGNHQ7ONZ2IU4FFCKUU.jpg"),
      News("Rishi Sunak asegura que el islamismo radical y la extrema derecha amenazan la democracia británica", "https://imagenes.elpais.com/resizer/D8YC6lHNZqLYtB8kecyxxLL8Cyo=/1200x675/cloudfront-eu-central-1.images.arcpublishing.com/prisa/RNN5YKLZI5D2XC5GK2HLTIZK4E"),
      News("Alemania investiga un caso de espionaje ruso a su ejército sobre la guerra de Ucrania", "https://imagenes.elpais.com/resizer/Tbv4jaIhUri48CEk9xHUd-2eKK8=/980x0/cloudfront-eu-central-1.images.arcpublishing.com/prisa/DG5RJLQAHWVCAEDFJH2KNAEMPA.jpg")
    ],
    //Spain
    [
      News("Regular a golpe de tragedia: las consecuencias del incendio de Valencia", "https://imagenes.elpais.com/resizer/54TQ7zFfIsnngEhD0iW4y6sYJp8=/980x0/cloudfront-eu-central-1.images.arcpublishing.com/prisa/AEPTPNOSPVBWVHJMUASIJAMU2E.JPG"),
      News("Puigdemont habla de una nueva etapa en una semana clave de la amnistía", "https://imagenes.elpais.com/resizer/xpIkZkAvAMZgSgO4tKRU2Op5w2s=/1200x675/cloudfront-eu-central-1.images.arcpublishing.com/prisa/Z73V4646LZBHFCRKV4JJSYTTJU.jpg"),
      News("Miguel Ángel Gallardo, elegido sucesor de Fernández Vara al frente del PSOE extremeño", "https://imagenes.elpais.com/resizer/o9d2kZqqc2vJiGmxbDS0Us8eF7w=/980x0/filters:focal(1089x446:1099x456)/cloudfront-eu-central-1.images.arcpublishing.com/prisa/ZBXRIG3Q45FTPAS6XESRYPVJXI.jpg"),
      News("Puigdemont habla de una nueva etapa en una semana clave de la amnistía", "https://imagenes.elpais.com/resizer/xpIkZkAvAMZgSgO4tKRU2Op5w2s=/1200x675/cloudfront-eu-central-1.images.arcpublishing.com/prisa/Z73V4646LZBHFCRKV4JJSYTTJU.jpg"),
      News("La derivada del ‘caso Koldo’ en Baleares: un contrato lleno de agujeros y sin rastro de comisiones ilegales", "https://imagenes.elpais.com/resizer/R5K72u2Kfr1vzqgbMvlyVGWmt5k=/1200x675/cloudfront-eu-central-1.images.arcpublishing.com/prisa/VPLH3CORLRD6PMSOOTCBLDUAWI.jpg"),
    ]
  ];

  List<List<News>> recommended_news = [
    //Internacional
    [
      News("Coronavirus: ¿ha perdido agresividad el SARS-CoV-2?","https://www.efsa.europa.eu/sites/default/files/news/coronavirus.jpg"),
      News("La dimisión del Gobierno, un paso necesario para la reconciliación de la familia palestina","https://imagenes.elpais.com/resizer/jquJgPSy0avwOJ4FjiRCrS7GHo8=/828x0/filters:focal(1811x2125:1821x2135)/cloudfront-eu-central-1.images.arcpublishing.com/prisa/LCOO57BPLNDXLIDV6SWCUVZMHM.jpg"),
      News("EEUU lanza ayuda humanitaria a Gaza desde el aire","https://imagenes.elpais.com/resizer/5aPZ4cbxmggKigDUlCM3EJ6jPak=/828x621/cloudfront-eu-central-1.images.arcpublishing.com/prisa/3YPJ2C3MZNCSPIS3AZLODALLGI.JPG"),
      News("¿Para qué se convocan elecciones en Irán?","https://imagenes.elpais.com/resizer/NFR4UEF9cCPYy7mdSmqSV0zn-B4=/828x0/cloudfront-eu-central-1.images.arcpublishing.com/prisa/7GLXGMZIIMSZFK24RQMPNKQD6Y.jpg")
    ],
    //Europe
    [
      News("A pie, con drones ‘kamikaze’ y poca artillería: así defiende Ucrania sus avances en Robotine","https://imagenes.elpais.com/resizer/wi1vQFcL-PSIcXSIV8fos3nb5Rw=/980x0/cloudfront-eu-central-1.images.arcpublishing.com/prisa/I2WNVNNWC4C4NFCHWMMQDYGLLA.jpg"),
      News("Nuevos eurobonos para una nueva UE","https://imagenes.elpais.com/resizer/zKQij8-Jqpil_EYr1sjVHiTApCI=/828x0/filters:focal(2470x780:2480x790)/cloudfront-eu-central-1.images.arcpublishing.com/prisa/LSDFCCMTQ5LFKLHNSGCFGYIEJU.jpg"),
      News("Alemania investiga un caso de espionaje ruso a su ejército sobre la guerra de Ucrania", "https://imagenes.elpais.com/resizer/Tbv4jaIhUri48CEk9xHUd-2eKK8=/980x0/cloudfront-eu-central-1.images.arcpublishing.com/prisa/DG5RJLQAHWVCAEDFJH2KNAEMPA.jpg")
    ],
    //Spain
    [
      News("Así mueren de éxito los negocios creados en Madrid para impresionar en las redes", "https://imagenes.elpais.com/resizer/dF85COCYcs-ZMdcxXj7v0GK-Mlg=/980x0/cloudfront-eu-central-1.images.arcpublishing.com/prisa/TOSVK5BELVEURNWOGTDS3IYKN4.jpeg"),
      News("La semana con la luz más barata de la historia", "https://imagenes.elpais.com/resizer/nDzyORwd602L8MRk6locV7qSUvU=/980x0/filters:focal(758x840:768x850)/cloudfront-eu-central-1.images.arcpublishing.com/prisa/PVPOI6A6UVHPZHWVKNTHRWCIT4.jpg"),
      News("Puigdemont habla de una nueva etapa en una semana clave de la amnistía", "https://imagenes.elpais.com/resizer/xpIkZkAvAMZgSgO4tKRU2Op5w2s=/1200x675/cloudfront-eu-central-1.images.arcpublishing.com/prisa/Z73V4646LZBHFCRKV4JJSYTTJU.jpg"),
      News("El PSOE pide a Ábalos que entregue su acta de diputado", "https://imagenes.elpais.com/resizer/j7F6KOFYAhkLpWnqPD3ILKQt_X0=/1200x0/cloudfront-eu-central-1.images.arcpublishing.com/prisa/72COUZBCERDZRMYIZKAKPH2AII.jpg")
    ]
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: ListView(
        children: [Top(top_news[_currentIndex], recommended_news[_currentIndex]), NewsList(list_news[_currentIndex])],
      ),
      bottomNavigationBar: bottomNav(),
    );
  }

  BottomNavigationBar bottomNav() {
    return BottomNavigationBar(
      backgroundColor: Colors.blue,
      selectedItemColor: Theme.of(context).colorScheme.background,
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      items: <BottomNavigationBarItem>[
        const BottomNavigationBarItem(icon: Icon(Icons.public), label: "Internacional"),
        const BottomNavigationBarItem(icon: Icon(Icons.euro), label: "Europa"),
        const BottomNavigationBarItem(icon: Icon(Icons.location_on), label: "España"),
      ],
    );
  }
  
}