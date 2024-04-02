import 'package:flutter/material.dart';
import 'package:soal_prioritas_2_dan_eksplorasi/constant/route_paths_cosntant.dart';
import 'package:soal_prioritas_2_dan_eksplorasi/page/gallery/gallery_provider.dart';
import 'package:provider/provider.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Gallery'),
        centerTitle: true,
      ),
      body: Consumer<GalleryProvider>(
        builder: (context, galleryProvider, child) {
          return GridView.builder(
            padding: const EdgeInsets.all(10.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
            ),
            itemCount: galleryProvider.imagePath.length,
            itemBuilder: (BuildContext context, int index) {
              final imageNumber = index + 1;
              return InkWell(
                onTap: () {
                  showModalBottomSheet(
                    shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    context: context,
                    builder: (BuildContext context) {
                      return SizedBox(
                        height: 400,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(32.0),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.asset(
                                  galleryProvider.imagePath[index],
                                  fit: BoxFit.cover,
                                  width: 200,
                                  height: 200,
                                ),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Text('Gambar $imageNumber'),
                              const SizedBox(
                                height: 10.0,
                              ),
                              const Text(
                                  'Apakah Anda ingin melihat lebih detail?'),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      Navigator.pushNamed(
                                        context,
                                        RoutePaths.detailImage,
                                        arguments: galleryProvider
                                            .imagePath[index]
                                            .toString(),
                                      );
                                    },
                                    child: const Text('Ya'),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Tidak'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(
                    galleryProvider.imagePath[index],
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          );
        },
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text('Contact'),
              onTap: () {
                Navigator.pushNamed(context, RoutePaths.contact);
              },
            ),
            const Divider(),
            ListTile(
              title: const Text('Gallery'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
