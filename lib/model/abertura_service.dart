// Exemplo de lógica de abertura para integração com o app
// Pode ser colocado em lib/model/abertura_service.dart

import 'produto.dart';

class Placa {
  final String deviceId;
  final String localKey;
  final String tipo; // 'geladeira' ou 'armario'

  Placa({
    required this.deviceId,
    required this.localKey,
    required this.tipo,
  });
}

// Mock de placas
final placas = [
  Placa(deviceId: 'GELADEIRA123', localKey: 'key_geladeira', tipo: 'geladeira'),
  Placa(deviceId: 'ARMARIO456', localKey: 'key_armario', tipo: 'armario'),
];

// Função para abrir a placa (mock)
Future<void> abrirPlaca(Placa placa) async {
  print('Abrindo ${placa.tipo} (deviceId: ${placa.deviceId})');
  // Aqui você integraria com abrirGeladeiraComRetry ou similar
  await Future.delayed(Duration(seconds: 2));
  print('${placa.tipo} aberta!');
}

// Função principal de fluxo de abertura
Future<void> fluxoAberturaComEscolha(List<Produto> carrinho, {Function(String)? onEscolha}) async {
  final temGeladeira = carrinho.any((p) => p.localizacao == 'geladeira');
  final temArmario = carrinho.any((p) => p.localizacao == 'armario');

  if (temGeladeira && temArmario) {
    // Simula escolha do usuário (pode ser substituído por UI real)
    final escolha = onEscolha != null ? await onEscolha('Qual deseja abrir primeiro? (geladeira/armario)') : 'geladeira';
    if (escolha == 'geladeira') {
      await abrirPlaca(placas.firstWhere((p) => p.tipo == 'geladeira'));
      await abrirPlaca(placas.firstWhere((p) => p.tipo == 'armario'));
    } else {
      await abrirPlaca(placas.firstWhere((p) => p.tipo == 'armario'));
      await abrirPlaca(placas.firstWhere((p) => p.tipo == 'geladeira'));
    }
  } else if (temGeladeira) {
    await abrirPlaca(placas.firstWhere((p) => p.tipo == 'geladeira'));
  } else if (temArmario) {
    await abrirPlaca(placas.firstWhere((p) => p.tipo == 'armario'));
  } else {
    print('Carrinho vazio. Nada para abrir.');
  }
}
