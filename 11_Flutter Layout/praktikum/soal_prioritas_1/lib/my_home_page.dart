import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Material App'),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: const PersonList(
          person: [
            Person(
              name: 'Kurtis Weissnat',
              id: '210.067.6132',
            ),
            Person(
              name: 'Nicholas Runolfsdottir V',
              id: '586.493.6943 x140',
            ),
            Person(
              name: 'Glennda Reichert',
              id: '(775)976-6794 x41206',
            ),
            Person(
              name: 'Clementia DuBuque',
              id: '024-648-3804',
            ),
            Person(
              name: 'Leanne Graham',
              id: '1-770-7360-8031 x56442',
            ),
            Person(
              name: 'Ervin Howell',
              id: '010-692-6593 x09125',
            ),
            Person(
              name: 'Clementine Bauch',
              id: '1-463-123-4447',
            ),
            Person(
              name: 'Patricia Lebsack',
              id: '493-170-9623 x156',
            ),
            Person(
              name: 'Chelsey Dietrich',
              id: '(254)954-1289',
            ),
            Person(
              name: 'Mrs. Dennis Schulist',
              id: '1-477-935-8478 x6430',
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.green,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: const [
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Person {
  const Person({required this.name, required this.id});

  final String name;
  final String id;
}

class PersonList extends StatelessWidget {
  const PersonList({
    super.key,
    required this.person,
  });

  final List<Person> person;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: person.map((person) {
        return PersonListItem(
          person: person,
        );
      }).toList(),
    );
  }
}

class PersonListItem extends StatelessWidget {
  const PersonListItem({super.key, required this.person});

  final Person person;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.orange,
        child: Text(person.name[0]),
      ),
      title: Text(person.name),
      subtitle: Text(person.id),
    );
  }
}
