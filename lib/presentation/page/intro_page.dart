import 'package:anime/data/repository/local_repository_impl.dart';
import 'package:anime/presentation/page/main_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class IntroPage extends StatelessWidget {
  IntroPage({super.key});

  final _repo = LocalRepositoryImpl();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(forceMaterialTransparency: true),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Image.asset(
            'assets/images/img.png',
            fit: BoxFit.fill,
            height: double.infinity,
            width: double.infinity,
            opacity: const AlwaysStoppedAnimation(.7),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 36.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "zeto",
                    style: TextStyle(color: Colors.white, fontSize: 35),
                  ),
                  Gap(25),
                  Text('Embark on animated journey like\nnever before,'
                      'your gateway to the\nultimate anime experience!'),
                  Gap(25),
                  ElevatedButton(
                      onPressed: () => _onStart(context),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                      child: Text(
                        'Watch anime',
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void _onStart(BuildContext context) {
    _repo.saveIntro(true).then((value) {
      Navigator.of(context).pushAndRemoveUntil(
          CupertinoPageRoute(builder: (context) => const MainPage()), (route) => false);
    });
  }
}
