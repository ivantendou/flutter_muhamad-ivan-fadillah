# (18) Flutter State Management (BLoC)

1. State / keadaan adalah ketika sebuah widget sedang aktif dan widget tersebut menyimpan data di memori. Flutter akan membangun ulang UI-nya ketika ada state atau data yang berubah. Ada dua jenis state dalam Flutter, yaitu ephemeral state dan app state. Ephemeral State adalah state yang digunakan ketika tidak ada bagian lain pada widget tree yang membutuhkan untuk mengakses data widgetnya, contoh widget ini adalah PageView, BottomNavigationBar, dan Switc Button. Tidak perlu state management yang kompleks untuk ephemeral state. Sedangkan app state digunakan ketika bagian lain dari widget tree membutuhkan akses ke widgetnya seperti mekanisme login, pengaturan preferensi, atau mekanisme keranjang belanja.

2. Ada tiga pendekatan state management: setState, provider, dan BLoC. setState lebih cocok penggunaannya untuk ephemeral state. Sementara itu, provider cocok untuk app state. Ada juga di tingkat lebih lanjut penggunaan BLoC untuk app state. BLoC (Business Logic Component) memisahkan antara *business logic* dengan UI. BLoC bekerja dengan menerima *event* sebagai input, lalu itu dianalisa dan dikelola di dalam BLoC. Setelah itu akan menghasilkan *state* sebagai output. Terdapat konsep Stream, stream diibaratkan sebagai sebuah pipa yang didalamnya mengalir data. Sink adalah ketika kita mengonsumsi data stream tersebut di widget.

3. Untuk menggunakan BLoC kita perlu menambahkan package flutter_bloc dan equatable. Selanjutnya kita perlu menambahkan event, bloc, dan state-nya. Untuk mengimpl kita juga perlu menggunakan komponen BlocProvider dan BlocBuilder. BlocProvider adalah widget yang menyediakan instance dari sebuah Bloc ke subtree widget di bawahnya. Bloc dapat diakses oleh widget-widget di subtree ini menggunakan BlocProvider.of<T>(context), di mana T adalah tipe Bloc yang diinginkan.
```dart
BlocProvider(
  create: (context) => MyBloc(), 
  child: MyWidget(),
);
```
Sedangkan BlocBuilder adalah widget yang digunakan untuk membangun bagian dari UI yang bergantung pada keadaan (state) dari suatu Bloc. BlocBuilder akan melakukan rebuild ketika state dari Bloc berubah.
```dart
BlocBuilder<MyBloc, MyState>(
  builder: (context, state) {
    if (state is MyStateLoading) {
      return CircularProgressIndicator();
    } else if (state is MyStateLoaded) {
      return Text('Data: ${state.data}');
    } else {
      return Text('Error');
    }
  },
);
```