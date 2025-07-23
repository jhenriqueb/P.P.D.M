import 'package:flutter/material.dart';
import 'bares_hoteis_page.dart';
import 'alta_gastronomia_page.dart';
import 'cafes_page.dart';
import 'perto_de_mim_page.dart';
import 'fast_foods_page.dart';
import 'destaques_page.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Início'), centerTitle: true),
      body: const Center(child: Text('Página Inicial', style: TextStyle(fontSize: 20, color: Colors.white))),
    );
  }
}

class FavoritosPage extends StatelessWidget {
  const FavoritosPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favoritos'), centerTitle: true),
      body: const Center(child: Text('Página de Favoritos', style: TextStyle(fontSize: 20, color: Colors.white))),
    );
  }
}

class TopFoodsPage extends StatelessWidget {
  const TopFoodsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Top Foods'), centerTitle: true),
      body: const Center(child: Text('Página Top Foods', style: TextStyle(fontSize: 20, color: Colors.white))),
    );
  }
}

class PerfilPage extends StatelessWidget {
  const PerfilPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Perfil'), centerTitle: true),
      body: const Center(child: Text('Página de Perfil', style: TextStyle(fontSize: 20, color: Colors.white))),
    );
  }
}


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Descoberta',
      theme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.dark(
          primary: Colors.blue.shade900,
          secondary: Colors.blueAccent,
          background: Colors.black,
        ),
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        useMaterial3: true,
      ),
      home: const MainNavigation(),
      debugShowCheckedModeBanner: false,
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});
  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 1;
  
  final List<Widget> _pages = const [
    HomePage(),
    DiscoveryPage(),
    FavoritosPage(),
    TopFoodsPage(),
    PerfilPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], 
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blueGrey[900],
        selectedItemColor: Colors.blueAccent, 
        unselectedItemColor: Colors.white70, 
        currentIndex: _selectedIndex,     
        onTap: _onItemTapped,                 
        type: BottomNavigationBarType.fixed,   
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Início'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Descoberta'),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'Favoritos'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Top Foods'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
    );
  }
}

class DiscoveryPage extends StatelessWidget {
  const DiscoveryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<_DiscoveryCardData> cards = [
      _DiscoveryCardData('Bares & Hotéis', Icons.local_bar, '42 Lugares', page: const BaresHoteisPage()),
      _DiscoveryCardData('Alta Gastronomia', Icons.restaurant, '15 Lugares', page: const AltaGastronomiaPage()),
      _DiscoveryCardData('Cafés', Icons.local_cafe, '28 Lugares', page: const CafesPage()),
      _DiscoveryCardData('Perto de Mim', Icons.location_on, '34 Lugares', highlight: true, page: const PertoDeMimPage()),
      _DiscoveryCardData('Fast Foods', Icons.fastfood, '29 Lugares', page: const FastFoodsPage()),
      _DiscoveryCardData('Destaques', Icons.local_pizza, '21 Lugares', page: const DestaquesPage()),
    ];
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Descoberta', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),

        child: GridView.builder(
          itemCount: cards.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,     
            mainAxisSpacing: 16, 
            crossAxisSpacing: 16,  
            childAspectRatio: 1.2,  
          ),
          itemBuilder: (context, index) {
            final card = cards[index];
            return _DiscoveryCard(card: card); 
          },
        ),
      ),
    );
  }
}


class _DiscoveryCardData {
  final String title;     
  final IconData icon;  
  final String subtitle; 
  final bool highlight;    
  final Widget page;   
  _DiscoveryCardData(this.title, this.icon, this.subtitle, {this.highlight = false, required this.page});
}


class _DiscoveryCard extends StatelessWidget {
  final _DiscoveryCardData card;
  const _DiscoveryCard({required this.card});

  @override
  Widget build(BuildContext context) {
   
    return Material(
      color: card.highlight ? Colors.blue.shade900 : Colors.grey.shade900, 
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
       
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => card.page),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, 
            children: [
              Icon(
                card.icon,
                size: 40,
                color: card.highlight ? Colors.blueAccent : Colors.white, 
              ),
              const SizedBox(height: 12),
              Text(
                card.title,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
              ),
              const SizedBox(height: 6),
              Text(
                card.subtitle,
                style: TextStyle(color: Colors.blueGrey[100], fontSize: 13),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
