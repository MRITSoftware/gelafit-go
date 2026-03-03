import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/paginas_produtos/continuar_comprando/continuar_comprando_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'add_carrinho_ver_produto_model.dart';
export 'add_carrinho_ver_produto_model.dart';

class AddCarrinhoVerProdutoWidget extends StatefulWidget {
  const AddCarrinhoVerProdutoWidget({
    super.key,
    required this.nomeproduto,
    required this.imagem,
    required this.preco,
    required this.id,
    required this.qtd,
  });

  final String? nomeproduto;
  final String? imagem;
  final double? preco;
  final int? id;
  final int? qtd;

  @override
  State<AddCarrinhoVerProdutoWidget> createState() =>
      _AddCarrinhoVerProdutoWidgetState();
}

class _AddCarrinhoVerProdutoWidgetState
    extends State<AddCarrinhoVerProdutoWidget> {
  late AddCarrinhoVerProdutoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddCarrinhoVerProdutoModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.totalitem2 = widget.preco;
      safeSetState(() {});
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<List<GelaFitSuzanoRow>>(
      future: GelaFitSuzanoTable().querySingleRow(
        queryFn: (q) => q.eqOrNull(
          'id',
          widget.id,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Color(0xFF80CC28),
                ),
              ),
            ),
          );
        }
        List<GelaFitSuzanoRow> blurGelaFitSuzanoRowList = snapshot.data!;

        final blurGelaFitSuzanoRow = blurGelaFitSuzanoRowList.isNotEmpty
            ? blurGelaFitSuzanoRowList.first
            : null;

        return ClipRRect(
          borderRadius: BorderRadius.circular(4.0),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 2.0,
              sigmaY: 2.0,
            ),
            child: FutureBuilder<List<PlacasGelaFitRow>>(
              future: PlacasGelaFitTable().querySingleRow(
                queryFn: (q) => q.eqOrNull(
                  'idemail',
                  currentUserUid,
                ),
              ),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 50.0,
                      height: 50.0,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Color(0xFF80CC28),
                        ),
                      ),
                    ),
                  );
                }
                List<PlacasGelaFitRow> ctnPrincipalPlacasGelaFitRowList =
                    snapshot.data!;

                final ctnPrincipalPlacasGelaFitRow =
                    ctnPrincipalPlacasGelaFitRowList.isNotEmpty
                        ? ctnPrincipalPlacasGelaFitRowList.first
                        : null;

                return Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5.0,
                        color: Color(0x3B1D2429),
                        offset: Offset(
                          0.0,
                          -3.0,
                        ),
                      )
                    ],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0),
                      topLeft: Radius.circular(16.0),
                      topRight: Radius.circular(16.0),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            FlutterFlowIconButton(
                              borderRadius: 8.0,
                              buttonSize: 80.0,
                              icon: Icon(
                                Icons.close,
                                color: FlutterFlowTheme.of(context).secondary,
                                size: 60.0,
                              ),
                              onPressed: () async {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4.0),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaX: 4.0,
                              sigmaY: 4.0,
                            ),
                            child: Material(
                              color: Colors.transparent,
                              elevation: 3.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.network(
                                          '${widget.imagem}',
                                          width: 250.0,
                                          height: 250.0,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      Text(
                                        valueOrDefault<String>(
                                          widget.nomeproduto,
                                          '-',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.readexPro(
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              fontSize: 25.0,
                                              letterSpacing: 1.0,
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                      Text(
                                        formatNumber(
                                          widget.preco,
                                          formatType: FormatType.custom,
                                          currency: 'R\$',
                                          format: '#,##0.00',
                                          locale: 'pt-br',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.readexPro(
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              fontSize: 25.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ]
                                        .divide(SizedBox(height: 10.0))
                                        .around(SizedBox(height: 10.0)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Builder(
                          builder: (context) => FFButtonWidget(
                            onPressed: () async {
                              Navigator.pop(context);
                              await showDialog(
                                context: context,
                                builder: (dialogContext) {
                                  return Dialog(
                                    elevation: 0,
                                    insetPadding: EdgeInsets.zero,
                                    backgroundColor: Colors.transparent,
                                    alignment: AlignmentDirectional(0.0, 0.0)
                                        .resolve(Directionality.of(context)),
                                    child: ContinuarComprandoWidget(),
                                  );
                                },
                              );

                              FFAppState().deviceidplaca =
                                  ctnPrincipalPlacasGelaFitRow!.deviceId!;
                              safeSetState(() {});
                              FFAppState().addToItensSacola(DtprodutosStruct(
                                id: widget.id,
                                nomeProduto: widget.nomeproduto,
                                preco: widget.preco,
                                imagem: widget.imagem,
                                quantidadeEscolhida: 1,
                                total: _model.totalitem2,
                                quantidadeNova: widget.qtd,
                                quantidadeAntiga: widget.qtd,
                              ));
                              FFAppState().totalGeral =
                                  FFAppState().totalGeral + _model.totalitem2!;
                              FFAppState().addToDtDados(DtprodutosStruct(
                                imagem: widget.imagem,
                                nomeProduto: widget.nomeproduto,
                                preco: _model.totalitem2,
                                quantidadeEscolhida: 1,
                              ));
                              FFAppState().addToDtDadosRelatorio(DtDadosStruct(
                                nomeProduto: widget.nomeproduto,
                                valor: _model.totalitem2,
                                quantidade: 1,
                                imagem: widget.imagem,
                                userId: currentUserEmail,
                                unidade:
                                    ctnPrincipalPlacasGelaFitRow.unidgelafit,
                                cliente: FFAppState().nomecliente,
                                cPFCliente: FFAppState().cpf,
                                franquia:
                                    ctnPrincipalPlacasGelaFitRow.idFranquia,
                              ));
                              safeSetState(() {});
                              _model.varDados2 = DtDadosStruct(
                                quantidade: 1,
                                nomeProduto: widget.nomeproduto,
                                valor: FFAppState().totalGeral,
                                imagem: widget.imagem,
                                userId: currentUserEmail,
                              );
                              safeSetState(() {});
                              await actions.baixarEstoqueRpc(
                                widget.id!,
                                1,
                              );
                              ScaffoldMessenger.of(context).clearSnackBars();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    '${widget.nomeproduto} adicionado ao carrinho',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18.0,
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor: Color(0xFF80CC28),
                                ),
                              );
                            },
                            text: 'Adicionar ao carrinho',
                            icon: Icon(
                              Icons.shopping_cart,
                              size: 30.0,
                            ),
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 80.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconAlignment: IconAlignment.start,
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: Color(0xFF80CC28),
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    font: GoogleFonts.readexPro(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontStyle,
                                    ),
                                    color: Colors.black,
                                    fontSize: 24.0,
                                    letterSpacing: 1.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .fontStyle,
                                  ),
                              elevation: 2.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                          ),
                        ),
                      ]
                          .divide(SizedBox(height: 20.0))
                          .around(SizedBox(height: 20.0)),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
