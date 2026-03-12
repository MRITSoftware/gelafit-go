import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'tela_digita_cupom_model.dart';
export 'tela_digita_cupom_model.dart';

class TelaDigitaCupomWidget extends StatefulWidget {
  const TelaDigitaCupomWidget({super.key});

  @override
  State<TelaDigitaCupomWidget> createState() => _TelaDigitaCupomWidgetState();
}

class _TelaDigitaCupomWidgetState extends State<TelaDigitaCupomWidget> {
  late TelaDigitaCupomModel _model;

  String _normalizeDocumento(String? value) {
    return (value ?? '').replaceAll(RegExp(r'[^0-9A-Za-z]'), '').toUpperCase();
  }

  bool _cupomDisponivelParaCpf(String? disponibilidade, String? cpf) {
    final disponibilidadeTratada = (disponibilidade ?? '').trim();
    if (disponibilidadeTratada.isEmpty ||
        disponibilidadeTratada.toLowerCase() == 'todas') {
      return true;
    }

    return _normalizeDocumento(disponibilidadeTratada) ==
        _normalizeDocumento(cpf);
  }

  bool _mesmoCupom(String? a, String? b) {
    final cupomA = (a ?? '').trim().toUpperCase();
    final cupomB = (b ?? '').trim().toUpperCase();
    if (cupomA.isEmpty || cupomB.isEmpty) {
      return false;
    }

    return cupomA == cupomB;
  }

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TelaDigitaCupomModel());

    _model.txtInserirCupomTextController ??= TextEditingController();
    _model.txtInserirCupomFocusNode ??= FocusNode();
    _model.txtInserirCupomFocusNode!.addListener(
      () async {
        FFAppState().msgCupom = !(FFAppState().msgCupom ?? true);
        safeSetState(() {});
      },
    );
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return ClipRRect(
      borderRadius: BorderRadius.circular(4.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 4.0,
          sigmaY: 4.0,
        ),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: FutureBuilder<List<CupomdescontoRow>>(
            future: CupomdescontoTable().queryRows(
              queryFn: (q) => q,
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
              List<CupomdescontoRow> ctnPrincipalCupomdescontoRowList =
                  snapshot.data!;

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
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.discount_outlined,
                            color: Color(0xFF80CC28),
                            size: 50.0,
                          ),
                          Text(
                            'CUPOM',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.readexPro(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  fontSize: 25.0,
                                  letterSpacing: 2.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                          Material(
                            color: Colors.transparent,
                            elevation: 3.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  Navigator.pop(context);
                                },
                                child: Icon(
                                  Icons.close_outlined,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  size: 50.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: FutureBuilder<List<CupomdescontoRow>>(
                        future: CupomdescontoTable().queryRows(
                          queryFn: (q) => q.eqOrNull(
                            'cupom',
                            _model.txtInserirCupomTextController.text,
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
                          List<CupomdescontoRow>
                              colunaPrincipalCupomdescontoRowList =
                              snapshot.data!;
                          final cuponsValidosParaCpf =
                              colunaPrincipalCupomdescontoRowList
                                  .where((cupom) => _cupomDisponivelParaCpf(
                                        cupom.disponibilidade,
                                        FFAppState().cpf,
                                      ))
                                  .toList();

                          final colunaPrincipalCupomdescontoRow =
                              cuponsValidosParaCpf.isNotEmpty
                                  ? cuponsValidosParaCpf.first
                                  : null;

                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Form(
                                      key: _model.formKey,
                                      autovalidateMode:
                                          AutovalidateMode.disabled,
                                      child: Visibility(
                                        visible: FFAppState().cupom == false,
                                        child: Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.6,
                                            child: TextFormField(
                                              controller: _model
                                                  .txtInserirCupomTextController,
                                              focusNode: _model
                                                  .txtInserirCupomFocusNode,
                                              onChanged: (_) =>
                                                  EasyDebounce.debounce(
                                                '_model.txtInserirCupomTextController',
                                                Duration(milliseconds: 2000),
                                                () async {
                                                  safeSetState(() {
                                                    _model
                                                        .simpleSearchResults = TextSearch((ctnPrincipalCupomdescontoRowList
                                                                    .map((e) =>
                                                                        e.cupom)
                                                                    .withoutNulls
                                                                    .toList()
                                                                as List)
                                                            .cast<String>()
                                                            .map((str) =>
                                                                TextSearchItem
                                                                    .fromTerms(
                                                                        str,
                                                                        [str]))
                                                            .toList())
                                                        .search(_model
                                                            .txtInserirCupomTextController
                                                            .text)
                                                        .map((r) => r.object)
                                                        .toList();
                                                    ;
                                                  });
                                                  FFAppState().msgCupom = true;
                                                  safeSetState(() {});
                                                },
                                              ),
                                              autofocus: false,
                                              textCapitalization:
                                                  TextCapitalization.characters,
                                              textInputAction:
                                                  TextInputAction.next,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                isDense: true,
                                                hintText:
                                                    'Digite o cupom de desconto',
                                                hintStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .labelMedium
                                                    .override(
                                                      font:
                                                          GoogleFonts.readexPro(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontStyle,
                                                      ),
                                                      fontSize: 16.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .fontStyle,
                                                    ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                filled: true,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                prefixIcon: Icon(
                                                  Icons.attach_money,
                                                ),
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.readexPro(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    fontSize: 16.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                              cursorColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              validator: _model
                                                  .txtInserirCupomTextControllerValidator
                                                  .asValidator(context),
                                              inputFormatters: [
                                                if (!isAndroid && !isiOS)
                                                  TextInputFormatter
                                                      .withFunction(
                                                          (oldValue, newValue) {
                                                    return TextEditingValue(
                                                      selection:
                                                          newValue.selection,
                                                      text: newValue.text
                                                          .toCapitalization(
                                                              TextCapitalization
                                                                  .characters),
                                                    );
                                                  }),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(),
                                  ),
                                ].divide(SizedBox(width: 10.0)),
                              ),
                              if (_mesmoCupom(
                                _model.txtInserirCupomTextController.text,
                                colunaPrincipalCupomdescontoRow?.cupom,
                              ))
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Este cupom é de ${colunaPrincipalCupomdescontoRow?.valor?.toString()}%. Você pagará ',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.readexPro(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            fontSize: 20.0,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                    Text(
                                      'R\$${((double.parse((FFAppState().totalGeral * (1 - ((colunaPrincipalCupomdescontoRow!.valor!) ?? 0) / 100)).toStringAsFixed(2)))).toString()} com o desconto.',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.readexPro(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: Color(0xFF80CC28),
                                            fontSize: 20.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ],
                                ),
                              if ((_model.txtInserirCupomTextController.text !=
                                      '') &&
                                  (colunaPrincipalCupomdescontoRow == null))
                                Text(
                                  'Ops! Não encontramos este cupom. Confira se digitou corretamente.',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.readexPro(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              if (_model.txtInserirCupomTextController.text ==
                                      '')
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Digite o cupom e ',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.readexPro(
                                              fontWeight: FontWeight.normal,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            fontSize: 24.0,
                                            letterSpacing: 1.0,
                                            fontWeight: FontWeight.normal,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                    Text(
                                      'aguarde a validação.',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.readexPro(
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            fontSize: 24.0,
                                            letterSpacing: 1.0,
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ],
                                ),
                              FutureBuilder<List<GelaFitUsuariosCuponsRow>>(
                                future:
                                    GelaFitUsuariosCuponsTable().querySingleRow(
                                  queryFn: (q) => q
                                      .eqOrNull(
                                        'cupom',
                                        _model
                                            .txtInserirCupomTextController.text,
                                      )
                                      .eqOrNull(
                                        'CPF',
                                        FFAppState().cpf,
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
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            Color(0xFF80CC28),
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<GelaFitUsuariosCuponsRow>
                                      containerGelaFitUsuariosCuponsRowList =
                                      snapshot.data!;

                                  final containerGelaFitUsuariosCuponsRow =
                                      containerGelaFitUsuariosCuponsRowList
                                              .isNotEmpty
                                          ? containerGelaFitUsuariosCuponsRowList
                                              .first
                                          : null;

                                  return Container(
                                    decoration: BoxDecoration(),
                                    child: Visibility(
                                      visible: _mesmoCupom(
                                        _model.txtInserirCupomTextController
                                            .text,
                                        colunaPrincipalCupomdescontoRow?.cupom,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 16.0, 8.0, 0.0),
                                        child: FutureBuilder<
                                            List<GelaFitClientesRow>>(
                                          future: GelaFitClientesTable()
                                              .querySingleRow(
                                            queryFn: (q) => q.eqOrNull(
                                              'cpf',
                                              FFAppState().cpf,
                                            ),
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  child:
                                                      CircularProgressIndicator(
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                            Color>(
                                                      Color(0xFF80CC28),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                            List<GelaFitClientesRow>
                                                btnUsarCupomGelaFitClientesRowList =
                                                snapshot.data!;

                                            final btnUsarCupomGelaFitClientesRow =
                                                btnUsarCupomGelaFitClientesRowList
                                                        .isNotEmpty
                                                    ? btnUsarCupomGelaFitClientesRowList
                                                        .first
                                                    : null;

                                            return FFButtonWidget(
                                              onPressed: () async {
                                                if (_model.formKey
                                                            .currentState ==
                                                        null ||
                                                    !_model
                                                        .formKey.currentState!
                                                        .validate()) {
                                                  return;
                                                }
                                                var confirmDialogResponse =
                                                    await showDialog<bool>(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              content: Text(
                                                                  'Deseja aplicar o cupom?'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext,
                                                                          false),
                                                                  child: Text(
                                                                      'Cancelar'),
                                                                ),
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext,
                                                                          true),
                                                                  child: Text(
                                                                      'Aplicar cupom'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        ) ??
                                                        false;
                                                if (confirmDialogResponse) {
                                                  if (_mesmoCupom(
                                                    colunaPrincipalCupomdescontoRow
                                                        ?.cupom,
                                                    _model
                                                        .txtInserirCupomTextController
                                                        .text,
                                                  )) {
                                                    if (_cupomDisponivelParaCpf(
                                                      colunaPrincipalCupomdescontoRow
                                                          ?.disponibilidade,
                                                      FFAppState().cpf,
                                                    )) {
                                                      if ((containerGelaFitUsuariosCuponsRow
                                                                  ?.cupom ==
                                                              _model
                                                                  .txtInserirCupomTextController
                                                                  .text) &&
                                                          (FFAppState().cpf ==
                                                              containerGelaFitUsuariosCuponsRow
                                                                  ?.cpf)) {
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              title: Text(
                                                                  'Atenção'),
                                                              content: Text(
                                                                  'Este cupom já foi utilizado em sua conta.'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext),
                                                                  child: Text(
                                                                      'Ok'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        );
                                                        safeSetState(() {
                                                          _model
                                                              .txtInserirCupomTextController
                                                              ?.clear();
                                                        });
                                                      } else {
                                                        if (colunaPrincipalCupomdescontoRow
                                                                ?.unico ==
                                                            's') {
                                                          await GelaFitUsuariosCuponsTable()
                                                              .insert({
                                                            'CPF': FFAppState()
                                                                .cpf,
                                                            'cupom': _model
                                                                .txtInserirCupomTextController
                                                                .text,
                                                            'valorCupom':
                                                                colunaPrincipalCupomdescontoRow
                                                                    ?.valor,
                                                          });
                                                          await GelaFitClientesTable()
                                                              .update(
                                                            data: {
                                                              'cupom': _model
                                                                  .txtInserirCupomTextController
                                                                  .text,
                                                            },
                                                            matchingRows:
                                                                (rows) => rows
                                                                    .eqOrNull(
                                                              'cpf',
                                                              FFAppState().cpf,
                                                            ),
                                                          );
                                                          await CupomdescontoTable()
                                                              .delete(
                                                            matchingRows:
                                                                (rows) => rows
                                                                    .eqOrNull(
                                                              'cupom',
                                                              _model
                                                                  .txtInserirCupomTextController
                                                                  .text,
                                                            ),
                                                          );
                                                          FFAppState()
                                                              .totalGeral = (double.parse((FFAppState()
                                                                      .totalGeral *
                                                                  (1 -
                                                                      ((colunaPrincipalCupomdescontoRow!.valor!) ??
                                                                              0) /
                                                                          100))
                                                              .toStringAsFixed(
                                                                  2)));
                                                          FFAppState().cupom =
                                                              true;
                                                          FFAppState()
                                                              .msgCupom = false;
                                                          FFAppState()
                                                                  .cupomInserido =
                                                              _model
                                                                  .txtInserirCupomTextController
                                                                  .text;
                                                          safeSetState(() {});
                                                          await actions
                                                              .aplicaCupom(
                                                            colunaPrincipalCupomdescontoRow
                                                                .valor!
                                                                .toDouble(),
                                                            colunaPrincipalCupomdescontoRow
                                                                .cupom!,
                                                          );
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (alertDialogContext) {
                                                              return AlertDialog(
                                                                title: Text(
                                                                    'Sucesso'),
                                                                content: Text(
                                                                    'Seu cupom de ${colunaPrincipalCupomdescontoRow.valor?.toString()}% foi aplicado com sucesso.'),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            alertDialogContext),
                                                                    child: Text(
                                                                        'Continuar'),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          );
                                                        } else {
                                                          await GelaFitUsuariosCuponsTable()
                                                              .insert({
                                                            'CPF': FFAppState()
                                                                .cpf,
                                                            'cupom': _model
                                                                .txtInserirCupomTextController
                                                                .text,
                                                            'valorCupom':
                                                                colunaPrincipalCupomdescontoRow
                                                                    ?.valor,
                                                          });
                                                          await GelaFitClientesTable()
                                                              .update(
                                                            data: {
                                                              'cupom': _model
                                                                  .txtInserirCupomTextController
                                                                  .text,
                                                            },
                                                            matchingRows:
                                                                (rows) => rows
                                                                    .eqOrNull(
                                                              'cpf',
                                                              FFAppState().cpf,
                                                            ),
                                                          );
                                                          FFAppState()
                                                              .totalGeral = (double.parse((FFAppState()
                                                                      .totalGeral *
                                                                  (1 -
                                                                      ((colunaPrincipalCupomdescontoRow!.valor!) ??
                                                                              0) /
                                                                          100))
                                                              .toStringAsFixed(
                                                                  2)));
                                                          FFAppState().cupom =
                                                              true;
                                                          FFAppState()
                                                              .msgCupom = false;
                                                          FFAppState()
                                                                  .cupomInserido =
                                                              _model
                                                                  .txtInserirCupomTextController
                                                                  .text;
                                                          safeSetState(() {});
                                                          await actions
                                                              .aplicaCupom(
                                                            colunaPrincipalCupomdescontoRow
                                                                .valor!
                                                                .toDouble(),
                                                            colunaPrincipalCupomdescontoRow
                                                                .cupom!,
                                                          );
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (alertDialogContext) {
                                                              return AlertDialog(
                                                                title: Text(
                                                                    'Sucesso'),
                                                                content: Text(
                                                                    'Seu cupom de ${colunaPrincipalCupomdescontoRow.valor?.toString()}% foi aplicado com sucesso.'),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            alertDialogContext),
                                                                    child: Text(
                                                                        'Continuar'),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          );
                                                        }
                                                      }
                                                    } else {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            title:
                                                                Text('Atenção'),
                                                            content: Text(
                                                                'Este cupom não existe ou não está mais disponível.'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child:
                                                                    Text('Ok'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    }
                                                  } else {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          content: Text(
                                                              'Este cupom não existe ou não está mais disponível.'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext),
                                                              child: Text('Ok'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                    safeSetState(() {
                                                      _model
                                                          .txtInserirCupomTextController
                                                          ?.clear();
                                                    });
                                                  }

                                                  Navigator.pop(context);
                                                }
                                              },
                                              text: 'USAR CUPOM',
                                              options: FFButtonOptions(
                                                width: double.infinity,
                                                height: 60.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color: valueOrDefault<Color>(
                                                  (_model.txtInserirCupomTextController
                                                                      .text !=
                                                                  '') &&
                                                          (_model.txtInserirCupomTextController
                                                                  .text ==
                                                              colunaPrincipalCupomdescontoRow
                                                                  ?.cupom)
                                                      ? Color(0xFF80CC28)
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .secondary,
                                                  Color(0xFF39D2C0),
                                                ),
                                                textStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .titleSmall
                                                    .override(
                                                      font:
                                                          GoogleFonts.readexPro(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .fontStyle,
                                                      ),
                                                      color: Colors.black,
                                                      fontSize: 20.0,
                                                      letterSpacing: 2.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontStyle,
                                                    ),
                                                elevation: 0.0,
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 0.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(24.0),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ].divide(SizedBox(height: 10.0)),
                          );
                        },
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 8.0),
                          child: Text(
                            '© MRIT',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.readexPro(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context).success,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
