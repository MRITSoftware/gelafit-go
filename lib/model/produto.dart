// Exemplo de estrutura para suportar produtos de geladeira e armário
// Pode ser colocado em lib/model/produto.dart

class Produto {
  final String id;
  final String nome;
  final double preco;
  final String localizacao; // 'geladeira' ou 'armario'
  final String deviceId; // id da placa responsável
  final int quantidade;

  Produto({
    required this.id,
    required this.nome,
    required this.preco,
    required this.localizacao,
    required this.deviceId,
    required this.quantidade,
  });
}

// Mock de placas
final placaGeladeira = {
  'deviceId': 'GELADEIRA123',
  'localKey': 'key_geladeira',
  // outros campos se necessário
};
final placaArmario = {
  'deviceId': 'ARMARIO456',
  'localKey': 'key_armario',
  // outros campos se necessário
};

// Mock de produtos
final produtos = [
  Produto(
    id: '1',
    nome: 'Água',
    preco: 3.0,
    localizacao: 'geladeira',
    deviceId: placaGeladeira['deviceId']!,
    quantidade: 1,
  ),
  Produto(
    id: '2',
    nome: 'Barra de Cereal',
    preco: 5.0,
    localizacao: 'armario',
    deviceId: placaArmario['deviceId']!,
    quantidade: 1,
  ),
];

// Carrinho de compras
List<Produto> carrinho = [];

// Função para verificar de onde são os produtos do carrinho
enum LocalRetirada { geladeira, armario, ambos, nenhum }

LocalRetirada getLocalRetirada(List<Produto> carrinho) {
  final temGeladeira = carrinho.any((p) => p.localizacao == 'geladeira');
  final temArmario = carrinho.any((p) => p.localizacao == 'armario');
  if (temGeladeira && temArmario) return LocalRetirada.ambos;
  if (temGeladeira) return LocalRetirada.geladeira;
  if (temArmario) return LocalRetirada.armario;
  return LocalRetirada.nenhum;
}

// Exemplo de uso após pagamento
void fluxoAbertura(List<Produto> carrinho) {
  final local = getLocalRetirada(carrinho);
  switch (local) {
    case LocalRetirada.geladeira:
      print('Abrir geladeira');
      // chamar função de abertura da geladeira
      break;
    case LocalRetirada.armario:
      print('Abrir armário');
      // chamar função de abertura do armário
      break;
    case LocalRetirada.ambos:
      print('Perguntar ao usuário qual abrir primeiro');
      // mostrar tela/modal de escolha
      break;
    case LocalRetirada.nenhum:
      print('Carrinho vazio');
      break;
  }
}
