import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

List<CupomdescontoRow>? filtrarCuponsNaoUsados(
  List<CupomdescontoRow>? cuponsDisponiveis,
  List<GelaFitUsuariosCuponsRow>? cuponsUsados,
) {
  if (cuponsDisponiveis == null || cuponsDisponiveis.isEmpty) {
    return [];
  }

  // Monta um set com todos os cupons já usados pelo CPF (case-insensitive)
  final usadosSet = <String>{};
  if (cuponsUsados != null && cuponsUsados.isNotEmpty) {
    for (final r in cuponsUsados) {
      final codigo = (r.cupom ?? '').trim().toLowerCase();
      if (codigo.isNotEmpty) {
        usadosSet.add(codigo);
      }
    }
  }

  // Filtra e retorna somente os cupons que NÃO estão no set de usados
  final resultado = <CupomdescontoRow>[];
  for (final cupom in cuponsDisponiveis) {
    final codigo = (cupom.cupom ?? '').trim();
    final disponibilidade = (cupom.disponibilidade ?? '').trim().toLowerCase();
    if (codigo.isEmpty) continue;

    final exibivelNaLista =
        disponibilidade.isEmpty || disponibilidade == 'todas';

    if (exibivelNaLista && !usadosSet.contains(codigo.toLowerCase())) {
      resultado.add(cupom);
    }
  }

  return resultado;
}
