import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AnaUygulama extends StatefulWidget {

  @override
  State<AnaUygulama> createState() => _AnaUygulamaState();
}

 class _AnaUygulamaState extends State<AnaUygulama> {

 final String _apiKey = "3bdd2951882560aa06e8228768d5c2b8";
 final String _baseUrl ="https://api.exchangeratesapi.io/v1/latest?access_key=";

 TextEditingController _controller =TextEditingController();

 Map<String,double> _oranlar={
   "USD": 37.113035,
   "EUR": 37.113035,
 };

 String _secilenKur = "USD";
 double _sonuc =0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kur Dönüştürücü",style: TextStyle(fontSize: 25),),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(children: [
              Expanded(child: TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)
                    )
                ),
              ),
              ),
              SizedBox(width: 16,),
              DropdownButton<String>(
                  value: _secilenKur,
                  icon: Icon(Icons.arrow_downward),
                  underline: SizedBox(),
                  items: _oranlar.keys.map((String kur){
                    return DropdownMenuItem<String>(
                      value: kur,
                        child: Text(kur),
                    );
                  }).toList(),
                  onChanged:(String? yeniDeger){
                    if(yeniDeger!=null){
                      setState(() {
                        _secilenKur=yeniDeger;
                      });
                    }
                  },
              ),
            ],),
            SizedBox(height: 16,),
            Text(
                "${_sonuc.toString()} TL",
              style: TextStyle(fontSize: 24),
            ),
            Container(
              height: 2,
              color: Colors.black,
            ),
            SizedBox(height: 16,),
            Expanded(
              child: ListView.builder(
                itemCount: _oranlar.keys.length,
                  itemBuilder: _buildListItem,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListItem(BuildContext context, int index) {
    return ListTile(
      title: Text(_oranlar.keys.toList()[index]),
      trailing: Text(_oranlar.values.toList()[index].toStringAsFixed(2)),
    );
  }
}


/*
{
    "success": true,
    "timestamp": 1519296206,
    "base": "EUR",
    "date": "2021-03-17",
    "rates": {
        "AUD": 1.566015,
        "CAD": 1.560132,
        "CHF": 1.154727,
        "CNY": 7.827874,
        "GBP": 0.882047,
        "JPY": 132.360679,
        "USD": 1.23396,
    [...]
    }
}
 */
