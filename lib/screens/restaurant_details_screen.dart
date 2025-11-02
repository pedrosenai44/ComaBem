
import 'package:flutter/material.dart';

class RestaurantDetailsScreen extends StatelessWidget {
  final Map<String, String> restaurante;
  const RestaurantDetailsScreen({super.key, required this.restaurante});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade700, Colors.lightBlue.shade200],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTopBar(context),
                  const SizedBox(height: 20),
                  // 3. TEXTO "VISITADOS POR VOCÊ" REMOVIDO
                  _buildRestaurantCard(context, restaurante),
                  const SizedBox(height: 24),
                  const Text('  avaliações do restaurante', style: TextStyle(color: Colors.white, fontSize: 16)),
                  const SizedBox(height: 8),
                  // 4. CARD DE AVALIAÇÃO AGORA USA OS DADOS DO RESTAURANTE
                  _buildReviewCard(restaurante),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    // ...código sem alteração...
    return Row(children: [Container(decoration: BoxDecoration(color: Colors.black.withOpacity(0.2), shape: BoxShape.circle), child: IconButton(icon: const Icon(Icons.arrow_back, color: Colors.white), onPressed: () => Navigator.of(context).pop())), const SizedBox(width: 16), const Text('ComaBem', style: TextStyle(fontFamily: 'Serif', fontSize: 24, color: Colors.white)), const Spacer(), const Icon(Icons.search, color: Colors.white, size: 28)]);
  }

  Widget _buildRestaurantCard(BuildContext context, Map<String, String> restaurante) {
    // ...código sem alteração...
    return Card(color: Colors.white.withOpacity(0.8), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)), child: Padding(padding: const EdgeInsets.all(16.0), child: Column(children: [Container(padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8), decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(20)), child: Text(restaurante['nome']!, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87))), const SizedBox(height: 16), ClipRRect(borderRadius: BorderRadius.circular(10), child: Image.asset('assets/images/${restaurante['imagem']!}', errorBuilder: (context, error, stackTrace) {return Container(height: 150, color: Colors.grey[300], child: const Center(child: Text('Imagem não encontrada!', textAlign: TextAlign.center)));})), const SizedBox(height: 16), Wrap(alignment: WrapAlignment.spaceAround, crossAxisAlignment: WrapCrossAlignment.center, children: [const Text('Latitude: 47.6062'), TextButton(onPressed: () {}, child: const Text('(ver mais)')), const Text('Longitude: -122.3321')])])));
  }


  Widget _buildReviewCard(Map<String, String> restaurante) {
    return Card(
        color: Colors.white.withOpacity(0.7),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    const Icon(Icons.account_circle, size: 40, color: Colors.black54),
                    const SizedBox(width: 8),
                    const Text('Marcos', style: TextStyle(fontWeight: FontWeight.bold)),
                    const Spacer(),
                    ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.grey[400], shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)), padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4), minimumSize: Size.zero),
                        child: const Text('avaliar', style: TextStyle(color: Colors.black87, fontSize: 12)))
                  ]),
                  const SizedBox(height: 8),
                  // 5.
                  Text(restaurante['avaliacao'] ?? 'Este restaurante ainda não possui uma avaliação.'),
                  Row(children: List.generate(5, (index) => const Icon(Icons.star, color: Colors.black87)))
                ])));
  }
}
