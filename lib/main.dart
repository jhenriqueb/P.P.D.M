import 'package:flutter/material.dart';
import 'bares_hoteis_page.dart';
import 'alta_gastronomia_page.dart';
import 'cafes_page.dart';
import 'perto_de_mim_page.dart';
import 'fast_foods_page.dart';
import 'destaques_page.dart';

// -----------------------------
// PÁGINAS DO BOTTOM NAVIGATION
// -----------------------------
// Cada página abaixo representa uma tela acessível pelo BottomNavigationBar.
// Todas seguem o mesmo padrão visual e estrutura para manter a consistência.

// Página inicial (Início)
class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    // Scaffold é o layout base de cada tela, fornecendo estrutura visual padrão do Material Design.
    return Scaffold(
      appBar: AppBar(title: const Text('Início'), centerTitle: true),
      body: const Center(child: Text('Página Inicial', style: TextStyle(fontSize: 20, color: Colors.white))),
    );
  }
}
// Página de Favoritos
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
// Página Top Foods
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
// Página de Perfil
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

// -----------------------------
// PONTO DE ENTRADA DO APP
// -----------------------------
void main() {
  // runApp é a função que inicializa o app Flutter.
  // O widget passado aqui será a raiz da árvore de widgets.
  runApp(const MyApp());
}

// -----------------------------
// WIDGET PRINCIPAL DO APP
// -----------------------------
// StatelessWidget é usado quando o widget não precisa armazenar estado interno.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp configura o app inteiro: tema, navegação, título, etc.
    return MaterialApp(
      title: 'Descoberta',
      // Definição do tema global do app. O ThemeData permite personalizar cores, fontes, etc.
      theme: ThemeData(
        brightness: Brightness.dark, // Define o tema escuro
        colorScheme: ColorScheme.dark(
          primary: Colors.blue.shade900, // Cor principal (AppBar, botões ativos)
          secondary: Colors.blueAccent,  // Cor de destaque
          background: Colors.black,      // Cor de fundo
        ),
        scaffoldBackgroundColor: Colors.black, // Fundo padrão das telas
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black, // Fundo do AppBar
          foregroundColor: Colors.white, // Cor dos textos/ícones do AppBar
        ),
        useMaterial3: true, // Usa o novo padrão visual do Material 3
      ),
      home: const MainNavigation(), // Widget que controla a navegação principal
      debugShowCheckedModeBanner: false, // Remove a faixa "debug" do canto
    );
  }
}

// -----------------------------
// NAVEGAÇÃO PRINCIPAL (BOTTOM NAV)
// -----------------------------
// StatefulWidget é usado porque precisamos atualizar a tela ao trocar de aba.
class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});
  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  // Índice da aba selecionada. Começa em 1 (Descoberta).
  int _selectedIndex = 1;

  // Lista de páginas correspondentes a cada item do BottomNavigationBar.
  // A ordem dos widgets deve ser igual à ordem dos itens do BottomNavigationBar.
  final List<Widget> _pages = const [
    HomePage(),
    DiscoveryPage(),
    FavoritosPage(),
    TopFoodsPage(),
    PerfilPage(),
  ];

  // Função chamada ao tocar em um item do BottomNavigationBar.
  // Atualiza o índice e força o rebuild da tela.
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Scaffold aqui serve apenas para o BottomNavigationBar e para exibir a página selecionada.
    return Scaffold(
      body: _pages[_selectedIndex], // Exibe a página correspondente ao índice
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blueGrey[900], // Cor de fundo da barra
        selectedItemColor: Colors.blueAccent,   // Cor do item selecionado
        unselectedItemColor: Colors.white70,    // Cor dos itens não selecionados
        currentIndex: _selectedIndex,           // Índice atual
        onTap: _onItemTapped,                   // Função ao tocar
        type: BottomNavigationBarType.fixed,    // Permite mais de 3 itens
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

// -----------------------------
// TELA PRINCIPAL DE DESCOBERTA
// -----------------------------
// Exibe os cards principais do app, cada um levando a uma página diferente.
class DiscoveryPage extends StatelessWidget {
  const DiscoveryPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista de dados dos cards. Cada card tem título, ícone, subtítulo, destaque e página de destino.
    final List<_DiscoveryCardData> cards = [
      _DiscoveryCardData('Bares & Hotéis', Icons.local_bar, '42 Lugares', page: const BaresHoteisPage()),
      _DiscoveryCardData('Alta Gastronomia', Icons.restaurant, '15 Lugares', page: const AltaGastronomiaPage()),
      _DiscoveryCardData('Cafés', Icons.local_cafe, '28 Lugares', page: const CafesPage()),
      _DiscoveryCardData('Perto de Mim', Icons.location_on, '34 Lugares', highlight: true, page: const PertoDeMimPage()),
      _DiscoveryCardData('Fast Foods', Icons.fastfood, '29 Lugares', page: const FastFoodsPage()),
      _DiscoveryCardData('Destaques', Icons.local_pizza, '21 Lugares', page: const DestaquesPage()),
    ];

    // Scaffold fornece a estrutura visual da tela.
    return Scaffold(
      appBar: AppBar(
        title: const Text('Descoberta', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        // GridView.builder cria uma grade de widgets dinamicamente.
        // Aqui, usamos 2 colunas e espaçamento entre os cards.
        child: GridView.builder(
          itemCount: cards.length, // Quantidade de cards
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,      // 2 colunas
            mainAxisSpacing: 16,    // Espaço vertical
            crossAxisSpacing: 16,   // Espaço horizontal
            childAspectRatio: 1.2,  // Proporção largura/altura dos cards
          ),
          itemBuilder: (context, index) {
            final card = cards[index];
            return _DiscoveryCard(card: card); // Cria o widget visual do card
          },
        ),
      ),
    );
  }
}

// -----------------------------
// CLASSE DE DADOS DO CARD
// -----------------------------
// Armazena as informações necessárias para montar cada card.
class _DiscoveryCardData {
  final String title;      // Título do card
  final IconData icon;     // Ícone do card
  final String subtitle;   // Subtítulo (quantidade de lugares)
  final bool highlight;    // Se o card deve ser destacado (azul)
  final Widget page;       // Página de destino ao clicar
  _DiscoveryCardData(this.title, this.icon, this.subtitle, {this.highlight = false, required this.page});
}

// -----------------------------
// WIDGET VISUAL DO CARD
// -----------------------------
// Responsável por desenhar o card na tela e lidar com o clique.
class _DiscoveryCard extends StatelessWidget {
  final _DiscoveryCardData card;
  const _DiscoveryCard({required this.card});

  @override
  Widget build(BuildContext context) {
    // Material + InkWell fornecem efeito visual de clique (ripple) e arredondamento.
    return Material(
      color: card.highlight ? Colors.blue.shade900 : Colors.grey.shade900, // Destaque azul para "Perto de Mim"
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        // Ao tocar, navega para a página correspondente usando Navigator.push.
        // Isso empilha a nova página sobre a atual, permitindo voltar facilmente.
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => card.page),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Centraliza verticalmente
            children: [
              Icon(
                card.icon,
                size: 40,
                color: card.highlight ? Colors.blueAccent : Colors.white, // Ícone azul se destacado
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
