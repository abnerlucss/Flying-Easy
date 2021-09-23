import 'package:app_passagens_aereas/modules/shared/constants/color_constants.dart';
import 'package:flutter/material.dart';

class HomeDrawerWidget extends StatefulWidget {
  const HomeDrawerWidget({Key? key}) : super(key: key);

  @override
  _HomeDrawerWidgetState createState() => _HomeDrawerWidgetState();
}

class _HomeDrawerWidgetState extends State<HomeDrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.close,
                  color: Color(
                    ColorConstants.darkPrimaryBlue,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Icon(
              Icons.account_circle,
              color: Color(ColorConstants.darkPrimaryBlue),
              size: 120,
            ),
            Text(
              "Username",
              style: TextStyle(
                fontSize: 22,
                color: Color(ColorConstants.darkPrimaryBlue),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ListTile(
              leading: Icon(Icons.data_saver_off),
              title: Text('Meus dados'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.bookmark),
              title: Text('Minhas passagens'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Configurações'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text('Ajuda'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.people),
              title: Text('Sobre nós'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
